import 'package:delivery_driver/components/actionButton.dart';
import 'package:delivery_driver/home/earnings.dart';
import 'package:delivery_driver/home/homeBloc.dart';
import 'package:delivery_driver/home/map.dart';
import 'package:delivery_driver/home/profileWidget.dart';
import 'package:delivery_driver/pickup/pickupPage.dart';
import 'package:delivery_driver/request/main.dart';
import 'package:delivery_driver/websocketClient.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:openapi/api.dart';

import '../iocContainer.dart';

part 'homePage.g.dart';

DeliveryRequested buildMockDeliveryRequested() {
  DeliveryRequested request = DeliveryRequested();
  request.pickup = Address();
  request.pickup.location = LatLng()
    ..latitude = 2
    ..longitude = 2;
  request.pickup.address = "Some street";
  request.dropoff = Address();
  request.dropoff.location = LatLng()
    ..latitude = 3
    ..longitude = 3;
  request.dropoff.address = "Some other street";
  return request;
}

OrderAssigned buildMockOrderAssigned() {
  var event = OrderAssigned();
  event.orderId = "orderId";
  event.restaurantName = "Restaurant";
  event.restaurantAddress = Address()..address = "Restaurant address";
  event.restaurantAddress.location = LatLng()
    ..latitude = 2.0
    ..longitude = 2.0;
  event.status = OrderStatus.preparing_;
  return event;
}

@hwidget
Widget topPanel() {
  var courier =
      useStream(useMemoized(() => IocContainer().courierRepository.observe()));

  return Container(
      margin: EdgeInsets.only(top: 16),
      child: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
        Expanded(flex: 1, child: Container()),
        Expanded(
          flex: 1,
          child: Container(
              margin: EdgeInsets.only(top: 0),
              child: Center(child: EarningsPill())),
        ),
        Expanded(
            flex: 1,
            child: Container(
                margin: EdgeInsets.only(right: 16),
                alignment: Alignment.centerRight,
                child: ProfileWidget(courier.data)))
      ]));
}

@hwidget
Widget bottomPanel(BuildContext context, HomeBloc bloc) {
  var isOnShift = useStream(useMemoized(() => bloc.isOnShift));

  var buttonState =
      isOnShift.hasData ? ButtonState.normal() : ButtonState.loading();
  var buttonLabel = isOnShift.hasData
      ? Text(isOnShift.data ? "Go offline" : "Go online")
      : null;
  var textLabel = isOnShift.hasData
      ? Text(isOnShift.data ? "You are online" : "You are offline",
          style: Theme.of(context).textTheme.headline6)
      : null;

  return Column(children: [
    Container(
      margin: EdgeInsets.only(bottom: 16),
      child: ActionButton(
          state: buttonState,
          label: buttonLabel,
          onPressed: () async {
            if (isOnShift.data) {
              bloc.stopShift();
            } else {
              bloc.startShift();
            }
          }),
    ),
    Container(
        height: 56,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16), topRight: Radius.circular(16))),
        alignment: Alignment.center,
        child: textLabel)
  ]);
}

@hwidget
Widget homePage(BuildContext context) {
  HomeBloc bloc = useMemoized(
      () => HomeBloc(courierRepository: IocContainer().courierRepository));

  useEffect(() {
    final WebsocketClient websocketClient = WebsocketClient();

    websocketClient.events.listen((event) {
      if (event is DeliveryRequested) {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => RequestPage(event)));
      } else if (event is OrderAssigned) {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => PickupPage(event)));
      }
    });

    return;
  });
  return SafeArea(
      child: Stack(children: [
    MapWidget(),
    Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
      TopPanel(),
      Expanded(child: Container()),
      BottomPanel(bloc)
    ]),
  ]));
}
