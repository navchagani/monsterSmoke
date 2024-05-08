class ProductSearchModel {
  final List<ProductCoreDtoList>? productCoreDtoList;
  final List<CategoryDtoList>? categoryDtoList;
  final int? totalCount;
  const ProductSearchModel(
      {this.productCoreDtoList, this.categoryDtoList, this.totalCount});
  ProductSearchModel copyWith(
      {List<ProductCoreDtoList>? productCoreDtoList,
      List<CategoryDtoList>? categoryDtoList,
      int? totalCount}) {
    return ProductSearchModel(
        productCoreDtoList: productCoreDtoList ?? this.productCoreDtoList,
        categoryDtoList: categoryDtoList ?? this.categoryDtoList,
        totalCount: totalCount ?? this.totalCount);
  }

  Map<String, Object?> toJson() {
    return {
      'productCoreDtoList': productCoreDtoList
          ?.map<Map<String, dynamic>>((data) => data.toJson())
          .toList(),
      'categoryDtoList': categoryDtoList
          ?.map<Map<String, dynamic>>((data) => data.toJson())
          .toList(),
      'totalCount': totalCount
    };
  }

  static ProductSearchModel fromJson(Map<String, Object?> json) {
    return ProductSearchModel(
        productCoreDtoList: json['productCoreDtoList'] == null
            ? null
            : (json['productCoreDtoList'] as List)
                .map<ProductCoreDtoList>((data) =>
                    ProductCoreDtoList.fromJson(data as Map<String, Object?>))
                .toList(),
        categoryDtoList: json['categoryDtoList'] == null
            ? null
            : (json['categoryDtoList'] as List)
                .map<CategoryDtoList>((data) =>
                    CategoryDtoList.fromJson(data as Map<String, Object?>))
                .toList(),
        totalCount:
            json['totalCount'] == null ? null : json['totalCount'] as int);
  }

  @override
  String toString() {
    return '''ProductSearchModel(
                productCoreDtoList:${productCoreDtoList.toString()},
categoryDtoList:${categoryDtoList.toString()},
totalCount:$totalCount
    ) ''';
  }

  @override
  bool operator ==(Object other) {
    return other is ProductSearchModel &&
        other.runtimeType == runtimeType &&
        other.productCoreDtoList == productCoreDtoList &&
        other.categoryDtoList == categoryDtoList &&
        other.totalCount == totalCount;
  }

  @override
  int get hashCode {
    return Object.hash(
        runtimeType, productCoreDtoList, categoryDtoList, totalCount);
  }
}

class CategoryDtoList {
  final int? id;
  final dynamic createdBy;
  final dynamic insertedTimestamp;
  final dynamic updatedBy;
  final dynamic updatedTimestamp;
  final int? categoryId;
  final String? name;
  final String? alias;
  final dynamic parentId;
  final dynamic imageUrl;
  final dynamic description;
  final bool? ecommerce;
  final bool? customerSpecific;
  final bool? loginRequired;
  final bool? repairCategory;
  final dynamic businessTypeId;
  final dynamic businessTypeName;
  final dynamic sequenceNumber;
  final dynamic metaTitle;
  final dynamic metaData;
  final dynamic metaDescription;
  final bool? deleted;
  final bool? taxPaid;
  final dynamic lastSyncTimestamp;
  final dynamic businessTypeList;
  final dynamic categoryBusinessTypeMapList;
  final dynamic subCategories;
  final dynamic categoryAttachmentMap;
  const CategoryDtoList(
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
  CategoryDtoList copyWith(
      {int? id,
      dynamic? createdBy,
      dynamic? insertedTimestamp,
      dynamic? updatedBy,
      dynamic? updatedTimestamp,
      int? categoryId,
      String? name,
      String? alias,
      dynamic? parentId,
      dynamic? imageUrl,
      dynamic? description,
      bool? ecommerce,
      bool? customerSpecific,
      bool? loginRequired,
      bool? repairCategory,
      dynamic? businessTypeId,
      dynamic? businessTypeName,
      dynamic? sequenceNumber,
      dynamic? metaTitle,
      dynamic? metaData,
      dynamic? metaDescription,
      bool? deleted,
      bool? taxPaid,
      dynamic? lastSyncTimestamp,
      dynamic? businessTypeList,
      dynamic? categoryBusinessTypeMapList,
      dynamic? subCategories,
      dynamic? categoryAttachmentMap}) {
    return CategoryDtoList(
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

  static CategoryDtoList fromJson(Map<String, Object?> json) {
    return CategoryDtoList(
        id: json['id'] == null ? null : json['id'] as int,
        createdBy: json['createdBy'] as dynamic,
        insertedTimestamp: json['insertedTimestamp'] as dynamic,
        updatedBy: json['updatedBy'] as dynamic,
        updatedTimestamp: json['updatedTimestamp'] as dynamic,
        categoryId:
            json['categoryId'] == null ? null : json['categoryId'] as int,
        name: json['name'] == null ? null : json['name'] as String,
        alias: json['alias'] == null ? null : json['alias'] as String,
        parentId: json['parentId'] as dynamic,
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
        businessTypeId: json['businessTypeId'] as dynamic,
        businessTypeName: json['businessTypeName'] as dynamic,
        sequenceNumber: json['sequenceNumber'] as dynamic,
        metaTitle: json['metaTitle'] as dynamic,
        metaData: json['metaData'] as dynamic,
        metaDescription: json['metaDescription'] as dynamic,
        deleted: json['deleted'] == null ? null : json['deleted'] as bool,
        taxPaid: json['taxPaid'] == null ? null : json['taxPaid'] as bool,
        lastSyncTimestamp: json['lastSyncTimestamp'] as dynamic,
        businessTypeList: json['businessTypeList'] as dynamic,
        categoryBusinessTypeMapList:
            json['categoryBusinessTypeMapList'] as dynamic,
        subCategories: json['subCategories'] as dynamic,
        categoryAttachmentMap: json['categoryAttachmentMap'] as dynamic);
  }

  @override
  String toString() {
    return '''CategoryDtoList(
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
    return other is CategoryDtoList &&
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

class ProductCoreDtoList {
  final dynamic masterProductId;
  final int? productId;
  final dynamic productCategoryId;
  final String? productName;
  final String? urlAlias;
  final dynamic shortDescription;
  final dynamic fullDescription;
  final int? availableQuantity;
  final dynamic eta;
  final double? standardPrice;
  final double? standardPriceWithoutDiscount;
  final String? imageUrl;
  final dynamic upc;
  final dynamic sku;
  final dynamic sequenceNumber;
  final dynamic productVariantLabelValues;
  final bool? categorySelected;
  final dynamic minQuantityToSale;
  final dynamic maxQuantityToSale;
  final int? quantityIncrement;
  final dynamic tagImageDtoList;
  final dynamic attachmentUrlList;
  final dynamic metaTitle;
  final dynamic metaKeyword;
  final dynamic metaDescription;
  final dynamic modelName;
  final double? msrp;
  final dynamic boxQuantity;
  final dynamic caseQuantity;
  final double? nicotineStrength;
  final double? volume;
  final dynamic ouncePerProduct;
  const ProductCoreDtoList(
      {this.masterProductId,
      this.productId,
      this.productCategoryId,
      this.productName,
      this.urlAlias,
      this.shortDescription,
      this.fullDescription,
      this.availableQuantity,
      this.eta,
      this.standardPrice,
      this.standardPriceWithoutDiscount,
      this.imageUrl,
      this.upc,
      this.sku,
      this.sequenceNumber,
      this.productVariantLabelValues,
      this.categorySelected,
      this.minQuantityToSale,
      this.maxQuantityToSale,
      this.quantityIncrement,
      this.tagImageDtoList,
      this.attachmentUrlList,
      this.metaTitle,
      this.metaKeyword,
      this.metaDescription,
      this.modelName,
      this.msrp,
      this.boxQuantity,
      this.caseQuantity,
      this.nicotineStrength,
      this.volume,
      this.ouncePerProduct});
  ProductCoreDtoList copyWith(
      {dynamic? masterProductId,
      int? productId,
      dynamic? productCategoryId,
      String? productName,
      String? urlAlias,
      dynamic? shortDescription,
      dynamic? fullDescription,
      int? availableQuantity,
      dynamic? eta,
      double? standardPrice,
      double? standardPriceWithoutDiscount,
      String? imageUrl,
      dynamic? upc,
      dynamic? sku,
      dynamic? sequenceNumber,
      dynamic? productVariantLabelValues,
      bool? categorySelected,
      dynamic? minQuantityToSale,
      dynamic? maxQuantityToSale,
      int? quantityIncrement,
      dynamic? tagImageDtoList,
      dynamic? attachmentUrlList,
      dynamic? metaTitle,
      dynamic? metaKeyword,
      dynamic? metaDescription,
      dynamic? modelName,
      double? msrp,
      dynamic? boxQuantity,
      dynamic? caseQuantity,
      double? nicotineStrength,
      double? volume,
      dynamic? ouncePerProduct}) {
    return ProductCoreDtoList(
        masterProductId: masterProductId ?? this.masterProductId,
        productId: productId ?? this.productId,
        productCategoryId: productCategoryId ?? this.productCategoryId,
        productName: productName ?? this.productName,
        urlAlias: urlAlias ?? this.urlAlias,
        shortDescription: shortDescription ?? this.shortDescription,
        fullDescription: fullDescription ?? this.fullDescription,
        availableQuantity: availableQuantity ?? this.availableQuantity,
        eta: eta ?? this.eta,
        standardPrice: standardPrice ?? this.standardPrice,
        standardPriceWithoutDiscount:
            standardPriceWithoutDiscount ?? this.standardPriceWithoutDiscount,
        imageUrl: imageUrl ?? this.imageUrl,
        upc: upc ?? this.upc,
        sku: sku ?? this.sku,
        sequenceNumber: sequenceNumber ?? this.sequenceNumber,
        productVariantLabelValues:
            productVariantLabelValues ?? this.productVariantLabelValues,
        categorySelected: categorySelected ?? this.categorySelected,
        minQuantityToSale: minQuantityToSale ?? this.minQuantityToSale,
        maxQuantityToSale: maxQuantityToSale ?? this.maxQuantityToSale,
        quantityIncrement: quantityIncrement ?? this.quantityIncrement,
        tagImageDtoList: tagImageDtoList ?? this.tagImageDtoList,
        attachmentUrlList: attachmentUrlList ?? this.attachmentUrlList,
        metaTitle: metaTitle ?? this.metaTitle,
        metaKeyword: metaKeyword ?? this.metaKeyword,
        metaDescription: metaDescription ?? this.metaDescription,
        modelName: modelName ?? this.modelName,
        msrp: msrp ?? this.msrp,
        boxQuantity: boxQuantity ?? this.boxQuantity,
        caseQuantity: caseQuantity ?? this.caseQuantity,
        nicotineStrength: nicotineStrength ?? this.nicotineStrength,
        volume: volume ?? this.volume,
        ouncePerProduct: ouncePerProduct ?? this.ouncePerProduct);
  }

  Map<String, Object?> toJson() {
    return {
      'masterProductId': masterProductId,
      'productId': productId,
      'productCategoryId': productCategoryId,
      'productName': productName,
      'urlAlias': urlAlias,
      'shortDescription': shortDescription,
      'fullDescription': fullDescription,
      'availableQuantity': availableQuantity,
      'eta': eta,
      'standardPrice': standardPrice,
      'standardPriceWithoutDiscount': standardPriceWithoutDiscount,
      'imageUrl': imageUrl,
      'upc': upc,
      'sku': sku,
      'sequenceNumber': sequenceNumber,
      'productVariantLabelValues': productVariantLabelValues,
      'categorySelected': categorySelected,
      'minQuantityToSale': minQuantityToSale,
      'maxQuantityToSale': maxQuantityToSale,
      'quantityIncrement': quantityIncrement,
      'tagImageDtoList': tagImageDtoList,
      'attachmentUrlList': attachmentUrlList,
      'metaTitle': metaTitle,
      'metaKeyword': metaKeyword,
      'metaDescription': metaDescription,
      'modelName': modelName,
      'msrp': msrp,
      'boxQuantity': boxQuantity,
      'caseQuantity': caseQuantity,
      'nicotineStrength': nicotineStrength,
      'volume': volume,
      'ouncePerProduct': ouncePerProduct
    };
  }

  static ProductCoreDtoList fromJson(Map<String, Object?> json) {
    return ProductCoreDtoList(
        masterProductId: json['masterProductId'] as dynamic,
        productId: json['productId'] == null ? null : json['productId'] as int,
        productCategoryId: json['productCategoryId'] as dynamic,
        productName:
            json['productName'] == null ? null : json['productName'] as String,
        urlAlias: json['urlAlias'] == null ? null : json['urlAlias'] as String,
        shortDescription: json['shortDescription'] as dynamic,
        fullDescription: json['fullDescription'] as dynamic,
        availableQuantity: json['availableQuantity'] == null
            ? null
            : json['availableQuantity'] as int,
        eta: json['eta'] as dynamic,
        standardPrice: json['standardPrice'] == null
            ? null
            : json['standardPrice'] as double,
        standardPriceWithoutDiscount:
            json['standardPriceWithoutDiscount'] == null
                ? null
                : json['standardPriceWithoutDiscount'] as double,
        imageUrl: json['imageUrl'] == null ? null : json['imageUrl'] as String,
        upc: json['upc'] as dynamic,
        sku: json['sku'] as dynamic,
        sequenceNumber: json['sequenceNumber'] as dynamic,
        productVariantLabelValues: json['productVariantLabelValues'] as dynamic,
        categorySelected: json['categorySelected'] == null
            ? null
            : json['categorySelected'] as bool,
        minQuantityToSale: json['minQuantityToSale'] as dynamic,
        maxQuantityToSale: json['maxQuantityToSale'] as dynamic,
        quantityIncrement: json['quantityIncrement'] == null
            ? null
            : json['quantityIncrement'] as int,
        tagImageDtoList: json['tagImageDtoList'] as dynamic,
        attachmentUrlList: json['attachmentUrlList'] as dynamic,
        metaTitle: json['metaTitle'] as dynamic,
        metaKeyword: json['metaKeyword'] as dynamic,
        metaDescription: json['metaDescription'] as dynamic,
        modelName: json['modelName'] as dynamic,
        msrp: json['msrp'] == null ? null : json['msrp'] as double,
        boxQuantity: json['boxQuantity'] as dynamic,
        caseQuantity: json['caseQuantity'] as dynamic,
        nicotineStrength: json['nicotineStrength'] as dynamic,
        volume: json['volume'] as dynamic,
        ouncePerProduct: json['ouncePerProduct'] as dynamic);
  }

  @override
  String toString() {
    return '''ProductCoreDtoList(
                masterProductId:$masterProductId,
productId:$productId,
productCategoryId:$productCategoryId,
productName:$productName,
urlAlias:$urlAlias,
shortDescription:$shortDescription,
fullDescription:$fullDescription,
availableQuantity:$availableQuantity,
eta:$eta,
standardPrice:$standardPrice,
standardPriceWithoutDiscount:$standardPriceWithoutDiscount,
imageUrl:$imageUrl,
upc:$upc,
sku:$sku,
sequenceNumber:$sequenceNumber,
productVariantLabelValues:$productVariantLabelValues,
categorySelected:$categorySelected,
minQuantityToSale:$minQuantityToSale,
maxQuantityToSale:$maxQuantityToSale,
quantityIncrement:$quantityIncrement,
tagImageDtoList:$tagImageDtoList,
attachmentUrlList:$attachmentUrlList,
metaTitle:$metaTitle,
metaKeyword:$metaKeyword,
metaDescription:$metaDescription,
modelName:$modelName,
msrp:$msrp,
boxQuantity:$boxQuantity,
caseQuantity:$caseQuantity,
nicotineStrength:$nicotineStrength,
volume:$volume,
ouncePerProduct:$ouncePerProduct
    ) ''';
  }

  @override
  bool operator ==(Object other) {
    return other is ProductCoreDtoList &&
        other.runtimeType == runtimeType &&
        other.masterProductId == masterProductId &&
        other.productId == productId &&
        other.productCategoryId == productCategoryId &&
        other.productName == productName &&
        other.urlAlias == urlAlias &&
        other.shortDescription == shortDescription &&
        other.fullDescription == fullDescription &&
        other.availableQuantity == availableQuantity &&
        other.eta == eta &&
        other.standardPrice == standardPrice &&
        other.standardPriceWithoutDiscount == standardPriceWithoutDiscount &&
        other.imageUrl == imageUrl &&
        other.upc == upc &&
        other.sku == sku &&
        other.sequenceNumber == sequenceNumber &&
        other.productVariantLabelValues == productVariantLabelValues &&
        other.categorySelected == categorySelected &&
        other.minQuantityToSale == minQuantityToSale &&
        other.maxQuantityToSale == maxQuantityToSale &&
        other.quantityIncrement == quantityIncrement &&
        other.tagImageDtoList == tagImageDtoList &&
        other.attachmentUrlList == attachmentUrlList &&
        other.metaTitle == metaTitle &&
        other.metaKeyword == metaKeyword &&
        other.metaDescription == metaDescription &&
        other.modelName == modelName &&
        other.msrp == msrp &&
        other.boxQuantity == boxQuantity &&
        other.caseQuantity == caseQuantity &&
        other.nicotineStrength == nicotineStrength &&
        other.volume == volume &&
        other.ouncePerProduct == ouncePerProduct;
  }

  @override
  int get hashCode {
    return Object.hash(
        runtimeType,
        masterProductId,
        productId,
        productCategoryId,
        productName,
        urlAlias,
        shortDescription,
        fullDescription,
        availableQuantity,
        eta,
        standardPrice,
        standardPriceWithoutDiscount,
        imageUrl,
        upc,
        sku,
        sequenceNumber,
        productVariantLabelValues,
        categorySelected,
        minQuantityToSale,
        maxQuantityToSale);
  }
}
