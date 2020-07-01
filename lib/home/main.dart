import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'earnings.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Stack(children: [
      MapWidget(),
      Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        Container(
            margin: EdgeInsets.only(top: 16),
            child: Center(child: EarningsPill())),
        Expanded(child: Container()),
        Column(children: [
          Container(
            margin: EdgeInsets.only(bottom: 16),
            child: FloatingActionButton.extended(
                label: Text("Go online"), onPressed: () => {}),
          ),
          Container(
            height: 56,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16))),
            alignment: Alignment.center,
            child: Text("You are offline",
                style: Theme.of(context).textTheme.headline6),
          )
        ])
      ])
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
