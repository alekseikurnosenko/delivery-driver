part of openapi.api;

class OrderPickedUp {
  
  String orderId = null;
  
  OrderStatus status = null;
  //enum statusEnum {  Canceled,  Placed,  Paid,  Preparing,  AwaitingPickup,  InDelivery,  Delivered,  };{
  
  String routingKey = null;
  OrderPickedUp();

  @override
  String toString() {
    return 'OrderPickedUp[orderId=$orderId, status=$status, routingKey=$routingKey, ]';
  }

  OrderPickedUp.fromJson(Map<String, dynamic> json) {
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

  static List<OrderPickedUp> listFromJson(List<dynamic> json) {
    return json == null ? List<OrderPickedUp>() : json.map((value) => OrderPickedUp.fromJson(value)).toList();
  }

  static Map<String, OrderPickedUp> mapFromJson(Map<String, dynamic> json) {
    var map = Map<String, OrderPickedUp>();
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic value) => map[key] = OrderPickedUp.fromJson(value));
    }
    return map;
  }

  // maps a json object with a list of OrderPickedUp-objects as value to a dart map
  static Map<String, List<OrderPickedUp>> mapListFromJson(Map<String, dynamic> json) {
    var map = Map<String, List<OrderPickedUp>>();
     if (json != null && json.isNotEmpty) {
       json.forEach((String key, dynamic value) {
         map[key] = OrderPickedUp.listFromJson(value);
       });
     }
     return map;
  }
}

