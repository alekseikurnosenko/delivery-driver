part of openapi.api;

class CreateDishInput {
  
  String name = null;
  
  double price = null;
  CreateDishInput();

  @override
  String toString() {
    return 'CreateDishInput[name=$name, price=$price, ]';
  }

  CreateDishInput.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    name = json['name'];
    price = (json['price'] == null) ?
      null :
      json['price'].toDouble();
  }

  Map<String, dynamic> toJson() {
    Map <String, dynamic> json = {};
    if (name != null)
      json['name'] = name;
    if (price != null)
      json['price'] = price;
    return json;
  }

  static List<CreateDishInput> listFromJson(List<dynamic> json) {
    return json == null ? List<CreateDishInput>() : json.map((value) => CreateDishInput.fromJson(value)).toList();
  }

  static Map<String, CreateDishInput> mapFromJson(Map<String, dynamic> json) {
    var map = Map<String, CreateDishInput>();
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic value) => map[key] = CreateDishInput.fromJson(value));
    }
    return map;
  }

  // maps a json object with a list of CreateDishInput-objects as value to a dart map
  static Map<String, List<CreateDishInput>> mapListFromJson(Map<String, dynamic> json) {
    var map = Map<String, List<CreateDishInput>>();
     if (json != null && json.isNotEmpty) {
       json.forEach((String key, dynamic value) {
         map[key] = CreateDishInput.listFromJson(value);
       });
     }
     return map;
  }
}

