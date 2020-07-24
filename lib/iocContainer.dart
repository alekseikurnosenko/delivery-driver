import 'package:delivery_driver/main.dart';
import 'package:delivery_driver/profile/courierRepository.dart';
import 'package:dio/dio.dart';
import 'package:openapi/api.dart';

class IocContainer {
  static final IocContainer _instance = IocContainer._internal();
  factory IocContainer() => _instance;

  CourierRepository courierRepository;

  Openapi api;

  IocContainer._internal() {
    api = Openapi(interceptors: [
      _HeaderInterceptor(),
      LogInterceptor(
          requestHeader: false, responseHeader: false, responseBody: true)
    ]);
    courierRepository = CourierRepository(api.getCouriersApi());
  }
}

class _HeaderInterceptor extends Interceptor {
  @override
  Future onRequest(RequestOptions options) {
    options.headers.putIfAbsent("Authorization", () => "Bearer ${MyApp.token}");
    return super.onRequest(options);
  }
}
