part of openapi.api;

class Order {
  
  String id = null;
  
  MoneyView totalAmount = null;
  
  Address deliveryAddress = null;
  
  Restaurant restaurant = null;
  
  Courier courier = null;
  
  OrderStatus status = null;
  //enum statusEnum {  Canceled,  Placed,  Paid,  Preparing,  AwaitingPickup,  InDelivery,  Delivered,  };{
  
  List<OrderItemDTO> items = [];
  Order();

  @override
  String toString() {
    return 'Order[id=$id, totalAmount=$totalAmount, deliveryAddress=$deliveryAddress, restaurant=$restaurant, courier=$courier, status=$status, items=$items, ]';
  }

  Order.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    id = json['id'];
    totalAmount = (json['totalAmount'] == null) ?
      null :
      MoneyView.fromJson(json['totalAmount']);
    deliveryAddress = (json['deliveryAddress'] == null) ?
      null :
      Address.fromJson(json['deliveryAddress']);
    restaurant = (json['restaurant'] == null) ?
      null :
      Restaurant.fromJson(json['restaurant']);
    courier = (json['courier'] == null) ?
      null :
      Courier.fromJson(json['courier']);
    status = (json['status'] == null) ?
      null :
      OrderStatus.fromJson(json['status']);
    items = (json['items'] == null) ?
      null :
      OrderItemDTO.listFromJson(json['items']);
  }

  Map<String, dynamic> toJson() {
    Map <String, dynamic> json = {};
    if (id != null)
      json['id'] = id;
    if (totalAmount != null)
      json['totalAmount'] = totalAmount;
    if (deliveryAddress != null)
      json['deliveryAddress'] = deliveryAddress;
    if (restaurant != null)
      json['restaurant'] = restaurant;
    if (courier != null)
      json['courier'] = courier;
    if (status != null)
      json['status'] = status;
    if (items != null)
      json['items'] = items;
    return json;
  }

  static List<Order> listFromJson(List<dynamic> json) {
    return json == null ? List<Order>() : json.map((value) => Order.fromJson(value)).toList();
  }

  static Map<String, Order> mapFromJson(Map<String, dynamic> json) {
    var map = Map<String, Order>();
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic value) => map[key] = Order.fromJson(value));
    }
    return map;
  }

  // maps a json object with a list of Order-objects as value to a dart map
  static Map<String, List<Order>> mapListFromJson(Map<String, dynamic> json) {
    var map = Map<String, List<Order>>();
     if (json != null && json.isNotEmpty) {
       json.forEach((String key, dynamic value) {
         map[key] = Order.listFromJson(value);
       });
     }
     return map;
  }
}

