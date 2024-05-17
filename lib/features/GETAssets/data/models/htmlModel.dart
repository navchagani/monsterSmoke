class HtmlModel {
  final int? id;
  final int? createdBy;
  final String? insertedTimestamp;
  final int? updatedBy;
  final String? updatedTimestamp;
  final dynamic section;
  final String? title;
  final dynamic header;
  final String? body;
  final dynamic typeId;
  final dynamic stateId;
  final int? sequenceNumber;
  final String? urlAlias;
  final dynamic metaTitle;
  final dynamic metaKeyword;
  final dynamic metaDescription;
  final String? config;
  final dynamic coverImageUrl;
  const HtmlModel(
      {this.id,
      this.createdBy,
      this.insertedTimestamp,
      this.updatedBy,
      this.updatedTimestamp,
      this.section,
      this.title,
      this.header,
      this.body,
      this.typeId,
      this.stateId,
      this.sequenceNumber,
      this.urlAlias,
      this.metaTitle,
      this.metaKeyword,
      this.metaDescription,
      this.config,
      this.coverImageUrl});
  HtmlModel copyWith(
      {int? id,
      int? createdBy,
      String? insertedTimestamp,
      int? updatedBy,
      String? updatedTimestamp,
      dynamic section,
      String? title,
      dynamic header,
      String? body,
      dynamic typeId,
      dynamic stateId,
      int? sequenceNumber,
      String? urlAlias,
      dynamic metaTitle,
      dynamic metaKeyword,
      dynamic metaDescription,
      String? config,
      dynamic coverImageUrl}) {
    return HtmlModel(
        id: id ?? this.id,
        createdBy: createdBy ?? this.createdBy,
        insertedTimestamp: insertedTimestamp ?? this.insertedTimestamp,
        updatedBy: updatedBy ?? this.updatedBy,
        updatedTimestamp: updatedTimestamp ?? this.updatedTimestamp,
        section: section ?? this.section,
        title: title ?? this.title,
        header: header ?? this.header,
        body: body ?? this.body,
        typeId: typeId ?? this.typeId,
        stateId: stateId ?? this.stateId,
        sequenceNumber: sequenceNumber ?? this.sequenceNumber,
        urlAlias: urlAlias ?? this.urlAlias,
        metaTitle: metaTitle ?? this.metaTitle,
        metaKeyword: metaKeyword ?? this.metaKeyword,
        metaDescription: metaDescription ?? this.metaDescription,
        config: config ?? this.config,
        coverImageUrl: coverImageUrl ?? this.coverImageUrl);
  }

  Map<String, Object?> toJson() {
    return {
      'id': id,
      'createdBy': createdBy,
      'insertedTimestamp': insertedTimestamp,
      'updatedBy': updatedBy,
      'updatedTimestamp': updatedTimestamp,
      'section': section,
      'title': title,
      'header': header,
      'body': body,
      'typeId': typeId,
      'stateId': stateId,
      'sequenceNumber': sequenceNumber,
      'urlAlias': urlAlias,
      'metaTitle': metaTitle,
      'metaKeyword': metaKeyword,
      'metaDescription': metaDescription,
      'config': config,
      'coverImageUrl': coverImageUrl
    };
  }

  static HtmlModel fromJson(Map<String, Object?> json) {
    return HtmlModel(
        id: json['id'] == null ? null : json['id'] as int,
        createdBy: json['createdBy'] == null ? null : json['createdBy'] as int,
        insertedTimestamp: json['insertedTimestamp'] == null
            ? null
            : json['insertedTimestamp'] as String,
        updatedBy: json['updatedBy'] == null ? null : json['updatedBy'] as int,
        updatedTimestamp: json['updatedTimestamp'] == null
            ? null
            : json['updatedTimestamp'] as String,
        section: json['section'] as dynamic,
        title: json['title'] == null ? null : json['title'] as String,
        header: json['header'] as dynamic,
        body: json['body'] == null ? null : json['body'] as String,
        typeId: json['typeId'] as dynamic,
        stateId: json['stateId'] as dynamic,
        sequenceNumber: json['sequenceNumber'] == null
            ? null
            : json['sequenceNumber'] as int,
        urlAlias: json['urlAlias'] == null ? null : json['urlAlias'] as String,
        metaTitle: json['metaTitle'] as dynamic,
        metaKeyword: json['metaKeyword'] as dynamic,
        metaDescription: json['metaDescription'] as dynamic,
        config: json['config'] == null ? null : json['config'] as String,
        coverImageUrl: json['coverImageUrl'] as dynamic);
  }

  @override
  String toString() {
    return '''HtmlModel(
                id:$id,
createdBy:$createdBy,
insertedTimestamp:$insertedTimestamp,
updatedBy:$updatedBy,
updatedTimestamp:$updatedTimestamp,
section:$section,
title:$title,
header:$header,
body:$body,
typeId:$typeId,
stateId:$stateId,
sequenceNumber:$sequenceNumber,
urlAlias:$urlAlias,
metaTitle:$metaTitle,
metaKeyword:$metaKeyword,
metaDescription:$metaDescription,
config:$config,
coverImageUrl:$coverImageUrl
    ) ''';
  }

  @override
  bool operator ==(Object other) {
    return other is HtmlModel &&
        other.runtimeType == runtimeType &&
        other.id == id &&
        other.createdBy == createdBy &&
        other.insertedTimestamp == insertedTimestamp &&
        other.updatedBy == updatedBy &&
        other.updatedTimestamp == updatedTimestamp &&
        other.section == section &&
        other.title == title &&
        other.header == header &&
        other.body == body &&
        other.typeId == typeId &&
        other.stateId == stateId &&
        other.sequenceNumber == sequenceNumber &&
        other.urlAlias == urlAlias &&
        other.metaTitle == metaTitle &&
        other.metaKeyword == metaKeyword &&
        other.metaDescription == metaDescription &&
        other.config == config &&
        other.coverImageUrl == coverImageUrl;
  }

  @override
  int get hashCode {
    return Object.hash(
        runtimeType,
        id,
        createdBy,
        insertedTimestamp,
        updatedBy,
        updatedTimestamp,
        section,
        title,
        header,
        body,
        typeId,
        stateId,
        sequenceNumber,
        urlAlias,
        metaTitle,
        metaKeyword,
        metaDescription,
        config,
        coverImageUrl);
  }
}
