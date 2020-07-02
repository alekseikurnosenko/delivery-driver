part of openapi.api;

class UpdateLocationInput {
  
  LatLng latLng = null;
  UpdateLocationInput();

  @override
  String toString() {
    return 'UpdateLocationInput[latLng=$latLng, ]';
  }

  UpdateLocationInput.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    latLng = (json['latLng'] == null) ?
      null :
      LatLng.fromJson(json['latLng']);
  }

  Map<String, dynamic> toJson() {
    Map <String, dynamic> json = {};
    if (latLng != null)
      json['latLng'] = latLng;
    return json;
  }

  static List<UpdateLocationInput> listFromJson(List<dynamic> json) {
    return json == null ? List<UpdateLocationInput>() : json.map((value) => UpdateLocationInput.fromJson(value)).toList();
  }

  static Map<String, UpdateLocationInput> mapFromJson(Map<String, dynamic> json) {
    var map = Map<String, UpdateLocationInput>();
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic value) => map[key] = UpdateLocationInput.fromJson(value));
    }
    return map;
  }

  // maps a json object with a list of UpdateLocationInput-objects as value to a dart map
  static Map<String, List<UpdateLocationInput>> mapListFromJson(Map<String, dynamic> json) {
    var map = Map<String, List<UpdateLocationInput>>();
     if (json != null && json.isNotEmpty) {
       json.forEach((String key, dynamic value) {
         map[key] = UpdateLocationInput.listFromJson(value);
       });
     }
     return map;
  }
}

