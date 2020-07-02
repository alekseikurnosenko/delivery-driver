part of openapi.api;

class DeliveryRequestDTO {
  
  String orderId = null;
  DeliveryRequestDTO();

  @override
  String toString() {
    return 'DeliveryRequestDTO[orderId=$orderId, ]';
  }

  DeliveryRequestDTO.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    orderId = json['orderId'];
  }

  Map<String, dynamic> toJson() {
    Map <String, dynamic> json = {};
    if (orderId != null)
      json['orderId'] = orderId;
    return json;
  }

  static List<DeliveryRequestDTO> listFromJson(List<dynamic> json) {
    return json == null ? List<DeliveryRequestDTO>() : json.map((value) => DeliveryRequestDTO.fromJson(value)).toList();
  }

  static Map<String, DeliveryRequestDTO> mapFromJson(Map<String, dynamic> json) {
    var map = Map<String, DeliveryRequestDTO>();
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic value) => map[key] = DeliveryRequestDTO.fromJson(value));
    }
    return map;
  }

  // maps a json object with a list of DeliveryRequestDTO-objects as value to a dart map
  static Map<String, List<DeliveryRequestDTO>> mapListFromJson(Map<String, dynamic> json) {
    var map = Map<String, List<DeliveryRequestDTO>>();
     if (json != null && json.isNotEmpty) {
       json.forEach((String key, dynamic value) {
         map[key] = DeliveryRequestDTO.listFromJson(value);
       });
     }
     return map;
  }
}

