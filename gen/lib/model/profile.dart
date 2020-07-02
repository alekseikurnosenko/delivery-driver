part of openapi.api;

class Profile {
  
  String id = null;
  
  String userId = null;
  
  Address deliveryAddress = null;
  
  String paymentMethodId = null;
  Profile();

  @override
  String toString() {
    return 'Profile[id=$id, userId=$userId, deliveryAddress=$deliveryAddress, paymentMethodId=$paymentMethodId, ]';
  }

  Profile.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    id = json['id'];
    userId = json['userId'];
    deliveryAddress = (json['deliveryAddress'] == null) ?
      null :
      Address.fromJson(json['deliveryAddress']);
    paymentMethodId = json['paymentMethodId'];
  }

  Map<String, dynamic> toJson() {
    Map <String, dynamic> json = {};
    if (id != null)
      json['id'] = id;
    if (userId != null)
      json['userId'] = userId;
    if (deliveryAddress != null)
      json['deliveryAddress'] = deliveryAddress;
    if (paymentMethodId != null)
      json['paymentMethodId'] = paymentMethodId;
    return json;
  }

  static List<Profile> listFromJson(List<dynamic> json) {
    return json == null ? List<Profile>() : json.map((value) => Profile.fromJson(value)).toList();
  }

  static Map<String, Profile> mapFromJson(Map<String, dynamic> json) {
    var map = Map<String, Profile>();
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic value) => map[key] = Profile.fromJson(value));
    }
    return map;
  }

  // maps a json object with a list of Profile-objects as value to a dart map
  static Map<String, List<Profile>> mapListFromJson(Map<String, dynamic> json) {
    var map = Map<String, List<Profile>>();
     if (json != null && json.isNotEmpty) {
       json.forEach((String key, dynamic value) {
         map[key] = Profile.listFromJson(value);
       });
     }
     return map;
  }
}

