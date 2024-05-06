class SliderModel {
  final int? id;
  final int? storeId;
  final String? imageUrl;
  final String? sliderType;
  final int? sliderTypeId;
  final String? config;
  final int? businessTypeId;
  final int? sequenceNumber;
  final String? redirectPath;
  final String? uploadDirectoryPath;
  final bool? customerSpecific;
  const SliderModel(
      {this.id,
      this.storeId,
      this.imageUrl,
      this.sliderType,
      this.sliderTypeId,
      this.config,
      this.businessTypeId,
      this.sequenceNumber,
      this.redirectPath,
      this.uploadDirectoryPath,
      this.customerSpecific});
  SliderModel copyWith(
      {int? id,
      int? storeId,
      String? imageUrl,
      String? sliderType,
      int? sliderTypeId,
      String? config,
      int? businessTypeId,
      int? sequenceNumber,
      String? redirectPath,
      String? uploadDirectoryPath,
      bool? customerSpecific}) {
    return SliderModel(
        id: id ?? this.id,
        storeId: storeId ?? this.storeId,
        imageUrl: imageUrl ?? this.imageUrl,
        sliderType: sliderType ?? this.sliderType,
        sliderTypeId: sliderTypeId ?? this.sliderTypeId,
        config: config ?? this.config,
        businessTypeId: businessTypeId ?? this.businessTypeId,
        sequenceNumber: sequenceNumber ?? this.sequenceNumber,
        redirectPath: redirectPath ?? this.redirectPath,
        uploadDirectoryPath: uploadDirectoryPath ?? this.uploadDirectoryPath,
        customerSpecific: customerSpecific ?? this.customerSpecific);
  }

  Map<String, Object?> toJson() {
    return {
      'id': id,
      'storeId': storeId,
      'imageUrl': imageUrl,
      'sliderType': sliderType,
      'sliderTypeId': sliderTypeId,
      'config': config,
      'businessTypeId': businessTypeId,
      'sequenceNumber': sequenceNumber,
      'redirectPath': redirectPath,
      'uploadDirectoryPath': uploadDirectoryPath,
      'customerSpecific': customerSpecific
    };
  }

  static SliderModel fromJson(Map<String, Object?> json) {
    return SliderModel(
        id: json['id'] == null ? null : json['id'] as int,
        storeId: json['storeId'] == null ? null : json['storeId'] as int,
        imageUrl: json['imageUrl'] == null ? null : json['imageUrl'] as String,
        sliderType:
            json['sliderType'] == null ? null : json['sliderType'] as String,
        sliderTypeId:
            json['sliderTypeId'] == null ? null : json['sliderTypeId'] as int,
        config: json['config'] as String?,
        businessTypeId: json['businessTypeId'] == null
            ? null
            : json['businessTypeId'] as int,
        sequenceNumber: json['sequenceNumber'] == null
            ? null
            : json['sequenceNumber'] as int,
        redirectPath: json['redirectPath'] as String?,
        uploadDirectoryPath: json['uploadDirectoryPath'] == null
            ? null
            : json['uploadDirectoryPath'] as String,
        customerSpecific: json['customerSpecific'] == null
            ? null
            : json['customerSpecific'] as bool);
  }

  @override
  String toString() {
    return '''SliderModel(
                id:$id,
storeId:$storeId,
imageUrl:$imageUrl,
sliderType:$sliderType,
sliderTypeId:$sliderTypeId,
config:$config,
businessTypeId:$businessTypeId,
sequenceNumber:$sequenceNumber,
redirectPath:$redirectPath,
uploadDirectoryPath:$uploadDirectoryPath,
customerSpecific:$customerSpecific
    ) ''';
  }

  @override
  bool operator ==(Object other) {
    return other is SliderModel &&
        other.runtimeType == runtimeType &&
        other.id == id &&
        other.storeId == storeId &&
        other.imageUrl == imageUrl &&
        other.sliderType == sliderType &&
        other.sliderTypeId == sliderTypeId &&
        other.config == config &&
        other.businessTypeId == businessTypeId &&
        other.sequenceNumber == sequenceNumber &&
        other.redirectPath == redirectPath &&
        other.uploadDirectoryPath == uploadDirectoryPath &&
        other.customerSpecific == customerSpecific;
  }

  @override
  int get hashCode {
    return Object.hash(
        runtimeType,
        id,
        storeId,
        imageUrl,
        sliderType,
        sliderTypeId,
        config,
        businessTypeId,
        sequenceNumber,
        redirectPath,
        uploadDirectoryPath,
        customerSpecific);
  }
}
