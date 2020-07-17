import 'package:delivery_driver/components/actionButton.dart';
import 'package:delivery_driver/iocContainer.dart';
import 'package:delivery_driver/request/map.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart'
    hide widget;
import 'package:openapi/api.dart';

part 'main.g.dart';

@swidget
Widget _requestInfo(BuildContext context, DeliveryRequested request) =>
    Container(
      child: Column(
        children: <Widget>[
          Column(children: <Widget>[
            Text(
              "Pickup at",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(request.pickup.address)
          ]),
          Container(
            height: 8,
          ),
          Column(
            children: <Widget>[
              Text("Deliver to", style: TextStyle(fontWeight: FontWeight.bold)),
              Text(request.dropoff.address)
            ],
          )
        ],
      ),
    );

@hwidget
Widget _bottomSheetContainer(BuildContext context, DeliveryRequested request) {
  var acceptButtonState = useState(ButtonState.normal());
  var rejectButtonState = useState(ButtonState.normal());

  var orderId = "1";
  var onAcceptRequest = () async {
    acceptButtonState.value = ButtonState.loading();
    rejectButtonState.value = ButtonState.disabled();

    try {
      var courier = await IocContainer().courierRepository.observe().first;
      CouriersApi().acceptDeliveryRequest(courier.id, request.orderId);

      Navigator.of(context).pop();
    } catch (e) {
      acceptButtonState.value = ButtonState.normal();
      rejectButtonState.value = ButtonState.normal();
      // Show error
    }
  };

  var onRejectRequest = () async {
    acceptButtonState.value = ButtonState.disabled();
    rejectButtonState.value = ButtonState.loading();

    try {
      var courier = await IocContainer().courierRepository.observe().first;
      CouriersApi().rejectDeliveryRequest(courier.id, request.orderId);
      
      Navigator.of(context).pop();
    } catch (e) {
      acceptButtonState.value = ButtonState.normal();
      rejectButtonState.value = ButtonState.normal();
      // Show error
    }
  };

  return _BottomSheet(request, acceptButtonState.value, rejectButtonState.value,
      onAcceptRequest, onRejectRequest);
}

@swidget
Widget _bottomSheet(
        DeliveryRequested request,
        ButtonState acceptButtonState,
        ButtonState rejectButtonState,
        Function onAcceptRequest,
        Function onRejectRequest) =>
    Container(
        decoration: BoxDecoration(
            boxShadow: [BoxShadow(blurRadius: 10, color: Colors.grey)],
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16), topRight: Radius.circular(16))),
        padding: EdgeInsets.all(16),
        alignment: Alignment.center,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              _RequestInfo(request),
              Container(height: 8),
              ActionButton(
                  onPressed: onAcceptRequest,
                  state: acceptButtonState,
                  label: Text("Accept request")),
              ActionButton(
                  onPressed: onRejectRequest,
                  label: Text("Reject request"),
                  style: ButtonStyle.secondary(),
                  state: rejectButtonState),
            ]));

@swidget
Widget requestPage(DeliveryRequested request) {
  return Scaffold(
      body: Stack(children: [
    Map(
        pickup: request.pickup.location,
        dropoff: request.dropoff.location,
        padding: EdgeInsets.only(
            bottom: 210)), // Need to somehow get widget size here
    Column(
      children: <Widget>[
        Expanded(child: Container()),
        _BottomSheetContainer(request)
      ],
    )
  ]));
}
