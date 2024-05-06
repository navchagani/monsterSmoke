class CountryModel {
  final int? id;
  final String? name;
  final String? code;
  const CountryModel({this.id, this.name, this.code});
  CountryModel copyWith({int? id, String? name, String? code}) {
    return CountryModel(
        id: id ?? this.id, name: name ?? this.name, code: code ?? this.code);
  }

  Map<String, Object?> toJson() {
    return {'id': id, 'name': name, 'code': code};
  }

  static CountryModel fromJson(Map<String, Object?> json) {
    return CountryModel(
        id: json['id'] == null ? null : json['id'] as int,
        name: json['name'] == null ? null : json['name'] as String,
        code: json['code'] == null ? null : json['code'] as String);
  }

  @override
  String toString() {
    return '''CountryModel(
                id:$id,
name:$name,
code:$code
    ) ''';
  }

  @override
  bool operator ==(Object other) {
    return other is CountryModel &&
        other.runtimeType == runtimeType &&
        other.id == id &&
        other.name == name &&
        other.code == code;
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, id, name, code);
  }
}
