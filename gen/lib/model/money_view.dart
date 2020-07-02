part of openapi.api;

class MoneyView {
  
  double amount = null;
  
  String currencyCode = null;
  
  String formatted = null;
  MoneyView();

  @override
  String toString() {
    return 'MoneyView[amount=$amount, currencyCode=$currencyCode, formatted=$formatted, ]';
  }

  MoneyView.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    amount = (json['amount'] == null) ?
      null :
      json['amount'].toDouble();
    currencyCode = json['currencyCode'];
    formatted = json['formatted'];
  }

  Map<String, dynamic> toJson() {
    Map <String, dynamic> json = {};
    if (amount != null)
      json['amount'] = amount;
    if (currencyCode != null)
      json['currencyCode'] = currencyCode;
    if (formatted != null)
      json['formatted'] = formatted;
    return json;
  }

  static List<MoneyView> listFromJson(List<dynamic> json) {
    return json == null ? List<MoneyView>() : json.map((value) => MoneyView.fromJson(value)).toList();
  }

  static Map<String, MoneyView> mapFromJson(Map<String, dynamic> json) {
    var map = Map<String, MoneyView>();
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic value) => map[key] = MoneyView.fromJson(value));
    }
    return map;
  }

  // maps a json object with a list of MoneyView-objects as value to a dart map
  static Map<String, List<MoneyView>> mapListFromJson(Map<String, dynamic> json) {
    var map = Map<String, List<MoneyView>>();
     if (json != null && json.isNotEmpty) {
       json.forEach((String key, dynamic value) {
         map[key] = MoneyView.listFromJson(value);
       });
     }
     return map;
  }
}

