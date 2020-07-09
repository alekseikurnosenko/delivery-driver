part of openapi.api;

class OrderCanceled {
  
  String orderId = null;
  
  OrderStatus status = null;
  //enum statusEnum {  Canceled,  Placed,  Paid,  Preparing,  AwaitingPickup,  InDelivery,  Delivered,  };{
  
  String reason = null;
  
  String routingKey = null;
  OrderCanceled();

  @override
  String toString() {
    return 'OrderCanceled[orderId=$orderId, status=$status, reason=$reason, routingKey=$routingKey, ]';
  }

  OrderCanceled.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    orderId = json['orderId'];
    status = (json['status'] == null) ?
      null :
      OrderStatus.fromJson(json['status']);
    reason = json['reason'];
    routingKey = json['routingKey'];
  }

  Map<String, dynamic> toJson() {
    Map <String, dynamic> json = {};
    if (orderId != null)
      json['orderId'] = orderId;
    if (status != null)
      json['status'] = status;
    if (reason != null)
      json['reason'] = reason;
    if (routingKey != null)
      json['routingKey'] = routingKey;
    return json;
  }

  static List<OrderCanceled> listFromJson(List<dynamic> json) {
    return json == null ? List<OrderCanceled>() : json.map((value) => OrderCanceled.fromJson(value)).toList();
  }

  static Map<String, OrderCanceled> mapFromJson(Map<String, dynamic> json) {
    var map = Map<String, OrderCanceled>();
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic value) => map[key] = OrderCanceled.fromJson(value));
    }
    return map;
  }

  // maps a json object with a list of OrderCanceled-objects as value to a dart map
  static Map<String, List<OrderCanceled>> mapListFromJson(Map<String, dynamic> json) {
    var map = Map<String, List<OrderCanceled>>();
     if (json != null && json.isNotEmpty) {
       json.forEach((String key, dynamic value) {
         map[key] = OrderCanceled.listFromJson(value);
       });
     }
     return map;
  }
}

