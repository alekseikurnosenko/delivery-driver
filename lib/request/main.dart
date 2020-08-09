import 'package:delivery_driver/components/actionButton.dart';
import 'package:delivery_driver/home/homePage.dart';
import 'package:delivery_driver/iocContainer.dart';
import 'package:delivery_driver/request/map.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart'
    hide widget;
import 'package:openapi/model/address.dart';

part 'main.g.dart';

@swidget
Widget _requestInfo(BuildContext context, Address pickup, Address dropoff) =>
    Container(
      child: Column(
        children: <Widget>[
          Column(children: <Widget>[
            Text(
              "Pickup at",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(pickup.address)
          ]),
          Container(
            height: 8,
          ),
          Column(
            children: <Widget>[
              Text("Deliver to", style: TextStyle(fontWeight: FontWeight.bold)),
              Text(dropoff.address)
            ],
          )
        ],
      ),
    );

class RequestPageArguments {
  final String orderId;
  final Address pickup;
  final Address dropoff;

  RequestPageArguments(this.orderId, this.pickup, this.dropoff); 
}

@hwidget
Widget requestPage(BuildContext context) {
  RequestPageArguments args = ModalRoute.of(context).settings.arguments;
  if (args == null) {
    throw Exception("No arguments passed");
  }

  var acceptButtonState = useState(ButtonState.normal());
  var rejectButtonState = useState(ButtonState.normal());

  var onAcceptRequest = () async {
    acceptButtonState.value = ButtonState.loading();
    rejectButtonState.value = ButtonState.disabled();

    try {
      var courier = await IocContainer().courierRepository.observe().first;
      IocContainer()
          .api
          .getCouriersApi()
          .acceptDeliveryRequest(courier.id, args.orderId);

      Navigator.of(context).pop();
    } catch (e) {
      acceptButtonState.value = ButtonState.normal();
      rejectButtonState.value = ButtonState.normal();
      // TODO: Show error
    }
  };

  var onRejectRequest = () async {
    acceptButtonState.value = ButtonState.disabled();
    rejectButtonState.value = ButtonState.loading();

    try {
      var courier = await IocContainer().courierRepository.observe().first;
      IocContainer()
          .api
          .getCouriersApi()
          .rejectDeliveryRequest(courier.id, args.orderId);

      Navigator.of(context).pop();
    } catch (e) {
      acceptButtonState.value = ButtonState.normal();
      rejectButtonState.value = ButtonState.normal();
      // TODO: Show error
    }
  };

  return Scaffold(
      body: Stack(children: [
    Map(
        pickup: args.pickup.location,
        dropoff: args.dropoff.location,
        padding: EdgeInsets.only(
            bottom: 210)), // Need to somehow get widget size here
    Column(children: <Widget>[
      Expanded(child: Container()),
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
              _RequestInfo(args.pickup, args.dropoff),
              Container(height: 8),
              ActionButton(
                  onPressed: onAcceptRequest,
                  state: acceptButtonState.value,
                  label: Text("Accept request")),
              ActionButton(
                  onPressed: onRejectRequest,
                  label: Text("Reject request"),
                  style: ButtonStyle.secondary(),
                  state: rejectButtonState.value),
            ]),
      )
    ])
  ]));
}
