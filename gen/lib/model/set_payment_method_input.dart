part of openapi.api;

class SetPaymentMethodInput {
  
  String paymentMethodId = null;
  SetPaymentMethodInput();

  @override
  String toString() {
    return 'SetPaymentMethodInput[paymentMethodId=$paymentMethodId, ]';
  }

  SetPaymentMethodInput.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    paymentMethodId = json['paymentMethodId'];
  }

  Map<String, dynamic> toJson() {
    Map <String, dynamic> json = {};
    if (paymentMethodId != null)
      json['paymentMethodId'] = paymentMethodId;
    return json;
  }

  static List<SetPaymentMethodInput> listFromJson(List<dynamic> json) {
    return json == null ? List<SetPaymentMethodInput>() : json.map((value) => SetPaymentMethodInput.fromJson(value)).toList();
  }

  static Map<String, SetPaymentMethodInput> mapFromJson(Map<String, dynamic> json) {
    var map = Map<String, SetPaymentMethodInput>();
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic value) => map[key] = SetPaymentMethodInput.fromJson(value));
    }
    return map;
  }

  // maps a json object with a list of SetPaymentMethodInput-objects as value to a dart map
  static Map<String, List<SetPaymentMethodInput>> mapListFromJson(Map<String, dynamic> json) {
    var map = Map<String, List<SetPaymentMethodInput>>();
     if (json != null && json.isNotEmpty) {
       json.forEach((String key, dynamic value) {
         map[key] = SetPaymentMethodInput.listFromJson(value);
       });
     }
     return map;
  }
}

