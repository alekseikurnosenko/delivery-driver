part of openapi.api;

class DeliveryRequestDTO {
  
  String orderId = null;
  
  String courierId = null;
  
  Address pickup = null;
  
  Address dropoff = null;
  DeliveryRequestDTO();

  @override
  String toString() {
    return 'DeliveryRequestDTO[orderId=$orderId, courierId=$courierId, pickup=$pickup, dropoff=$dropoff, ]';
  }

  DeliveryRequestDTO.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    orderId = json['orderId'];
    courierId = json['courierId'];
    pickup = (json['pickup'] == null) ?
      null :
      Address.fromJson(json['pickup']);
    dropoff = (json['dropoff'] == null) ?
      null :
      Address.fromJson(json['dropoff']);
  }

  Map<String, dynamic> toJson() {
    Map <String, dynamic> json = {};
    if (orderId != null)
      json['orderId'] = orderId;
    if (courierId != null)
      json['courierId'] = courierId;
    if (pickup != null)
      json['pickup'] = pickup;
    if (dropoff != null)
      json['dropoff'] = dropoff;
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

