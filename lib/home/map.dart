import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

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