import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:openapi/api.dart' as API;

class Map extends StatefulWidget {
  final API.LatLng pickup;
  final API.LatLng dropoff;
  final EdgeInsets padding;

  const Map({Key key, this.pickup, this.dropoff, @required this.padding}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MapState();
}

class _MapState extends State<Map> {
  Completer<GoogleMapController> _controller = Completer();

  void _onMapCreated(GoogleMapController controller) async {
    LatLngBounds bounds = boundsFromLatLngList(
        [widget.pickup.toGoogleLatLng(), widget.dropoff.toGoogleLatLng()]);

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
    return GoogleMap(
        mapToolbarEnabled: false,
        myLocationButtonEnabled: false,
        zoomControlsEnabled: false,
        myLocationEnabled: true,
        padding: widget.padding,
        markers: Set.of([
          Marker(
              markerId: MarkerId("pickup"),
              position: widget.pickup.toGoogleLatLng()),
          Marker(
              markerId: MarkerId("dropoff"),
              position: widget.dropoff.toGoogleLatLng())
        ]),
        onMapCreated: _onMapCreated,
        initialCameraPosition:
            CameraPosition(zoom: 11, target: widget.pickup.toGoogleLatLng()));
  }
}

extension LatLngConverter on API.LatLng {
  LatLng toGoogleLatLng() {
    return LatLng(this.latitude, this.longitude);
  }
}
