part of openapi.api;

class RestaurantAdded {
  
  String accountId = null;
  
  String restaurantId = null;
  
  String routingKey = null;
  RestaurantAdded();

  @override
  String toString() {
    return 'RestaurantAdded[accountId=$accountId, restaurantId=$restaurantId, routingKey=$routingKey, ]';
  }

  RestaurantAdded.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    accountId = json['accountId'];
    restaurantId = json['restaurantId'];
    routingKey = json['routingKey'];
  }

  Map<String, dynamic> toJson() {
    Map <String, dynamic> json = {};
    if (accountId != null)
      json['accountId'] = accountId;
    if (restaurantId != null)
      json['restaurantId'] = restaurantId;
    if (routingKey != null)
      json['routingKey'] = routingKey;
    return json;
  }

  static List<RestaurantAdded> listFromJson(List<dynamic> json) {
    return json == null ? List<RestaurantAdded>() : json.map((value) => RestaurantAdded.fromJson(value)).toList();
  }

  static Map<String, RestaurantAdded> mapFromJson(Map<String, dynamic> json) {
    var map = Map<String, RestaurantAdded>();
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic value) => map[key] = RestaurantAdded.fromJson(value));
    }
    return map;
  }

  // maps a json object with a list of RestaurantAdded-objects as value to a dart map
  static Map<String, List<RestaurantAdded>> mapListFromJson(Map<String, dynamic> json) {
    var map = Map<String, List<RestaurantAdded>>();
     if (json != null && json.isNotEmpty) {
       json.forEach((String key, dynamic value) {
         map[key] = RestaurantAdded.listFromJson(value);
       });
     }
     return map;
  }
}

