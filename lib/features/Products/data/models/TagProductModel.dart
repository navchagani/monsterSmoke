class TagContent {
  final int? id;
  final String? name;
  final dynamic color;
  final int? sequenceNumber;
  final bool? ecommerce;
  final int? productTagId;
  const TagContent(
      {this.id,
      this.name,
      this.color,
      this.sequenceNumber,
      this.ecommerce,
      this.productTagId});
  TagContent copyWith(
      {int? id,
      String? name,
      dynamic color,
      int? sequenceNumber,
      bool? ecommerce,
      int? productTagId}) {
    return TagContent(
        id: id ?? this.id,
        name: name ?? this.name,
        color: color ?? this.color,
        sequenceNumber: sequenceNumber ?? this.sequenceNumber,
        ecommerce: ecommerce ?? this.ecommerce,
        productTagId: productTagId ?? this.productTagId);
  }

  Map<String, Object?> toJson() {
    return {
      'id': id,
      'name': name,
      'color': color,
      'sequenceNumber': sequenceNumber,
      'ecommerce': ecommerce,
      'productTagId': productTagId
    };
  }

  static TagContent fromJson(Map<String, Object?> json) {
    return TagContent(
        id: json['id'] == null ? null : json['id'] as int,
        name: json['name'] == null ? null : json['name'] as String,
        color: json['color'] as dynamic,
        sequenceNumber: json['sequenceNumber'] == null
            ? null
            : json['sequenceNumber'] as int,
        ecommerce: json['ecommerce'] == null ? null : json['ecommerce'] as bool,
        productTagId:
            json['productTagId'] == null ? null : json['productTagId'] as int);
  }

  @override
  String toString() {
    return '''TagContent(
                id:$id,
name:$name,
color:$color,
sequenceNumber:$sequenceNumber,
ecommerce:$ecommerce,
productTagId:$productTagId
    ) ''';
  }

  @override
  bool operator ==(Object other) {
    return other is TagContent &&
        other.runtimeType == runtimeType &&
        other.id == id &&
        other.name == name &&
        other.color == color &&
        other.sequenceNumber == sequenceNumber &&
        other.ecommerce == ecommerce &&
        other.productTagId == productTagId;
  }

  @override
  int get hashCode {
    return Object.hash(
        runtimeType, id, name, color, sequenceNumber, ecommerce, productTagId);
  }
}
