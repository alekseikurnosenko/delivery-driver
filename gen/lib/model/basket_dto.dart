part of openapi.api;

class BasketDTO {
  
  List<BasketItemDTO> items = [];
  
  MoneyView totalAmount = null;
  
  bool isAboveMinimumOrder = null;
  
  bool aboveMinimumOrder = null;
  BasketDTO();

  @override
  String toString() {
    return 'BasketDTO[items=$items, totalAmount=$totalAmount, isAboveMinimumOrder=$isAboveMinimumOrder, aboveMinimumOrder=$aboveMinimumOrder, ]';
  }

  BasketDTO.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    items = (json['items'] == null) ?
      null :
      BasketItemDTO.listFromJson(json['items']);
    totalAmount = (json['totalAmount'] == null) ?
      null :
      MoneyView.fromJson(json['totalAmount']);
    isAboveMinimumOrder = json['isAboveMinimumOrder'];
    aboveMinimumOrder = json['aboveMinimumOrder'];
  }

  Map<String, dynamic> toJson() {
    Map <String, dynamic> json = {};
    if (items != null)
      json['items'] = items;
    if (totalAmount != null)
      json['totalAmount'] = totalAmount;
    if (isAboveMinimumOrder != null)
      json['isAboveMinimumOrder'] = isAboveMinimumOrder;
    if (aboveMinimumOrder != null)
      json['aboveMinimumOrder'] = aboveMinimumOrder;
    return json;
  }

  static List<BasketDTO> listFromJson(List<dynamic> json) {
    return json == null ? List<BasketDTO>() : json.map((value) => BasketDTO.fromJson(value)).toList();
  }

  static Map<String, BasketDTO> mapFromJson(Map<String, dynamic> json) {
    var map = Map<String, BasketDTO>();
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic value) => map[key] = BasketDTO.fromJson(value));
    }
    return map;
  }

  // maps a json object with a list of BasketDTO-objects as value to a dart map
  static Map<String, List<BasketDTO>> mapListFromJson(Map<String, dynamic> json) {
    var map = Map<String, List<BasketDTO>>();
     if (json != null && json.isNotEmpty) {
       json.forEach((String key, dynamic value) {
         map[key] = BasketDTO.listFromJson(value);
       });
     }
     return map;
  }
}

