import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomePage extends StatelessWidget {
  final LatLng _center = const LatLng(45.521563, -122.677433);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Stack(children: [
      GoogleMap(
          mapToolbarEnabled: false,
          myLocationButtonEnabled: true,
          zoomControlsEnabled: false,
          initialCameraPosition: CameraPosition(target: _center, zoom: 11)),
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

class EarningsPill extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            border: new Border.all(
              color: Colors.white,
              width: 2,
            ),
            color: Colors.black,
            borderRadius: BorderRadius.all(Radius.circular(16))),
        child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            child: Text("\$10.0",
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .headline6
                    .apply(color: Colors.white))));
  }
}
