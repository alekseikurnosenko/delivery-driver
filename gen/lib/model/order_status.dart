part of openapi.api;

class OrderStatus {
  /// The underlying value of this enum member.
  final String value;

  const OrderStatus._internal(this.value);

  static const OrderStatus canceled_ = const OrderStatus._internal("Canceled");
  static const OrderStatus placed_ = const OrderStatus._internal("Placed");
  static const OrderStatus paid_ = const OrderStatus._internal("Paid");
  static const OrderStatus preparing_ = const OrderStatus._internal("Preparing");
  static const OrderStatus awaitingPickup_ = const OrderStatus._internal("AwaitingPickup");
  static const OrderStatus inDelivery_ = const OrderStatus._internal("InDelivery");
  static const OrderStatus delivered_ = const OrderStatus._internal("Delivered");

  static OrderStatus fromJson(String value) {
    return new OrderStatusTypeTransformer().decode(value);
  }
  
  static List<OrderStatus> listFromJson(List<dynamic> json) {
    return json == null ? new List<OrderStatus>() : json.map((value) => OrderStatus.fromJson(value)).toList();
  }
}

class OrderStatusTypeTransformer {

  dynamic encode(OrderStatus data) {
    return data.value;
  }

  OrderStatus decode(dynamic data) {
    switch (data) {
      case "Canceled": return OrderStatus.canceled_;
      case "Placed": return OrderStatus.placed_;
      case "Paid": return OrderStatus.paid_;
      case "Preparing": return OrderStatus.preparing_;
      case "AwaitingPickup": return OrderStatus.awaitingPickup_;
      case "InDelivery": return OrderStatus.inDelivery_;
      case "Delivered": return OrderStatus.delivered_;
      default: throw('Unknown enum value to decode: $data');
    }
  }
}

