part of openapi.api;

class DeliveryRequested {
  
  String orderId = null;
  
  String courierId = null;
  
  Address pickup = null;
  
  Address dropoff = null;
  
  String routingKey = null;
  DeliveryRequested();

  @override
  String toString() {
    return 'DeliveryRequested[orderId=$orderId, courierId=$courierId, pickup=$pickup, dropoff=$dropoff, routingKey=$routingKey, ]';
  }

  DeliveryRequested.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    orderId = json['orderId'];
    courierId = json['courierId'];
    pickup = (json['pickup'] == null) ?
      null :
      Address.fromJson(json['pickup']);
    dropoff = (json['dropoff'] == null) ?
      null :
      Address.fromJson(json['dropoff']);
    routingKey = json['routingKey'];
  }

  Map<String, dynamic> toJson() {
    Map <String, dynamic> json = {};
    if (orderId != null)
      json['orderId'] = orderId;
    if (courierId != null)
      json['courierId'] = courierId;
    if (pickup != null)
      json['pickup'] = pickup;
    if (dropoff != null)
      json['dropoff'] = dropoff;
    if (routingKey != null)
      json['routingKey'] = routingKey;
    return json;
  }

  static List<DeliveryRequested> listFromJson(List<dynamic> json) {
    return json == null ? List<DeliveryRequested>() : json.map((value) => DeliveryRequested.fromJson(value)).toList();
  }

  static Map<String, DeliveryRequested> mapFromJson(Map<String, dynamic> json) {
    var map = Map<String, DeliveryRequested>();
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic value) => map[key] = DeliveryRequested.fromJson(value));
    }
    return map;
  }

  // maps a json object with a list of DeliveryRequested-objects as value to a dart map
  static Map<String, List<DeliveryRequested>> mapListFromJson(Map<String, dynamic> json) {
    var map = Map<String, List<DeliveryRequested>>();
     if (json != null && json.isNotEmpty) {
       json.forEach((String key, dynamic value) {
         map[key] = DeliveryRequested.listFromJson(value);
       });
     }
     return map;
  }
}

