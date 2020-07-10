import 'package:delivery_driver/profile/courierRepository.dart';
import 'package:geolocator/geolocator.dart';
import 'package:openapi/api.dart';

class HomeBloc {
  HomeBloc({this.courierRepository});

  CourierRepository courierRepository;

  Stream<bool> get isOnShift {
    return courierRepository.observe().map((event) => event.onShift);
  }

  void startShift() async {
    var courier = await courierRepository.observe().first;

    var updatedCourier = await CouriersApi().startShift(courier.id);
    courierRepository.update(updatedCourier);

    // FIXME
    var currentPosition = await Geolocator().getLastKnownPosition();
    var input = UpdateLocationInput();
    input.latLng = LatLng();
    input.latLng.latitude = currentPosition.latitude;
    input.latLng.longitude = currentPosition.longitude;

    await CouriersApi().updateLocation(courier.id, input);
  }

  void stopShift() async {
    var courier = await courierRepository.observe().first;

    var updatedCourier = await CouriersApi().stopShift(courier.id);
    courierRepository.update(updatedCourier);
  }
}
