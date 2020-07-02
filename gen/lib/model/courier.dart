part of openapi.api;

class Courier {
  
  String id = null;
  
  String fullName = null;
  
  bool onShift = null;
  
  LatLng location = null;
  
  List<Order> activeOrders = [];
  Courier();

  @override
  String toString() {
    return 'Courier[id=$id, fullName=$fullName, onShift=$onShift, location=$location, activeOrders=$activeOrders, ]';
  }

  Courier.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    id = json['id'];
    fullName = json['fullName'];
    onShift = json['onShift'];
    location = (json['location'] == null) ?
      null :
      LatLng.fromJson(json['location']);
    activeOrders = (json['activeOrders'] == null) ?
      null :
      Order.listFromJson(json['activeOrders']);
  }

  Map<String, dynamic> toJson() {
    Map <String, dynamic> json = {};
    if (id != null)
      json['id'] = id;
    if (fullName != null)
      json['fullName'] = fullName;
    if (onShift != null)
      json['onShift'] = onShift;
    if (location != null)
      json['location'] = location;
    if (activeOrders != null)
      json['activeOrders'] = activeOrders;
    return json;
  }

  static List<Courier> listFromJson(List<dynamic> json) {
    return json == null ? List<Courier>() : json.map((value) => Courier.fromJson(value)).toList();
  }

  static Map<String, Courier> mapFromJson(Map<String, dynamic> json) {
    var map = Map<String, Courier>();
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic value) => map[key] = Courier.fromJson(value));
    }
    return map;
  }

  // maps a json object with a list of Courier-objects as value to a dart map
  static Map<String, List<Courier>> mapListFromJson(Map<String, dynamic> json) {
    var map = Map<String, List<Courier>>();
     if (json != null && json.isNotEmpty) {
       json.forEach((String key, dynamic value) {
         map[key] = Courier.listFromJson(value);
       });
     }
     return map;
  }
}

