part of openapi.api;

class OrderPlaced {
  
  String userId = null;
  
  String orderId = null;
  
  String restaurantId = null;
  
  String restaurantName = null;
  
  MoneyView totalAmount = null;
  
  Address deliveryAddress = null;
  
  OrderStatus status = null;
  //enum statusEnum {  Canceled,  Placed,  Paid,  Preparing,  AwaitingPickup,  InDelivery,  Delivered,  };{
  
  String routingKey = null;
  OrderPlaced();

  @override
  String toString() {
    return 'OrderPlaced[userId=$userId, orderId=$orderId, restaurantId=$restaurantId, restaurantName=$restaurantName, totalAmount=$totalAmount, deliveryAddress=$deliveryAddress, status=$status, routingKey=$routingKey, ]';
  }

  OrderPlaced.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    userId = json['userId'];
    orderId = json['orderId'];
    restaurantId = json['restaurantId'];
    restaurantName = json['restaurantName'];
    totalAmount = (json['totalAmount'] == null) ?
      null :
      MoneyView.fromJson(json['totalAmount']);
    deliveryAddress = (json['deliveryAddress'] == null) ?
      null :
      Address.fromJson(json['deliveryAddress']);
    status = (json['status'] == null) ?
      null :
      OrderStatus.fromJson(json['status']);
    routingKey = json['routingKey'];
  }

  Map<String, dynamic> toJson() {
    Map <String, dynamic> json = {};
    if (userId != null)
      json['userId'] = userId;
    if (orderId != null)
      json['orderId'] = orderId;
    if (restaurantId != null)
      json['restaurantId'] = restaurantId;
    if (restaurantName != null)
      json['restaurantName'] = restaurantName;
    if (totalAmount != null)
      json['totalAmount'] = totalAmount;
    if (deliveryAddress != null)
      json['deliveryAddress'] = deliveryAddress;
    if (status != null)
      json['status'] = status;
    if (routingKey != null)
      json['routingKey'] = routingKey;
    return json;
  }

  static List<OrderPlaced> listFromJson(List<dynamic> json) {
    return json == null ? List<OrderPlaced>() : json.map((value) => OrderPlaced.fromJson(value)).toList();
  }

  static Map<String, OrderPlaced> mapFromJson(Map<String, dynamic> json) {
    var map = Map<String, OrderPlaced>();
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic value) => map[key] = OrderPlaced.fromJson(value));
    }
    return map;
  }

  // maps a json object with a list of OrderPlaced-objects as value to a dart map
  static Map<String, List<OrderPlaced>> mapListFromJson(Map<String, dynamic> json) {
    var map = Map<String, List<OrderPlaced>>();
     if (json != null && json.isNotEmpty) {
       json.forEach((String key, dynamic value) {
         map[key] = OrderPlaced.listFromJson(value);
       });
     }
     return map;
  }
}

