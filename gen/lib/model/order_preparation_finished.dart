part of openapi.api;

class OrderPreparationFinished {
  
  String orderId = null;
  
  OrderStatus status = null;
  //enum statusEnum {  Canceled,  Placed,  Paid,  Preparing,  AwaitingPickup,  InDelivery,  Delivered,  };{
  
  String routingKey = null;
  OrderPreparationFinished();

  @override
  String toString() {
    return 'OrderPreparationFinished[orderId=$orderId, status=$status, routingKey=$routingKey, ]';
  }

  OrderPreparationFinished.fromJson(Map<String, dynamic> json) {
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

  static List<OrderPreparationFinished> listFromJson(List<dynamic> json) {
    return json == null ? List<OrderPreparationFinished>() : json.map((value) => OrderPreparationFinished.fromJson(value)).toList();
  }

  static Map<String, OrderPreparationFinished> mapFromJson(Map<String, dynamic> json) {
    var map = Map<String, OrderPreparationFinished>();
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic value) => map[key] = OrderPreparationFinished.fromJson(value));
    }
    return map;
  }

  // maps a json object with a list of OrderPreparationFinished-objects as value to a dart map
  static Map<String, List<OrderPreparationFinished>> mapListFromJson(Map<String, dynamic> json) {
    var map = Map<String, List<OrderPreparationFinished>>();
     if (json != null && json.isNotEmpty) {
       json.forEach((String key, dynamic value) {
         map[key] = OrderPreparationFinished.listFromJson(value);
       });
     }
     return map;
  }
}

