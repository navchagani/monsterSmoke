class CategoryModel {
  final int? id;
  final String? createdBy;
  final String? insertedTimestamp;
  final String? updatedBy;
  final String? updatedTimestamp;
  final int? categoryId;
  final String? name;
  final String? alias;
  final int? parentId;
  final String? imageUrl;
  final String? description;
  final bool? ecommerce;
  final bool? customerSpecific;
  final bool? loginRequired;
  final bool? repairCategory;
  final int? businessTypeId;
  final String? businessTypeName;
  final int? sequenceNumber;
  final String? metaTitle;
  final String? metaData;
  final String? metaDescription;
  final bool? deleted;
  final bool? taxPaid;
  final String? lastSyncTimestamp;
  final String? businessTypeList;
  final String? categoryBusinessTypeMapList;
  final List<dynamic>? subCategories;
  final String? categoryAttachmentMap;
  const CategoryModel(
      {this.id,
      this.createdBy,
      this.insertedTimestamp,
      this.updatedBy,
      this.updatedTimestamp,
      this.categoryId,
      this.name,
      this.alias,
      this.parentId,
      this.imageUrl,
      this.description,
      this.ecommerce,
      this.customerSpecific,
      this.loginRequired,
      this.repairCategory,
      this.businessTypeId,
      this.businessTypeName,
      this.sequenceNumber,
      this.metaTitle,
      this.metaData,
      this.metaDescription,
      this.deleted,
      this.taxPaid,
      this.lastSyncTimestamp,
      this.businessTypeList,
      this.categoryBusinessTypeMapList,
      this.subCategories,
      this.categoryAttachmentMap});
  CategoryModel copyWith(
      {int? id,
      String? createdBy,
      String? insertedTimestamp,
      String? updatedBy,
      String? updatedTimestamp,
      int? categoryId,
      String? name,
      String? alias,
      int? parentId,
      String? imageUrl,
      String? description,
      bool? ecommerce,
      bool? customerSpecific,
      bool? loginRequired,
      bool? repairCategory,
      int? businessTypeId,
      String? businessTypeName,
      int? sequenceNumber,
      String? metaTitle,
      String? metaData,
      String? metaDescription,
      bool? deleted,
      bool? taxPaid,
      String? lastSyncTimestamp,
      String? businessTypeList,
      String? categoryBusinessTypeMapList,
      List<String?>? subCategories,
      String? categoryAttachmentMap}) {
    return CategoryModel(
        id: id ?? this.id,
        createdBy: createdBy ?? this.createdBy,
        insertedTimestamp: insertedTimestamp ?? this.insertedTimestamp,
        updatedBy: updatedBy ?? this.updatedBy,
        updatedTimestamp: updatedTimestamp ?? this.updatedTimestamp,
        categoryId: categoryId ?? this.categoryId,
        name: name ?? this.name,
        alias: alias ?? this.alias,
        parentId: parentId ?? this.parentId,
        imageUrl: imageUrl ?? this.imageUrl,
        description: description ?? this.description,
        ecommerce: ecommerce ?? this.ecommerce,
        customerSpecific: customerSpecific ?? this.customerSpecific,
        loginRequired: loginRequired ?? this.loginRequired,
        repairCategory: repairCategory ?? this.repairCategory,
        businessTypeId: businessTypeId ?? this.businessTypeId,
        businessTypeName: businessTypeName ?? this.businessTypeName,
        sequenceNumber: sequenceNumber ?? this.sequenceNumber,
        metaTitle: metaTitle ?? this.metaTitle,
        metaData: metaData ?? this.metaData,
        metaDescription: metaDescription ?? this.metaDescription,
        deleted: deleted ?? this.deleted,
        taxPaid: taxPaid ?? this.taxPaid,
        lastSyncTimestamp: lastSyncTimestamp ?? this.lastSyncTimestamp,
        businessTypeList: businessTypeList ?? this.businessTypeList,
        categoryBusinessTypeMapList:
            categoryBusinessTypeMapList ?? this.categoryBusinessTypeMapList,
        subCategories: subCategories ?? this.subCategories,
        categoryAttachmentMap:
            categoryAttachmentMap ?? this.categoryAttachmentMap);
  }

  Map<String, Object?> toJson() {
    return {
      'id': id,
      'createdBy': createdBy,
      'insertedTimestamp': insertedTimestamp,
      'updatedBy': updatedBy,
      'updatedTimestamp': updatedTimestamp,
      'categoryId': categoryId,
      'name': name,
      'alias': alias,
      'parentId': parentId,
      'imageUrl': imageUrl,
      'description': description,
      'ecommerce': ecommerce,
      'customerSpecific': customerSpecific,
      'loginRequired': loginRequired,
      'repairCategory': repairCategory,
      'businessTypeId': businessTypeId,
      'businessTypeName': businessTypeName,
      'sequenceNumber': sequenceNumber,
      'metaTitle': metaTitle,
      'metaData': metaData,
      'metaDescription': metaDescription,
      'deleted': deleted,
      'taxPaid': taxPaid,
      'lastSyncTimestamp': lastSyncTimestamp,
      'businessTypeList': businessTypeList,
      'categoryBusinessTypeMapList': categoryBusinessTypeMapList,
      'subCategories': subCategories,
      'categoryAttachmentMap': categoryAttachmentMap
    };
  }

  static CategoryModel fromJson(Map<String, Object?> json) {
    return CategoryModel(
        id: json['id'] == null ? null : json['id'] as int,
        createdBy: json['createdBy'] as String?,
        insertedTimestamp: json['insertedTimestamp'] as String?,
        updatedBy: json['updatedBy'] as String?,
        updatedTimestamp: json['updatedTimestamp'] as String?,
        categoryId:
            json['categoryId'] == null ? null : json['categoryId'] as int,
        name: json['name'] == null ? null : json['name'] as String,
        alias: json['alias'] == null ? null : json['alias'] as String,
        parentId: json['parentId'] == null ? null : json['parentId'] as int,
        imageUrl: json['imageUrl'] as String?,
        description: json['description'] as String?,
        ecommerce: json['ecommerce'] == null ? null : json['ecommerce'] as bool,
        customerSpecific: json['customerSpecific'] == null
            ? null
            : json['customerSpecific'] as bool,
        loginRequired: json['loginRequired'] == null
            ? null
            : json['loginRequired'] as bool,
        repairCategory: json['repairCategory'] == null
            ? null
            : json['repairCategory'] as bool,
        businessTypeId: json['businessTypeId'] == null
            ? null
            : json['businessTypeId'] as int,
        businessTypeName: json['businessTypeName'] == null
            ? null
            : json['businessTypeName'] as String,
        sequenceNumber: json['sequenceNumber'] == null
            ? null
            : json['sequenceNumber'] as int,
        metaTitle: json['metaTitle'] as String?,
        metaData: json['metaData'] as String?,
        metaDescription: json['metaDescription'] as String?,
        deleted: json['deleted'] == null ? null : json['deleted'] as bool,
        taxPaid: json['taxPaid'] == null ? null : json['taxPaid'] as bool,
        lastSyncTimestamp: json['lastSyncTimestamp'] as String?,
        businessTypeList: json['businessTypeList'] as String?,
        categoryBusinessTypeMapList:
            json['categoryBusinessTypeMapList'] as String?,
        subCategories: json['subCategories'] == null
            ? null
            : json['subCategories'] as List<dynamic>,
        categoryAttachmentMap: json['categoryAttachmentMap'] as String?);
  }

  @override
  String toString() {
    return '''CategoryModel(
                id:$id,
createdBy:$createdBy,
insertedTimestamp:$insertedTimestamp,
updatedBy:$updatedBy,
updatedTimestamp:$updatedTimestamp,
categoryId:$categoryId,
name:$name,
alias:$alias,
parentId:$parentId,
imageUrl:$imageUrl,
description:$description,
ecommerce:$ecommerce,
customerSpecific:$customerSpecific,
loginRequired:$loginRequired,
repairCategory:$repairCategory,
businessTypeId:$businessTypeId,
businessTypeName:$businessTypeName,
sequenceNumber:$sequenceNumber,
metaTitle:$metaTitle,
metaData:$metaData,
metaDescription:$metaDescription,
deleted:$deleted,
taxPaid:$taxPaid,
lastSyncTimestamp:$lastSyncTimestamp,
businessTypeList:$businessTypeList,
categoryBusinessTypeMapList:$categoryBusinessTypeMapList,
subCategories:$subCategories,
categoryAttachmentMap:$categoryAttachmentMap
    ) ''';
  }

  @override
  bool operator ==(Object other) {
    return other is CategoryModel &&
        other.runtimeType == runtimeType &&
        other.id == id &&
        other.createdBy == createdBy &&
        other.insertedTimestamp == insertedTimestamp &&
        other.updatedBy == updatedBy &&
        other.updatedTimestamp == updatedTimestamp &&
        other.categoryId == categoryId &&
        other.name == name &&
        other.alias == alias &&
        other.parentId == parentId &&
        other.imageUrl == imageUrl &&
        other.description == description &&
        other.ecommerce == ecommerce &&
        other.customerSpecific == customerSpecific &&
        other.loginRequired == loginRequired &&
        other.repairCategory == repairCategory &&
        other.businessTypeId == businessTypeId &&
        other.businessTypeName == businessTypeName &&
        other.sequenceNumber == sequenceNumber &&
        other.metaTitle == metaTitle &&
        other.metaData == metaData &&
        other.metaDescription == metaDescription &&
        other.deleted == deleted &&
        other.taxPaid == taxPaid &&
        other.lastSyncTimestamp == lastSyncTimestamp &&
        other.businessTypeList == businessTypeList &&
        other.categoryBusinessTypeMapList == categoryBusinessTypeMapList &&
        other.subCategories == subCategories &&
        other.categoryAttachmentMap == categoryAttachmentMap;
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
        categoryId,
        name,
        alias,
        parentId,
        imageUrl,
        description,
        ecommerce,
        customerSpecific,
        loginRequired,
        repairCategory,
        businessTypeId,
        businessTypeName,
        sequenceNumber,
        metaTitle);
  }
}
