import 'dart:convert';

import 'package:delivery_driver/home/homeBloc.dart';
import 'package:delivery_driver/profile/main.dart';
import 'package:delivery_driver/request/main.dart';
import 'package:delivery_driver/websocketClient.dart';
import 'package:flutter/material.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:openapi/api.dart' as API;
import 'package:web_socket_channel/io.dart';

import '../iocContainer.dart';
import '../main.dart';
import 'earnings.dart';
import 'map.dart';

part 'main.g.dart';

@widget
Widget profileWidget(BuildContext context, String initials) => GestureDetector(
    onTap: () => {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => ProfilePage()))
        },
    child: Stack(children: [
      Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
          ),
          child: Center(
              child:
                  Text(initials, style: Theme.of(context).textTheme.button))),
      Container(
        width: 44,
        height: 44,
        margin: EdgeInsets.all(2),
        decoration: BoxDecoration(
            shape: BoxShape.circle, border: Border.all(color: Colors.black)),
      )
    ]));

@widget
Widget topPanel() => Container(
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
              child: ProfileWidget("GG")))
    ]));

@widget
Widget bottomPanel(BuildContext context, HomeBloc bloc) => StreamBuilder<bool>(
    stream: bloc.isOnShift,
    initialData: false,
    builder: (context, isOnShift) => Column(children: [
          Container(
            margin: EdgeInsets.only(bottom: 16),
            child: FloatingActionButton.extended(
                label: Text(isOnShift.data ? "Go offline" : "Go online"),
                onPressed: () async {
                  API.DeliveryRequested request = API.DeliveryRequested();
                  request.pickup = API.Address();
                  request.pickup.location = API.LatLng()..latitude=2..longitude=2;
                  request.pickup.address = "Some street";
                  request.dropoff = API.Address();
                  request.dropoff.location = API.LatLng()..latitude=3..longitude=3;
                  request.dropoff.address = "Some other street";
Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => RequestPage(request: request)));

                  return;
                  if (isOnShift.data) {
                    bloc.stopShift();
                  } else {
                    bloc.startShift();
                  }
                  // Navigator.of(context).push(
                  //     MaterialPageRoute(builder: (context) => RequestPage()));
                }),
          ),
          Container(
            height: 56,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16))),
            alignment: Alignment.center,
            child: Text(isOnShift.data ? "You are online" : "You are offline",
                style: Theme.of(context).textTheme.headline6),
          )
        ]));

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  HomeBloc bloc = HomeBloc(courierRepository: IocContainer().courierRepository);
  final WebsocketClient websocketClient = WebsocketClient();

  @override
  void initState() {
    super.initState();
    websocketClient.events.listen((event) {
      if (event is API.DeliveryRequested) {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => RequestPage()));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
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
}
