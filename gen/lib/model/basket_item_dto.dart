part of openapi.api;

class BasketItemDTO {
  
  DishDTO dish = null;
  
  int quantity = null;
  BasketItemDTO();

  @override
  String toString() {
    return 'BasketItemDTO[dish=$dish, quantity=$quantity, ]';
  }

  BasketItemDTO.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    dish = (json['dish'] == null) ?
      null :
      DishDTO.fromJson(json['dish']);
    quantity = json['quantity'];
  }

  Map<String, dynamic> toJson() {
    Map <String, dynamic> json = {};
    if (dish != null)
      json['dish'] = dish;
    if (quantity != null)
      json['quantity'] = quantity;
    return json;
  }

  static List<BasketItemDTO> listFromJson(List<dynamic> json) {
    return json == null ? List<BasketItemDTO>() : json.map((value) => BasketItemDTO.fromJson(value)).toList();
  }

  static Map<String, BasketItemDTO> mapFromJson(Map<String, dynamic> json) {
    var map = Map<String, BasketItemDTO>();
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic value) => map[key] = BasketItemDTO.fromJson(value));
    }
    return map;
  }

  // maps a json object with a list of BasketItemDTO-objects as value to a dart map
  static Map<String, List<BasketItemDTO>> mapListFromJson(Map<String, dynamic> json) {
    var map = Map<String, List<BasketItemDTO>>();
     if (json != null && json.isNotEmpty) {
       json.forEach((String key, dynamic value) {
         map[key] = BasketItemDTO.listFromJson(value);
       });
     }
     return map;
  }
}

