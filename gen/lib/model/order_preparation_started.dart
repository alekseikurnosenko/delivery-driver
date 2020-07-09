part of openapi.api;

class OrderPreparationStarted {
  
  String orderId = null;
  
  OrderStatus status = null;
  //enum statusEnum {  Canceled,  Placed,  Paid,  Preparing,  AwaitingPickup,  InDelivery,  Delivered,  };{
  
  String routingKey = null;
  OrderPreparationStarted();

  @override
  String toString() {
    return 'OrderPreparationStarted[orderId=$orderId, status=$status, routingKey=$routingKey, ]';
  }

  OrderPreparationStarted.fromJson(Map<String, dynamic> json) {
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

  static List<OrderPreparationStarted> listFromJson(List<dynamic> json) {
    return json == null ? List<OrderPreparationStarted>() : json.map((value) => OrderPreparationStarted.fromJson(value)).toList();
  }

  static Map<String, OrderPreparationStarted> mapFromJson(Map<String, dynamic> json) {
    var map = Map<String, OrderPreparationStarted>();
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic value) => map[key] = OrderPreparationStarted.fromJson(value));
    }
    return map;
  }

  // maps a json object with a list of OrderPreparationStarted-objects as value to a dart map
  static Map<String, List<OrderPreparationStarted>> mapListFromJson(Map<String, dynamic> json) {
    var map = Map<String, List<OrderPreparationStarted>>();
     if (json != null && json.isNotEmpty) {
       json.forEach((String key, dynamic value) {
         map[key] = OrderPreparationStarted.listFromJson(value);
       });
     }
     return map;
  }
}

