import 'package:openapi/api/couriers_api.dart';
import 'package:openapi/model/courier.dart';
import 'package:rxdart/rxdart.dart';

class CourierRepository {
  BehaviorSubject<Courier> _courierSubject = BehaviorSubject();
  CouriersApi api;

  CourierRepository(this.api);

  Stream<Courier> observe() {
    return _courierSubject;
  }

  void fetch() async {
    try {
    var courier = await api.ownCourier();
    _courierSubject.sink.add(courier.data);
    } catch (e) {
      print("Failed to fetch courier");
    }
  }

  void update(Courier courier) {
    // Kinda dangerous
    _courierSubject.sink.add(courier);
  }
  
}