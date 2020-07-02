part of openapi.api;

class Address {
  
  LatLng location = null;
  
  String address = null;
  
  String city = null;
  
  String country = null;
  Address();

  @override
  String toString() {
    return 'Address[location=$location, address=$address, city=$city, country=$country, ]';
  }

  Address.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    location = (json['location'] == null) ?
      null :
      LatLng.fromJson(json['location']);
    address = json['address'];
    city = json['city'];
    country = json['country'];
  }

  Map<String, dynamic> toJson() {
    Map <String, dynamic> json = {};
    if (location != null)
      json['location'] = location;
    if (address != null)
      json['address'] = address;
    if (city != null)
      json['city'] = city;
    if (country != null)
      json['country'] = country;
    return json;
  }

  static List<Address> listFromJson(List<dynamic> json) {
    return json == null ? List<Address>() : json.map((value) => Address.fromJson(value)).toList();
  }

  static Map<String, Address> mapFromJson(Map<String, dynamic> json) {
    var map = Map<String, Address>();
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic value) => map[key] = Address.fromJson(value));
    }
    return map;
  }

  // maps a json object with a list of Address-objects as value to a dart map
  static Map<String, List<Address>> mapListFromJson(Map<String, dynamic> json) {
    var map = Map<String, List<Address>>();
     if (json != null && json.isNotEmpty) {
       json.forEach((String key, dynamic value) {
         map[key] = Address.listFromJson(value);
       });
     }
     return map;
  }
}

