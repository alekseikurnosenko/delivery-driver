import 'package:openapi/api.dart';
import 'package:rxdart/rxdart.dart';

class CourierRepository {
  BehaviorSubject<Courier> _courierSubject = BehaviorSubject();

  Stream<Courier> observe() {
    return _courierSubject;
  }

  void fetch() async {
    try {
    var courier = await CouriersApi().ownCourier();
    _courierSubject.sink.add(courier);
    } catch (e) {
      print("Failed to fetch courier");
    }
  }

  void update(Courier courier) {
    // Kinda dangerous
    _courierSubject.sink.add(courier);
  }
  
}