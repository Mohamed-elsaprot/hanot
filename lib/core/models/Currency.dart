class Currency {
  Currency({
      this.id, 
      this.name, 
      this.code, 
      this.symbol, 
      this.exchangeRate, 
      this.isDefault,});

  Currency.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    code = json['code'];
    symbol = json['symbol'];
    exchangeRate = json['exchange_rate'];
    isDefault = json['is_default'];
  }
  num? id;
  String? name;
  String? code;
  String? symbol;
  num? exchangeRate;
  bool? isDefault;
Currency copyWith({  num? id,
  String? name,
  String? code,
  String? symbol,
  num? exchangeRate,
  bool? isDefault,
}) => Currency(  id: id ?? this.id,
  name: name ?? this.name,
  code: code ?? this.code,
  symbol: symbol ?? this.symbol,
  exchangeRate: exchangeRate ?? this.exchangeRate,
  isDefault: isDefault ?? this.isDefault,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['code'] = code;
    map['symbol'] = symbol;
    map['exchange_rate'] = exchangeRate;
    map['is_default'] = isDefault;
    return map;
  }

}