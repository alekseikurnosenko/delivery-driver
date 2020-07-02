part of openapi.api;

class CreateCourierInput {
  
  String name = null;
  CreateCourierInput();

  @override
  String toString() {
    return 'CreateCourierInput[name=$name, ]';
  }

  CreateCourierInput.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    Map <String, dynamic> json = {};
    if (name != null)
      json['name'] = name;
    return json;
  }

  static List<CreateCourierInput> listFromJson(List<dynamic> json) {
    return json == null ? List<CreateCourierInput>() : json.map((value) => CreateCourierInput.fromJson(value)).toList();
  }

  static Map<String, CreateCourierInput> mapFromJson(Map<String, dynamic> json) {
    var map = Map<String, CreateCourierInput>();
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic value) => map[key] = CreateCourierInput.fromJson(value));
    }
    return map;
  }

  // maps a json object with a list of CreateCourierInput-objects as value to a dart map
  static Map<String, List<CreateCourierInput>> mapListFromJson(Map<String, dynamic> json) {
    var map = Map<String, List<CreateCourierInput>>();
     if (json != null && json.isNotEmpty) {
       json.forEach((String key, dynamic value) {
         map[key] = CreateCourierInput.listFromJson(value);
       });
     }
     return map;
  }
}

