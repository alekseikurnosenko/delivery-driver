import 'package:delivery_driver/profile/courierRepository.dart';

class IocContainer {

  static final IocContainer _instance = IocContainer._internal();
  factory IocContainer() => _instance;

  CourierRepository courierRepository;

  IocContainer._internal() {
    courierRepository = CourierRepository();
  }
}