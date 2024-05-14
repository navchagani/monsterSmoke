class ShippingAddressModel {
  final int? id;
  final String? name;
  final dynamic description;
  final double? amount;
  final bool? ecommerce;
  final double? freeShippingLimit;
  final String? trackingUrl;
  final int? sequenceNumber;
  final dynamic shippingPriceRange;
  final dynamic code;
  final dynamic parentShippingId;
  final bool? active;
  final bool? systemCreated;
  const ShippingAddressModel(
      {this.id,
      this.name,
      this.description,
      this.amount,
      this.ecommerce,
      this.freeShippingLimit,
      this.trackingUrl,
      this.sequenceNumber,
      this.shippingPriceRange,
      this.code,
      this.parentShippingId,
      this.active,
      this.systemCreated});
  ShippingAddressModel copyWith(
      {int? id,
      String? name,
      dynamic description,
      double? amount,
      bool? ecommerce,
      double? freeShippingLimit,
      String? trackingUrl,
      int? sequenceNumber,
      dynamic shippingPriceRange,
      dynamic code,
      dynamic parentShippingId,
      bool? active,
      bool? systemCreated}) {
    return ShippingAddressModel(
        id: id ?? this.id,
        name: name ?? this.name,
        description: description ?? this.description,
        amount: amount ?? this.amount,
        ecommerce: ecommerce ?? this.ecommerce,
        freeShippingLimit: freeShippingLimit ?? this.freeShippingLimit,
        trackingUrl: trackingUrl ?? this.trackingUrl,
        sequenceNumber: sequenceNumber ?? this.sequenceNumber,
        shippingPriceRange: shippingPriceRange ?? this.shippingPriceRange,
        code: code ?? this.code,
        parentShippingId: parentShippingId ?? this.parentShippingId,
        active: active ?? this.active,
        systemCreated: systemCreated ?? this.systemCreated);
  }

  Map<String, Object?> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'amount': amount,
      'ecommerce': ecommerce,
      'freeShippingLimit': freeShippingLimit,
      'trackingUrl': trackingUrl,
      'sequenceNumber': sequenceNumber,
      'shippingPriceRange': shippingPriceRange,
      'code': code,
      'parentShippingId': parentShippingId,
      'active': active,
      'systemCreated': systemCreated
    };
  }

  static ShippingAddressModel fromJson(Map<String, Object?> json) {
    return ShippingAddressModel(
        id: json['id'] == null ? null : json['id'] as int,
        name: json['name'] == null ? null : json['name'] as String,
        description: json['description'] as dynamic,
        amount: json['amount'] == null ? null : json['amount'] as double,
        ecommerce: json['ecommerce'] == null ? null : json['ecommerce'] as bool,
        freeShippingLimit: json['freeShippingLimit'] == null
            ? null
            : json['freeShippingLimit'] as double,
        trackingUrl:
            json['trackingUrl'] == null ? null : json['trackingUrl'] as String,
        sequenceNumber: json['sequenceNumber'] == null
            ? null
            : json['sequenceNumber'] as int,
        shippingPriceRange: json['shippingPriceRange'] as dynamic,
        code: json['code'] as dynamic,
        parentShippingId: json['parentShippingId'] as dynamic,
        active: json['active'] == null ? null : json['active'] as bool,
        systemCreated: json['systemCreated'] == null
            ? null
            : json['systemCreated'] as bool);
  }

  @override
  String toString() {
    return '''ShippingAddressModel(
                id:$id,
name:$name,
description:$description,
amount:$amount,
ecommerce:$ecommerce,
freeShippingLimit:$freeShippingLimit,
trackingUrl:$trackingUrl,
sequenceNumber:$sequenceNumber,
shippingPriceRange:$shippingPriceRange,
code:$code,
parentShippingId:$parentShippingId,
active:$active,
systemCreated:$systemCreated
    ) ''';
  }

  @override
  bool operator ==(Object other) {
    return other is ShippingAddressModel &&
        other.runtimeType == runtimeType &&
        other.id == id &&
        other.name == name &&
        other.description == description &&
        other.amount == amount &&
        other.ecommerce == ecommerce &&
        other.freeShippingLimit == freeShippingLimit &&
        other.trackingUrl == trackingUrl &&
        other.sequenceNumber == sequenceNumber &&
        other.shippingPriceRange == shippingPriceRange &&
        other.code == code &&
        other.parentShippingId == parentShippingId &&
        other.active == active &&
        other.systemCreated == systemCreated;
  }

  @override
  int get hashCode {
    return Object.hash(
        runtimeType,
        id,
        name,
        description,
        amount,
        ecommerce,
        freeShippingLimit,
        trackingUrl,
        sequenceNumber,
        shippingPriceRange,
        code,
        parentShippingId,
        active,
        systemCreated);
  }
}
