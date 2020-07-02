part of openapi.api;

class Restaurant {
  
  String id = null;
  
  String name = null;
  
  Address address = null;
  Restaurant();

  @override
  String toString() {
    return 'Restaurant[id=$id, name=$name, address=$address, ]';
  }

  Restaurant.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    id = json['id'];
    name = json['name'];
    address = (json['address'] == null) ?
      null :
      Address.fromJson(json['address']);
  }

  Map<String, dynamic> toJson() {
    Map <String, dynamic> json = {};
    if (id != null)
      json['id'] = id;
    if (name != null)
      json['name'] = name;
    if (address != null)
      json['address'] = address;
    return json;
  }

  static List<Restaurant> listFromJson(List<dynamic> json) {
    return json == null ? List<Restaurant>() : json.map((value) => Restaurant.fromJson(value)).toList();
  }

  static Map<String, Restaurant> mapFromJson(Map<String, dynamic> json) {
    var map = Map<String, Restaurant>();
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic value) => map[key] = Restaurant.fromJson(value));
    }
    return map;
  }

  // maps a json object with a list of Restaurant-objects as value to a dart map
  static Map<String, List<Restaurant>> mapListFromJson(Map<String, dynamic> json) {
    var map = Map<String, List<Restaurant>>();
     if (json != null && json.isNotEmpty) {
       json.forEach((String key, dynamic value) {
         map[key] = Restaurant.listFromJson(value);
       });
     }
     return map;
  }
}

