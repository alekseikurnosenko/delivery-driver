import 'dart:async';

import 'package:flutter/material.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:openapi/api.dart' as API;

part 'main.g.dart';

@widget
Widget _bottomSheet() => Container(
    decoration: BoxDecoration(
        boxShadow: [BoxShadow(blurRadius: 10, color: Colors.grey)],
        color: Colors.white,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16), topRight: Radius.circular(16))),
    padding: EdgeInsets.all(16),
    alignment: Alignment.center,
    child: Column(crossAxisAlignment: CrossAxisAlignment.stretch,
    mainAxisAlignment: MainAxisAlignment.start, children: [
      Text("TBD: Request info"),
      FlatButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          onPressed: () {},
          color: Colors.blue,
          textColor: Colors.white,
          child: Text("Accept request")),
      FlatButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          onPressed: () {},
          textColor: Colors.black,
          child: Text("Reject request"))
    ]));

class RequestPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _RequestPageState();
  }
}

class _RequestPageState extends State<RequestPage> {
  Completer<GoogleMapController> _controller = Completer();
  LatLng _center = const LatLng(45.521563, -122.677433);

  @override
  void initState() {
    super.initState();
  }

  void _onMapCreated(GoogleMapController controller) async {
    LatLng pickup = const LatLng(45.51, -122.66);
    LatLng dropoff = const LatLng(45.53, -122.68);
    LatLngBounds bounds = boundsFromLatLngList([pickup, dropoff]);

    // NB: Required for initial map padding to set
    setState(() {});

    await waitForGoogleMap(controller);
    // await Future.delayed(Duration(milliseconds: 1000), () => {});
    controller.moveCamera(CameraUpdate.newLatLngBounds(bounds, 64));

    // NB: Required for padding to work!
    // setState(() {});
  }

  Future<void> waitForGoogleMap(GoogleMapController c) {
    return c.getVisibleRegion().then((value) {
      if (value.southwest.latitude != 0) {
        return Future.value();
      }

      return Future.delayed(Duration(milliseconds: 100))
          .then((_) => waitForGoogleMap(c));
    });
  }

  LatLngBounds boundsFromLatLngList(List<LatLng> list) {
    assert(list.isNotEmpty);
    double x0, x1, y0, y1;
    for (LatLng latLng in list) {
      if (x0 == null) {
        x0 = x1 = latLng.latitude;
        y0 = y1 = latLng.longitude;
      } else {
        if (latLng.latitude > x1) x1 = latLng.latitude;
        if (latLng.latitude < x0) x0 = latLng.latitude;
        if (latLng.longitude > y1) y1 = latLng.longitude;
        if (latLng.longitude < y0) y0 = latLng.longitude;
      }
    }
    return LatLngBounds(northeast: LatLng(x1, y1), southwest: LatLng(x0, y0));
  }

  @override
  Widget build(BuildContext context) {
    LatLng pickup = const LatLng(45.51, -122.66);
    LatLng dropoff = const LatLng(45.53, -122.68);

    return Scaffold(
        appBar: AppBar(),
        body: Stack(children: [
          GoogleMap(
              mapToolbarEnabled: false,
              myLocationButtonEnabled: false,
              zoomControlsEnabled: false,
              myLocationEnabled: true,
              padding: EdgeInsets.only(bottom: 128),
              markers: Set.of([
                Marker(markerId: MarkerId("pickup"), position: pickup),
                Marker(markerId: MarkerId("dropoff"), position: dropoff)
              ]),
              onMapCreated: _onMapCreated,
              initialCameraPosition: CameraPosition(zoom: 11, target: _center)),
          Column(
            children: <Widget>[Expanded(child: Container()), _BottomSheet()],
          )
        ]));
  }
}
