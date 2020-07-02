part of openapi.api;

class AddItemToBasketInput {
  
  String dishId = null;
  
  String restaurantId = null;
  
  int quantity = null;
  
  bool forceNewBasket = null;
  AddItemToBasketInput();

  @override
  String toString() {
    return 'AddItemToBasketInput[dishId=$dishId, restaurantId=$restaurantId, quantity=$quantity, forceNewBasket=$forceNewBasket, ]';
  }

  AddItemToBasketInput.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    dishId = json['dishId'];
    restaurantId = json['restaurantId'];
    quantity = json['quantity'];
    forceNewBasket = json['forceNewBasket'];
  }

  Map<String, dynamic> toJson() {
    Map <String, dynamic> json = {};
    if (dishId != null)
      json['dishId'] = dishId;
    if (restaurantId != null)
      json['restaurantId'] = restaurantId;
    if (quantity != null)
      json['quantity'] = quantity;
    if (forceNewBasket != null)
      json['forceNewBasket'] = forceNewBasket;
    return json;
  }

  static List<AddItemToBasketInput> listFromJson(List<dynamic> json) {
    return json == null ? List<AddItemToBasketInput>() : json.map((value) => AddItemToBasketInput.fromJson(value)).toList();
  }

  static Map<String, AddItemToBasketInput> mapFromJson(Map<String, dynamic> json) {
    var map = Map<String, AddItemToBasketInput>();
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic value) => map[key] = AddItemToBasketInput.fromJson(value));
    }
    return map;
  }

  // maps a json object with a list of AddItemToBasketInput-objects as value to a dart map
  static Map<String, List<AddItemToBasketInput>> mapListFromJson(Map<String, dynamic> json) {
    var map = Map<String, List<AddItemToBasketInput>>();
     if (json != null && json.isNotEmpty) {
       json.forEach((String key, dynamic value) {
         map[key] = AddItemToBasketInput.listFromJson(value);
       });
     }
     return map;
  }
}

