part of openapi.api;

class RemoveFromBasketInput {
  
  String dishId = null;
  
  String restaurantId = null;
  
  int quantity = null;
  RemoveFromBasketInput();

  @override
  String toString() {
    return 'RemoveFromBasketInput[dishId=$dishId, restaurantId=$restaurantId, quantity=$quantity, ]';
  }

  RemoveFromBasketInput.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    dishId = json['dishId'];
    restaurantId = json['restaurantId'];
    quantity = json['quantity'];
  }

  Map<String, dynamic> toJson() {
    Map <String, dynamic> json = {};
    if (dishId != null)
      json['dishId'] = dishId;
    if (restaurantId != null)
      json['restaurantId'] = restaurantId;
    if (quantity != null)
      json['quantity'] = quantity;
    return json;
  }

  static List<RemoveFromBasketInput> listFromJson(List<dynamic> json) {
    return json == null ? List<RemoveFromBasketInput>() : json.map((value) => RemoveFromBasketInput.fromJson(value)).toList();
  }

  static Map<String, RemoveFromBasketInput> mapFromJson(Map<String, dynamic> json) {
    var map = Map<String, RemoveFromBasketInput>();
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic value) => map[key] = RemoveFromBasketInput.fromJson(value));
    }
    return map;
  }

  // maps a json object with a list of RemoveFromBasketInput-objects as value to a dart map
  static Map<String, List<RemoveFromBasketInput>> mapListFromJson(Map<String, dynamic> json) {
    var map = Map<String, List<RemoveFromBasketInput>>();
     if (json != null && json.isNotEmpty) {
       json.forEach((String key, dynamic value) {
         map[key] = RemoveFromBasketInput.listFromJson(value);
       });
     }
     return map;
  }
}

