import 'package:delivery_driver/iocContainer.dart';
import 'package:delivery_driver/profile/courierRepository.dart';
import 'package:geolocator/geolocator.dart';
import 'package:openapi/api/couriers_api.dart';
import 'package:openapi/model/update_location_input.dart';

class HomeBloc {
  HomeBloc({this.courierRepository});

  CouriersApi api = IocContainer().api.getCouriersApi();
  CourierRepository courierRepository;

  Stream<bool> get isOnShift {
    return courierRepository.observe().map((event) => event.onShift);
  }

  void startShift() async {
    var courier = await courierRepository.observe().first;

    var updatedCourier = await api.startShift(courier.id);
    courierRepository.update(updatedCourier.data);

    // FIXME?
    var currentPosition = await Geolocator().getLastKnownPosition();
    var input = UpdateLocationInput((b) => b.latLng
      ..latitude = currentPosition.latitude
      ..longitude = currentPosition.longitude
    );
    
    await api.updateLocation(courier.id, input);
  }

  void stopShift() async {
    var courier = await courierRepository.observe().first;

    var updatedCourier = await api.stopShift(courier.id);
    courierRepository.update(updatedCourier.data);
  }
}
