part of openapi.api;

class CourierLocationUpdated {
  
  String courierId = null;
  
  LatLng location = null;
  
  String routingKey = null;
  CourierLocationUpdated();

  @override
  String toString() {
    return 'CourierLocationUpdated[courierId=$courierId, location=$location, routingKey=$routingKey, ]';
  }

  CourierLocationUpdated.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    courierId = json['courierId'];
    location = (json['location'] == null) ?
      null :
      LatLng.fromJson(json['location']);
    routingKey = json['routingKey'];
  }

  Map<String, dynamic> toJson() {
    Map <String, dynamic> json = {};
    if (courierId != null)
      json['courierId'] = courierId;
    if (location != null)
      json['location'] = location;
    if (routingKey != null)
      json['routingKey'] = routingKey;
    return json;
  }

  static List<CourierLocationUpdated> listFromJson(List<dynamic> json) {
    return json == null ? List<CourierLocationUpdated>() : json.map((value) => CourierLocationUpdated.fromJson(value)).toList();
  }

  static Map<String, CourierLocationUpdated> mapFromJson(Map<String, dynamic> json) {
    var map = Map<String, CourierLocationUpdated>();
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic value) => map[key] = CourierLocationUpdated.fromJson(value));
    }
    return map;
  }

  // maps a json object with a list of CourierLocationUpdated-objects as value to a dart map
  static Map<String, List<CourierLocationUpdated>> mapListFromJson(Map<String, dynamic> json) {
    var map = Map<String, List<CourierLocationUpdated>>();
     if (json != null && json.isNotEmpty) {
       json.forEach((String key, dynamic value) {
         map[key] = CourierLocationUpdated.listFromJson(value);
       });
     }
     return map;
  }
}

