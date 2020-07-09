part of openapi.api;

class OrderDelivered {
  
  String orderId = null;
  
  OrderStatus status = null;
  //enum statusEnum {  Canceled,  Placed,  Paid,  Preparing,  AwaitingPickup,  InDelivery,  Delivered,  };{
  
  String routingKey = null;
  OrderDelivered();

  @override
  String toString() {
    return 'OrderDelivered[orderId=$orderId, status=$status, routingKey=$routingKey, ]';
  }

  OrderDelivered.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    orderId = json['orderId'];
    status = (json['status'] == null) ?
      null :
      OrderStatus.fromJson(json['status']);
    routingKey = json['routingKey'];
  }

  Map<String, dynamic> toJson() {
    Map <String, dynamic> json = {};
    if (orderId != null)
      json['orderId'] = orderId;
    if (status != null)
      json['status'] = status;
    if (routingKey != null)
      json['routingKey'] = routingKey;
    return json;
  }

  static List<OrderDelivered> listFromJson(List<dynamic> json) {
    return json == null ? List<OrderDelivered>() : json.map((value) => OrderDelivered.fromJson(value)).toList();
  }

  static Map<String, OrderDelivered> mapFromJson(Map<String, dynamic> json) {
    var map = Map<String, OrderDelivered>();
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic value) => map[key] = OrderDelivered.fromJson(value));
    }
    return map;
  }

  // maps a json object with a list of OrderDelivered-objects as value to a dart map
  static Map<String, List<OrderDelivered>> mapListFromJson(Map<String, dynamic> json) {
    var map = Map<String, List<OrderDelivered>>();
     if (json != null && json.isNotEmpty) {
       json.forEach((String key, dynamic value) {
         map[key] = OrderDelivered.listFromJson(value);
       });
     }
     return map;
  }
}

