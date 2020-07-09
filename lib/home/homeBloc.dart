import 'package:delivery_driver/profile/courierRepository.dart';
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
  }

  void stopShift() async {
    var courier = await courierRepository.observe().first;

    var updatedCourier = await CouriersApi().stopShift(courier.id);
    courierRepository.update(updatedCourier);
  }
}
