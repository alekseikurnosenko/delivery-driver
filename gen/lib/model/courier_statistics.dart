part of openapi.api;

class CourierStatistics {
  
  int registered = null;
  
  int online = null;
  CourierStatistics();

  @override
  String toString() {
    return 'CourierStatistics[registered=$registered, online=$online, ]';
  }

  CourierStatistics.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    registered = json['registered'];
    online = json['online'];
  }

  Map<String, dynamic> toJson() {
    Map <String, dynamic> json = {};
    if (registered != null)
      json['registered'] = registered;
    if (online != null)
      json['online'] = online;
    return json;
  }

  static List<CourierStatistics> listFromJson(List<dynamic> json) {
    return json == null ? List<CourierStatistics>() : json.map((value) => CourierStatistics.fromJson(value)).toList();
  }

  static Map<String, CourierStatistics> mapFromJson(Map<String, dynamic> json) {
    var map = Map<String, CourierStatistics>();
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic value) => map[key] = CourierStatistics.fromJson(value));
    }
    return map;
  }

  // maps a json object with a list of CourierStatistics-objects as value to a dart map
  static Map<String, List<CourierStatistics>> mapListFromJson(Map<String, dynamic> json) {
    var map = Map<String, List<CourierStatistics>>();
     if (json != null && json.isNotEmpty) {
       json.forEach((String key, dynamic value) {
         map[key] = CourierStatistics.listFromJson(value);
       });
     }
     return map;
  }
}

