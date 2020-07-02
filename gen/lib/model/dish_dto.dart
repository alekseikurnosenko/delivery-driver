part of openapi.api;

class DishDTO {
  
  String id = null;
  
  String name = null;
  
  MoneyView price = null;
  DishDTO();

  @override
  String toString() {
    return 'DishDTO[id=$id, name=$name, price=$price, ]';
  }

  DishDTO.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    id = json['id'];
    name = json['name'];
    price = (json['price'] == null) ?
      null :
      MoneyView.fromJson(json['price']);
  }

  Map<String, dynamic> toJson() {
    Map <String, dynamic> json = {};
    if (id != null)
      json['id'] = id;
    if (name != null)
      json['name'] = name;
    if (price != null)
      json['price'] = price;
    return json;
  }

  static List<DishDTO> listFromJson(List<dynamic> json) {
    return json == null ? List<DishDTO>() : json.map((value) => DishDTO.fromJson(value)).toList();
  }

  static Map<String, DishDTO> mapFromJson(Map<String, dynamic> json) {
    var map = Map<String, DishDTO>();
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic value) => map[key] = DishDTO.fromJson(value));
    }
    return map;
  }

  // maps a json object with a list of DishDTO-objects as value to a dart map
  static Map<String, List<DishDTO>> mapListFromJson(Map<String, dynamic> json) {
    var map = Map<String, List<DishDTO>>();
     if (json != null && json.isNotEmpty) {
       json.forEach((String key, dynamic value) {
         map[key] = DishDTO.listFromJson(value);
       });
     }
     return map;
  }
}

