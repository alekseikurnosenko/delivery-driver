part of openapi.api;

class CreateRestaurantInput {
  
  String name = null;
  
  Address address = null;
  
  String currency = null;
  CreateRestaurantInput();

  @override
  String toString() {
    return 'CreateRestaurantInput[name=$name, address=$address, currency=$currency, ]';
  }

  CreateRestaurantInput.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    name = json['name'];
    address = (json['address'] == null) ?
      null :
      Address.fromJson(json['address']);
    currency = json['currency'];
  }

  Map<String, dynamic> toJson() {
    Map <String, dynamic> json = {};
    if (name != null)
      json['name'] = name;
    if (address != null)
      json['address'] = address;
    if (currency != null)
      json['currency'] = currency;
    return json;
  }

  static List<CreateRestaurantInput> listFromJson(List<dynamic> json) {
    return json == null ? List<CreateRestaurantInput>() : json.map((value) => CreateRestaurantInput.fromJson(value)).toList();
  }

  static Map<String, CreateRestaurantInput> mapFromJson(Map<String, dynamic> json) {
    var map = Map<String, CreateRestaurantInput>();
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic value) => map[key] = CreateRestaurantInput.fromJson(value));
    }
    return map;
  }

  // maps a json object with a list of CreateRestaurantInput-objects as value to a dart map
  static Map<String, List<CreateRestaurantInput>> mapListFromJson(Map<String, dynamic> json) {
    var map = Map<String, List<CreateRestaurantInput>>();
     if (json != null && json.isNotEmpty) {
       json.forEach((String key, dynamic value) {
         map[key] = CreateRestaurantInput.listFromJson(value);
       });
     }
     return map;
  }
}

