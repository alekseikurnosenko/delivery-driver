import 'package:delivery_driver/main.dart';
import 'package:delivery_driver/profile/courierRepository.dart';
import 'package:dio/dio.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:openapi/api.dart';

class IocContainer {
  static final IocContainer _instance = IocContainer._internal();
  factory IocContainer() => _instance;

  CourierRepository courierRepository;

  Openapi api;

  IocContainer._internal() {
    api = Openapi(interceptors: [
      _HeaderInterceptor(),
      _FirebaseTokenInterceptor(),
      LogInterceptor(
          requestHeader: false,
          requestBody: true,
          responseBody: true,
          responseHeader: false)
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

class _FirebaseTokenInterceptor extends Interceptor {
  String token;

  _FirebaseTokenInterceptor() {
    FirebaseMessaging().onTokenRefresh.listen((event) {
      token = event;
    });

    FirebaseMessaging().getToken().then((value) => {token = value});
  }

  @override
  Future onRequest(RequestOptions options) {
    if (token != null) {
      options.headers.putIfAbsent("X-FirebaseToken", () => token);
    }

    return super.onRequest(options);
  }
}
