part of openapi.api;

class CourierShiftStarted {
  
  String courierId = null;
  
  String routingKey = null;
  CourierShiftStarted();

  @override
  String toString() {
    return 'CourierShiftStarted[courierId=$courierId, routingKey=$routingKey, ]';
  }

  CourierShiftStarted.fromJson(Map<String, dynamic> json) {
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

  static List<CourierShiftStarted> listFromJson(List<dynamic> json) {
    return json == null ? List<CourierShiftStarted>() : json.map((value) => CourierShiftStarted.fromJson(value)).toList();
  }

  static Map<String, CourierShiftStarted> mapFromJson(Map<String, dynamic> json) {
    var map = Map<String, CourierShiftStarted>();
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic value) => map[key] = CourierShiftStarted.fromJson(value));
    }
    return map;
  }

  // maps a json object with a list of CourierShiftStarted-objects as value to a dart map
  static Map<String, List<CourierShiftStarted>> mapListFromJson(Map<String, dynamic> json) {
    var map = Map<String, List<CourierShiftStarted>>();
     if (json != null && json.isNotEmpty) {
       json.forEach((String key, dynamic value) {
         map[key] = CourierShiftStarted.listFromJson(value);
       });
     }
     return map;
  }
}

