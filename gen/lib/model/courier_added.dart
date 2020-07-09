part of openapi.api;

class CourierAdded {
  
  String accountId = null;
  
  String courierId = null;
  
  String fullName = null;
  
  bool onShift = null;
  
  String routingKey = null;
  CourierAdded();

  @override
  String toString() {
    return 'CourierAdded[accountId=$accountId, courierId=$courierId, fullName=$fullName, onShift=$onShift, routingKey=$routingKey, ]';
  }

  CourierAdded.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    accountId = json['accountId'];
    courierId = json['courierId'];
    fullName = json['fullName'];
    onShift = json['onShift'];
    routingKey = json['routingKey'];
  }

  Map<String, dynamic> toJson() {
    Map <String, dynamic> json = {};
    if (accountId != null)
      json['accountId'] = accountId;
    if (courierId != null)
      json['courierId'] = courierId;
    if (fullName != null)
      json['fullName'] = fullName;
    if (onShift != null)
      json['onShift'] = onShift;
    if (routingKey != null)
      json['routingKey'] = routingKey;
    return json;
  }

  static List<CourierAdded> listFromJson(List<dynamic> json) {
    return json == null ? List<CourierAdded>() : json.map((value) => CourierAdded.fromJson(value)).toList();
  }

  static Map<String, CourierAdded> mapFromJson(Map<String, dynamic> json) {
    var map = Map<String, CourierAdded>();
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic value) => map[key] = CourierAdded.fromJson(value));
    }
    return map;
  }

  // maps a json object with a list of CourierAdded-objects as value to a dart map
  static Map<String, List<CourierAdded>> mapListFromJson(Map<String, dynamic> json) {
    var map = Map<String, List<CourierAdded>>();
     if (json != null && json.isNotEmpty) {
       json.forEach((String key, dynamic value) {
         map[key] = CourierAdded.listFromJson(value);
       });
     }
     return map;
  }
}

