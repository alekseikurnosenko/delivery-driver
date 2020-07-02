library openapi.api;

import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart';

part 'api_client.dart';
part 'api_helper.dart';
part 'api_exception.dart';
part 'auth/authentication.dart';
part 'auth/api_key_auth.dart';
part 'auth/oauth.dart';
part 'auth/http_basic_auth.dart';
part 'auth/http_bearer_auth.dart';

part 'api/basket_api.dart';
part 'api/couriers_api.dart';
part 'api/index_api.dart';
part 'api/orders_api.dart';
part 'api/profile_api.dart';
part 'api/restaurants_api.dart';

part 'model/add_item_to_basket_input.dart';
part 'model/address.dart';
part 'model/basket_dto.dart';
part 'model/basket_item_dto.dart';
part 'model/courier.dart';
part 'model/courier_statistics.dart';
part 'model/create_courier_input.dart';
part 'model/create_dish_input.dart';
part 'model/create_restaurant_input.dart';
part 'model/delivery_request_dto.dart';
part 'model/dish_dto.dart';
part 'model/granted_authority.dart';
part 'model/lat_lng.dart';
part 'model/money_view.dart';
part 'model/order.dart';
part 'model/order_item_dto.dart';
part 'model/order_status.dart';
part 'model/profile.dart';
part 'model/remove_from_basket_input.dart';
part 'model/restaurant.dart';
part 'model/set_payment_method_input.dart';
part 'model/update_location_input.dart';


ApiClient defaultApiClient = ApiClient();
