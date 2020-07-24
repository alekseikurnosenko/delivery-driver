library serializers;

import 'package:built_value/iso_8601_date_time_serializer.dart';
import 'package:built_value/serializer.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/json_object.dart';
import 'package:built_value/standard_json_plugin.dart';

import 'package:openapi/model/add_item_to_basket_input.dart';
import 'package:openapi/model/address.dart';
import 'package:openapi/model/basket_dto.dart';
import 'package:openapi/model/basket_item_dto.dart';
import 'package:openapi/model/courier.dart';
import 'package:openapi/model/courier_added.dart';
import 'package:openapi/model/courier_location_updated.dart';
import 'package:openapi/model/courier_shift_started.dart';
import 'package:openapi/model/courier_shift_stopped.dart';
import 'package:openapi/model/courier_statistics.dart';
import 'package:openapi/model/create_courier_input.dart';
import 'package:openapi/model/create_dish_input.dart';
import 'package:openapi/model/create_restaurant_input.dart';
import 'package:openapi/model/delivery_request_dto.dart';
import 'package:openapi/model/delivery_requested.dart';
import 'package:openapi/model/dish_dto.dart';
import 'package:openapi/model/lat_lng.dart';
import 'package:openapi/model/money_view.dart';
import 'package:openapi/model/order.dart';
import 'package:openapi/model/order_assigned.dart';
import 'package:openapi/model/order_canceled.dart';
import 'package:openapi/model/order_delivered.dart';
import 'package:openapi/model/order_item_dto.dart';
import 'package:openapi/model/order_picked_up.dart';
import 'package:openapi/model/order_placed.dart';
import 'package:openapi/model/order_preparation_finished.dart';
import 'package:openapi/model/order_preparation_started.dart';
import 'package:openapi/model/order_status.dart';
import 'package:openapi/model/profile.dart';
import 'package:openapi/model/remove_from_basket_input.dart';
import 'package:openapi/model/restaurant.dart';
import 'package:openapi/model/restaurant_added.dart';
import 'package:openapi/model/set_payment_method_input.dart';
import 'package:openapi/model/update_location_input.dart';


part 'serializers.g.dart';

@SerializersFor(const [
AddItemToBasketInput,
Address,
BasketDTO,
BasketItemDTO,
Courier,
CourierAdded,
CourierLocationUpdated,
CourierShiftStarted,
CourierShiftStopped,
CourierStatistics,
CreateCourierInput,
CreateDishInput,
CreateRestaurantInput,
DeliveryRequestDTO,
DeliveryRequested,
DishDTO,
LatLng,
MoneyView,
Order,
OrderAssigned,
OrderCanceled,
OrderDelivered,
OrderItemDTO,
OrderPickedUp,
OrderPlaced,
OrderPreparationFinished,
OrderPreparationStarted,
OrderStatus,
Profile,
RemoveFromBasketInput,
Restaurant,
RestaurantAdded,
SetPaymentMethodInput,
UpdateLocationInput,

])

//allow all models to be serialized within a list
Serializers serializers = (_$serializers.toBuilder()
..addBuilderFactory(
const FullType(BuiltList, const [const FullType(AddItemToBasketInput)]),
() => new ListBuilder<AddItemToBasketInput>())
..addBuilderFactory(
const FullType(BuiltList, const [const FullType(Address)]),
() => new ListBuilder<Address>())
..addBuilderFactory(
const FullType(BuiltList, const [const FullType(BasketDTO)]),
() => new ListBuilder<BasketDTO>())
..addBuilderFactory(
const FullType(BuiltList, const [const FullType(BasketItemDTO)]),
() => new ListBuilder<BasketItemDTO>())
..addBuilderFactory(
const FullType(BuiltList, const [const FullType(Courier)]),
() => new ListBuilder<Courier>())
..addBuilderFactory(
const FullType(BuiltList, const [const FullType(CourierAdded)]),
() => new ListBuilder<CourierAdded>())
..addBuilderFactory(
const FullType(BuiltList, const [const FullType(CourierLocationUpdated)]),
() => new ListBuilder<CourierLocationUpdated>())
..addBuilderFactory(
const FullType(BuiltList, const [const FullType(CourierShiftStarted)]),
() => new ListBuilder<CourierShiftStarted>())
..addBuilderFactory(
const FullType(BuiltList, const [const FullType(CourierShiftStopped)]),
() => new ListBuilder<CourierShiftStopped>())
..addBuilderFactory(
const FullType(BuiltList, const [const FullType(CourierStatistics)]),
() => new ListBuilder<CourierStatistics>())
..addBuilderFactory(
const FullType(BuiltList, const [const FullType(CreateCourierInput)]),
() => new ListBuilder<CreateCourierInput>())
..addBuilderFactory(
const FullType(BuiltList, const [const FullType(CreateDishInput)]),
() => new ListBuilder<CreateDishInput>())
..addBuilderFactory(
const FullType(BuiltList, const [const FullType(CreateRestaurantInput)]),
() => new ListBuilder<CreateRestaurantInput>())
..addBuilderFactory(
const FullType(BuiltList, const [const FullType(DeliveryRequestDTO)]),
() => new ListBuilder<DeliveryRequestDTO>())
..addBuilderFactory(
const FullType(BuiltList, const [const FullType(DeliveryRequested)]),
() => new ListBuilder<DeliveryRequested>())
..addBuilderFactory(
const FullType(BuiltList, const [const FullType(DishDTO)]),
() => new ListBuilder<DishDTO>())
..addBuilderFactory(
const FullType(BuiltList, const [const FullType(LatLng)]),
() => new ListBuilder<LatLng>())
..addBuilderFactory(
const FullType(BuiltList, const [const FullType(MoneyView)]),
() => new ListBuilder<MoneyView>())
..addBuilderFactory(
const FullType(BuiltList, const [const FullType(Order)]),
() => new ListBuilder<Order>())
..addBuilderFactory(
const FullType(BuiltList, const [const FullType(OrderAssigned)]),
() => new ListBuilder<OrderAssigned>())
..addBuilderFactory(
const FullType(BuiltList, const [const FullType(OrderCanceled)]),
() => new ListBuilder<OrderCanceled>())
..addBuilderFactory(
const FullType(BuiltList, const [const FullType(OrderDelivered)]),
() => new ListBuilder<OrderDelivered>())
..addBuilderFactory(
const FullType(BuiltList, const [const FullType(OrderItemDTO)]),
() => new ListBuilder<OrderItemDTO>())
..addBuilderFactory(
const FullType(BuiltList, const [const FullType(OrderPickedUp)]),
() => new ListBuilder<OrderPickedUp>())
..addBuilderFactory(
const FullType(BuiltList, const [const FullType(OrderPlaced)]),
() => new ListBuilder<OrderPlaced>())
..addBuilderFactory(
const FullType(BuiltList, const [const FullType(OrderPreparationFinished)]),
() => new ListBuilder<OrderPreparationFinished>())
..addBuilderFactory(
const FullType(BuiltList, const [const FullType(OrderPreparationStarted)]),
() => new ListBuilder<OrderPreparationStarted>())
..addBuilderFactory(
const FullType(BuiltList, const [const FullType(OrderStatus)]),
() => new ListBuilder<OrderStatus>())
..addBuilderFactory(
const FullType(BuiltList, const [const FullType(Profile)]),
() => new ListBuilder<Profile>())
..addBuilderFactory(
const FullType(BuiltList, const [const FullType(RemoveFromBasketInput)]),
() => new ListBuilder<RemoveFromBasketInput>())
..addBuilderFactory(
const FullType(BuiltList, const [const FullType(Restaurant)]),
() => new ListBuilder<Restaurant>())
..addBuilderFactory(
const FullType(BuiltList, const [const FullType(RestaurantAdded)]),
() => new ListBuilder<RestaurantAdded>())
..addBuilderFactory(
const FullType(BuiltList, const [const FullType(SetPaymentMethodInput)]),
() => new ListBuilder<SetPaymentMethodInput>())
..addBuilderFactory(
const FullType(BuiltList, const [const FullType(UpdateLocationInput)]),
() => new ListBuilder<UpdateLocationInput>())

..add(Iso8601DateTimeSerializer())
).build();

Serializers standardSerializers =
(serializers.toBuilder()
..addPlugin(StandardJsonPlugin())).build();
