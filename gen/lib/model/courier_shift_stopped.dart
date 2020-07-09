part of openapi.api;

class CourierShiftStopped {
  
  String courierId = null;
  
  String routingKey = null;
  CourierShiftStopped();

  @override
  String toString() {
    return 'CourierShiftStopped[courierId=$courierId, routingKey=$routingKey, ]';
  }

  CourierShiftStopped.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    courierId = json['courierId'];
    routingKey = json['routingKey'];
  }

  Map<String, dynamic> toJson() {
    Map <String, dynamic> json = {};
    if (courierId != null)
      json['courierId'] = courierId;
    if (routingKey != null)
      json['routingKey'] = routingKey;
    return json;
  }

  static List<CourierShiftStopped> listFromJson(List<dynamic> json) {
    return json == null ? List<CourierShiftStopped>() : json.map((value) => CourierShiftStopped.fromJson(value)).toList();
  }

  static Map<String, CourierShiftStopped> mapFromJson(Map<String, dynamic> json) {
    var map = Map<String, CourierShiftStopped>();
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic value) => map[key] = CourierShiftStopped.fromJson(value));
    }
    return map;
  }

  // maps a json object with a list of CourierShiftStopped-objects as value to a dart map
  static Map<String, List<CourierShiftStopped>> mapListFromJson(Map<String, dynamic> json) {
    var map = Map<String, List<CourierShiftStopped>>();
     if (json != null && json.isNotEmpty) {
       json.forEach((String key, dynamic value) {
         map[key] = CourierShiftStopped.listFromJson(value);
       });
     }
     return map;
  }
}

