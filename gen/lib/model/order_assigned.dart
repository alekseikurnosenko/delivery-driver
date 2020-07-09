part of openapi.api;

class OrderAssigned {
  
  String orderId = null;
  
  String courierId = null;
  
  String courierFullName = null;
  
  String restaurantId = null;
  
  String restaurantName = null;
  
  Address restaurantAddress = null;
  
  Address deliveryAddress = null;
  
  OrderStatus status = null;
  //enum statusEnum {  Canceled,  Placed,  Paid,  Preparing,  AwaitingPickup,  InDelivery,  Delivered,  };{
  
  String routingKey = null;
  OrderAssigned();

  @override
  String toString() {
    return 'OrderAssigned[orderId=$orderId, courierId=$courierId, courierFullName=$courierFullName, restaurantId=$restaurantId, restaurantName=$restaurantName, restaurantAddress=$restaurantAddress, deliveryAddress=$deliveryAddress, status=$status, routingKey=$routingKey, ]';
  }

  OrderAssigned.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    orderId = json['orderId'];
    courierId = json['courierId'];
    courierFullName = json['courierFullName'];
    restaurantId = json['restaurantId'];
    restaurantName = json['restaurantName'];
    restaurantAddress = (json['restaurantAddress'] == null) ?
      null :
      Address.fromJson(json['restaurantAddress']);
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
    if (orderId != null)
      json['orderId'] = orderId;
    if (courierId != null)
      json['courierId'] = courierId;
    if (courierFullName != null)
      json['courierFullName'] = courierFullName;
    if (restaurantId != null)
      json['restaurantId'] = restaurantId;
    if (restaurantName != null)
      json['restaurantName'] = restaurantName;
    if (restaurantAddress != null)
      json['restaurantAddress'] = restaurantAddress;
    if (deliveryAddress != null)
      json['deliveryAddress'] = deliveryAddress;
    if (status != null)
      json['status'] = status;
    if (routingKey != null)
      json['routingKey'] = routingKey;
    return json;
  }

  static List<OrderAssigned> listFromJson(List<dynamic> json) {
    return json == null ? List<OrderAssigned>() : json.map((value) => OrderAssigned.fromJson(value)).toList();
  }

  static Map<String, OrderAssigned> mapFromJson(Map<String, dynamic> json) {
    var map = Map<String, OrderAssigned>();
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic value) => map[key] = OrderAssigned.fromJson(value));
    }
    return map;
  }

  // maps a json object with a list of OrderAssigned-objects as value to a dart map
  static Map<String, List<OrderAssigned>> mapListFromJson(Map<String, dynamic> json) {
    var map = Map<String, List<OrderAssigned>>();
     if (json != null && json.isNotEmpty) {
       json.forEach((String key, dynamic value) {
         map[key] = OrderAssigned.listFromJson(value);
       });
     }
     return map;
  }
}

