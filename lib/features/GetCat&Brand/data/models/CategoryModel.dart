class CategoryModel {
  final int? id;
  final dynamic createdBy;
  final dynamic insertedTimestamp;
  final dynamic updatedBy;
  final dynamic updatedTimestamp;
  final int? categoryId;
  final String? name;
  final String? alias;
  final int? parentId;
  final dynamic imageUrl;
  final dynamic description;
  final bool? ecommerce;
  final bool? customerSpecific;
  final bool? loginRequired;
  final bool? repairCategory;
  final int? businessTypeId;
  final String? businessTypeName;
  final int? sequenceNumber;
  final dynamic metaTitle;
  final dynamic metaData;
  final dynamic metaDescription;
  final bool? deleted;
  final bool? taxPaid;
  final dynamic lastSyncTimestamp;
  final dynamic businessTypeList;
  final dynamic categoryBusinessTypeMapList;
  final List<dynamic>? subCategories;
  final dynamic categoryAttachmentMap;
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
      dynamic? createdBy,
      dynamic? insertedTimestamp,
      dynamic? updatedBy,
      dynamic? updatedTimestamp,
      int? categoryId,
      String? name,
      String? alias,
      int? parentId,
      dynamic? imageUrl,
      dynamic? description,
      bool? ecommerce,
      bool? customerSpecific,
      bool? loginRequired,
      bool? repairCategory,
      int? businessTypeId,
      String? businessTypeName,
      int? sequenceNumber,
      dynamic? metaTitle,
      dynamic? metaData,
      dynamic? metaDescription,
      bool? deleted,
      bool? taxPaid,
      dynamic? lastSyncTimestamp,
      dynamic? businessTypeList,
      dynamic? categoryBusinessTypeMapList,
      List<dynamic>? subCategories,
      dynamic? categoryAttachmentMap}) {
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
        createdBy: json['createdBy'] as dynamic,
        insertedTimestamp: json['insertedTimestamp'] as dynamic,
        updatedBy: json['updatedBy'] as dynamic,
        updatedTimestamp: json['updatedTimestamp'] as dynamic,
        categoryId:
            json['categoryId'] == null ? null : json['categoryId'] as int,
        name: json['name'] == null ? null : json['name'] as String,
        alias: json['alias'] == null ? null : json['alias'] as String,
        parentId: json['parentId'] == null ? null : json['parentId'] as int,
        imageUrl: json['imageUrl'] as dynamic,
        description: json['description'] as dynamic,
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
        metaTitle: json['metaTitle'] as dynamic,
        metaData: json['metaData'] as dynamic,
        metaDescription: json['metaDescription'] as dynamic,
        deleted: json['deleted'] == null ? null : json['deleted'] as bool,
        taxPaid: json['taxPaid'] == null ? null : json['taxPaid'] as bool,
        lastSyncTimestamp: json['lastSyncTimestamp'] as dynamic,
        businessTypeList: json['businessTypeList'] as dynamic,
        categoryBusinessTypeMapList:
            json['categoryBusinessTypeMapList'] as dynamic,
        subCategories: json['subCategories'] == null
            ? null
            : json['subCategories'] as List<dynamic>,
        categoryAttachmentMap: json['categoryAttachmentMap'] as dynamic);
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
