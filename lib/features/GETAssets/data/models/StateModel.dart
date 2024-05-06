class StateModel {
  final int? id;
  final int? countryId;
  final String? name;
  final String? isoCode;
  const StateModel({this.id, this.countryId, this.name, this.isoCode});
  StateModel copyWith(
      {int? id, int? countryId, String? name, String? isoCode}) {
    return StateModel(
        id: id ?? this.id,
        countryId: countryId ?? this.countryId,
        name: name ?? this.name,
        isoCode: isoCode ?? this.isoCode);
  }

  Map<String, Object?> toJson() {
    return {'id': id, 'countryId': countryId, 'name': name, 'isoCode': isoCode};
  }

  static StateModel fromJson(Map<String, Object?> json) {
    return StateModel(
        id: json['id'] == null ? null : json['id'] as int,
        countryId: json['countryId'] == null ? null : json['countryId'] as int,
        name: json['name'] == null ? null : json['name'] as String,
        isoCode: json['isoCode'] == null ? null : json['isoCode'] as String);
  }

  @override
  String toString() {
    return '''StateModel(
                id:$id,
countryId:$countryId,
name:$name,
isoCode:$isoCode
    ) ''';
  }

  @override
  bool operator ==(Object other) {
    return other is StateModel &&
        other.runtimeType == runtimeType &&
        other.id == id &&
        other.countryId == countryId &&
        other.name == name &&
        other.isoCode == isoCode;
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, id, countryId, name, isoCode);
  }
}
