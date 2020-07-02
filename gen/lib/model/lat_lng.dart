part of openapi.api;

class LatLng {
  
  double latitude = null;
  
  double longitude = null;
  LatLng();

  @override
  String toString() {
    return 'LatLng[latitude=$latitude, longitude=$longitude, ]';
  }

  LatLng.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    latitude = json['latitude'];
    longitude = json['longitude'];
  }

  Map<String, dynamic> toJson() {
    Map <String, dynamic> json = {};
    if (latitude != null)
      json['latitude'] = latitude;
    if (longitude != null)
      json['longitude'] = longitude;
    return json;
  }

  static List<LatLng> listFromJson(List<dynamic> json) {
    return json == null ? List<LatLng>() : json.map((value) => LatLng.fromJson(value)).toList();
  }

  static Map<String, LatLng> mapFromJson(Map<String, dynamic> json) {
    var map = Map<String, LatLng>();
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic value) => map[key] = LatLng.fromJson(value));
    }
    return map;
  }

  // maps a json object with a list of LatLng-objects as value to a dart map
  static Map<String, List<LatLng>> mapListFromJson(Map<String, dynamic> json) {
    var map = Map<String, List<LatLng>>();
     if (json != null && json.isNotEmpty) {
       json.forEach((String key, dynamic value) {
         map[key] = LatLng.listFromJson(value);
       });
     }
     return map;
  }
}

