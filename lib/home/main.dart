import 'dart:async';
import 'package:delivery_driver/profile/main.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:openapi/api.dart' as API;
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'earnings.dart';

part 'main.g.dart';

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
              child: ProfileWidget()))
    ]));

@widget
Widget bottomPanel(BuildContext context) => Column(children: [
      Container(
        margin: EdgeInsets.only(bottom: 16),
        child: FloatingActionButton.extended(
            label: Text("Go online"),
            onPressed: () async {
              // TODO: get valid courier token by running SIM.
              API.CouriersApi courierAPI = API.CouriersApi();
              API.Courier courier = await courierAPI.ownCourier();
              print(courier.fullName);
            }),
      ),
      Container(
        height: 56,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16), topRight: Radius.circular(16))),
        alignment: Alignment.center,
        child: Text("You are offline",
            style: Theme.of(context).textTheme.headline6),
      )
    ]);

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Stack(children: [
      MapWidget(),
      Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        TopPanel(),
        Expanded(child: Container()),
        BottomPanel()
      ]),
    ]));
  }
}

class ProfileWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ProfilePage()))
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
                      Text("GG", style: Theme.of(context).textTheme.button))),
          Container(
            width: 44,
            height: 44,
            margin: EdgeInsets.all(2),
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.black)),
          )
        ]));
  }
}

class MapWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MapWidgetState();
  }
}

class _MapWidgetState extends State<MapWidget> {
  Completer<GoogleMapController> _controller = Completer();
  LatLng _center = const LatLng(45.521563, -122.677433);

  @override
  void initState() {
    super.initState();

    Geolocator().getPositionStream().first.then((value) async {
      LatLng lastPosition = LatLng(value.latitude, value.longitude);
      GoogleMapController controller = await _controller.future;
      controller.moveCamera(CameraUpdate.newLatLngZoom(lastPosition, 11));
    });
  }

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
        mapToolbarEnabled: false,
        myLocationButtonEnabled: false,
        zoomControlsEnabled: false,
        myLocationEnabled: true,
        onMapCreated: (controller) => _controller.complete(controller),
        initialCameraPosition: CameraPosition(target: _center, zoom: 11));
  }
}
