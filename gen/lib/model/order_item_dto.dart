part of openapi.api;

class OrderItemDTO {
  
  DishDTO dish = null;
  
  int quantity = null;
  OrderItemDTO();

  @override
  String toString() {
    return 'OrderItemDTO[dish=$dish, quantity=$quantity, ]';
  }

  OrderItemDTO.fromJson(Map<String, dynamic> json) {
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

  static List<OrderItemDTO> listFromJson(List<dynamic> json) {
    return json == null ? List<OrderItemDTO>() : json.map((value) => OrderItemDTO.fromJson(value)).toList();
  }

  static Map<String, OrderItemDTO> mapFromJson(Map<String, dynamic> json) {
    var map = Map<String, OrderItemDTO>();
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic value) => map[key] = OrderItemDTO.fromJson(value));
    }
    return map;
  }

  // maps a json object with a list of OrderItemDTO-objects as value to a dart map
  static Map<String, List<OrderItemDTO>> mapListFromJson(Map<String, dynamic> json) {
    var map = Map<String, List<OrderItemDTO>>();
     if (json != null && json.isNotEmpty) {
       json.forEach((String key, dynamic value) {
         map[key] = OrderItemDTO.listFromJson(value);
       });
     }
     return map;
  }
}

