class BrandModel {
  final int? productId;
  final String? sku;
  final String? upc;
  final String? productName;
  final String? alias;
  final int? availableQuantity;
  final String? eta;
  final String? imageUrl;
  final int? masterProductId;
  final String? masterProductName;
  final int? taxClassId;
  final int? standardPrice;
  final int? standardPriceWithoutDiscount;
  final String? sequenceNumber;
  final String? costPrice;
  final String? tags;
  final String? tagName;
  final int? tagId;
  final String? tagImageDtoList;
  final int? minQuantityToSale;
  final int? maxQuantityToSale;
  final int? quantityIncrement;
  final bool? hasChildProduct;
  final String? promotionType;
  final int? promotionValue;
  final String? promotionStartdate;
  final String? promotionEnddate;
  final String? promotionNotes;
  final String? weight;
  final String? height;
  final String? length;
  final String? width;
  BrandModel(
      {this.productId,
      this.sku,
      this.upc,
      this.productName,
      this.alias,
      this.availableQuantity,
      this.eta,
      this.imageUrl,
      this.masterProductId,
      this.masterProductName,
      this.taxClassId,
      this.standardPrice,
      this.standardPriceWithoutDiscount,
      this.sequenceNumber,
      this.costPrice,
      this.tags,
      this.tagName,
      this.tagId,
      this.tagImageDtoList,
      this.minQuantityToSale,
      this.maxQuantityToSale,
      this.quantityIncrement,
      this.hasChildProduct,
      this.promotionType,
      this.promotionValue,
      this.promotionStartdate,
      this.promotionEnddate,
      this.promotionNotes,
      this.weight,
      this.height,
      this.length,
      this.width});
  BrandModel copyWith(
      {int? productId,
      String? sku,
      String? upc,
      String? productName,
      String? alias,
      int? availableQuantity,
      String? eta,
      String? imageUrl,
      int? masterProductId,
      String? masterProductName,
      int? taxClassId,
      int? standardPrice,
      int? standardPriceWithoutDiscount,
      String? sequenceNumber,
      String? costPrice,
      String? tags,
      String? tagName,
      int? tagId,
      String? tagImageDtoList,
      int? minQuantityToSale,
      int? maxQuantityToSale,
      int? quantityIncrement,
      bool? hasChildProduct,
      String? promotionType,
      int? promotionValue,
      String? promotionStartdate,
      String? promotionEnddate,
      String? promotionNotes,
      String? weight,
      String? height,
      String? length,
      String? width}) {
    return BrandModel(
        productId: productId ?? this.productId,
        sku: sku ?? this.sku,
        upc: upc ?? this.upc,
        productName: productName ?? this.productName,
        alias: alias ?? this.alias,
        availableQuantity: availableQuantity ?? this.availableQuantity,
        eta: eta ?? this.eta,
        imageUrl: imageUrl ?? this.imageUrl,
        masterProductId: masterProductId ?? this.masterProductId,
        masterProductName: masterProductName ?? this.masterProductName,
        taxClassId: taxClassId ?? this.taxClassId,
        standardPrice: standardPrice ?? this.standardPrice,
        standardPriceWithoutDiscount:
            standardPriceWithoutDiscount ?? this.standardPriceWithoutDiscount,
        sequenceNumber: sequenceNumber ?? this.sequenceNumber,
        costPrice: costPrice ?? this.costPrice,
        tags: tags ?? this.tags,
        tagName: tagName ?? this.tagName,
        tagId: tagId ?? this.tagId,
        tagImageDtoList: tagImageDtoList ?? this.tagImageDtoList,
        minQuantityToSale: minQuantityToSale ?? this.minQuantityToSale,
        maxQuantityToSale: maxQuantityToSale ?? this.maxQuantityToSale,
        quantityIncrement: quantityIncrement ?? this.quantityIncrement,
        hasChildProduct: hasChildProduct ?? this.hasChildProduct,
        promotionType: promotionType ?? this.promotionType,
        promotionValue: promotionValue ?? this.promotionValue,
        promotionStartdate: promotionStartdate ?? this.promotionStartdate,
        promotionEnddate: promotionEnddate ?? this.promotionEnddate,
        promotionNotes: promotionNotes ?? this.promotionNotes,
        weight: weight ?? this.weight,
        height: height ?? this.height,
        length: length ?? this.length,
        width: width ?? this.width);
  }

  Map<String?, Object?> toJson() {
    return {
      'productId': productId,
      'sku': sku,
      'upc': upc,
      'productName': productName,
      'alias': alias,
      'availableQuantity': availableQuantity,
      'eta': eta,
      'imageUrl': imageUrl,
      'masterProductId': masterProductId,
      'masterProductName': masterProductName,
      'taxClassId': taxClassId,
      'standardPrice': standardPrice,
      'standardPriceWithoutDiscount': standardPriceWithoutDiscount,
      'sequenceNumber': sequenceNumber,
      'costPrice': costPrice,
      'tags': tags,
      'tagName': tagName,
      'tagId': tagId,
      'tagImageDtoList': tagImageDtoList,
      'minQuantityToSale': minQuantityToSale,
      'maxQuantityToSale': maxQuantityToSale,
      'quantityIncrement': quantityIncrement,
      'hasChildProduct': hasChildProduct,
      'promotionType': promotionType,
      'promotionValue': promotionValue,
      'promotionStartdate': promotionStartdate,
      'promotionEnddate': promotionEnddate,
      'promotionNotes': promotionNotes,
      'weight': weight,
      'height': height,
      'length': length,
      'width': width
    };
  }

  static BrandModel fromJson(Map<String?, Object?> json) {
    return BrandModel(
        productId: json['productId'] == null ? null : json['productId'] as int,
        sku: json['sku'] as String?,
        upc: json['upc'] == null ? null : json['upc'] as String?,
        productName:
            json['productName'] == null ? null : json['productName'] as String?,
        alias: json['alias'] == null ? null : json['alias'] as String?,
        availableQuantity: json['availableQuantity'] == null
            ? null
            : json['availableQuantity'] as int,
        eta: json['eta'] == null ? null : json['eta'] as String?,
        imageUrl: json['imageUrl'] == null ? null : json['imageUrl'] as String?,
        masterProductId: json['masterProductId'] as int?,
        masterProductName: json['masterProductName'] as String?,
        taxClassId: json['taxClassId'] as int?,
        standardPrice:
            json['standardPrice'] == null ? null : json['standardPrice'] as int,
        standardPriceWithoutDiscount:
            json['standardPriceWithoutDiscount'] == null
                ? null
                : json['standardPriceWithoutDiscount'] as int,
        sequenceNumber: json['sequenceNumber'] as String?,
        costPrice: json['costPrice'] as String?,
        tags: json['tags'] as String?,
        tagName: json['tagName'] as String?,
        tagId: json['tagId'] as int?,
        tagImageDtoList: json['tagImageDtoList'] as String?,
        minQuantityToSale: json['minQuantityToSale'] == null
            ? null
            : json['minQuantityToSale'] as int,
        maxQuantityToSale: json['maxQuantityToSale'] == null
            ? null
            : json['maxQuantityToSale'] as int,
        quantityIncrement: json['quantityIncrement'] == null
            ? null
            : json['quantityIncrement'] as int,
        hasChildProduct: json['hasChildProduct'] == null
            ? null
            : json['hasChildProduct'] as bool,
        promotionType: json['promotionType'] as String?,
        promotionValue: json['promotionValue'] == null
            ? null
            : json['promotionValue'] as int,
        promotionStartdate: json['promotionStartdate'] as String?,
        promotionEnddate: json['promotionEnddate'] as String?,
        promotionNotes: json['promotionNotes'] as String?,
        weight: json['weight'] as String?,
        height: json['height'] as String?,
        length: json['length'] as String?,
        width: json['width'] as String?);
  }

  @override
  String toString() {
    return '''BrandModel(
                productId:$productId,
sku:$sku,
upc:$upc,
productName:$productName,
alias:$alias,
availableQuantity:$availableQuantity,
eta:$eta,
imageUrl:$imageUrl,
masterProductId:$masterProductId,
masterProductName:$masterProductName,
taxClassId:$taxClassId,
standardPrice:$standardPrice,
standardPriceWithoutDiscount:$standardPriceWithoutDiscount,
sequenceNumber:$sequenceNumber,
costPrice:$costPrice,
tags:$tags,
tagName:$tagName,
tagId:$tagId,
tagImageDtoList:$tagImageDtoList,
minQuantityToSale:$minQuantityToSale,
maxQuantityToSale:$maxQuantityToSale,
quantityIncrement:$quantityIncrement,
hasChildProduct:$hasChildProduct,
promotionType:$promotionType,
promotionValue:$promotionValue,
promotionStartdate:$promotionStartdate,
promotionEnddate:$promotionEnddate,
promotionNotes:$promotionNotes,
weight:$weight,
height:$height,
length:$length,
width:$width
    ) ''';
  }

  @override
  bool operator ==(Object other) {
    return other is BrandModel &&
        other.runtimeType == runtimeType &&
        other.productId == productId &&
        other.sku == sku &&
        other.upc == upc &&
        other.productName == productName &&
        other.alias == alias &&
        other.availableQuantity == availableQuantity &&
        other.eta == eta &&
        other.imageUrl == imageUrl &&
        other.masterProductId == masterProductId &&
        other.masterProductName == masterProductName &&
        other.taxClassId == taxClassId &&
        other.standardPrice == standardPrice &&
        other.standardPriceWithoutDiscount == standardPriceWithoutDiscount &&
        other.sequenceNumber == sequenceNumber &&
        other.costPrice == costPrice &&
        other.tags == tags &&
        other.tagName == tagName &&
        other.tagId == tagId &&
        other.tagImageDtoList == tagImageDtoList &&
        other.minQuantityToSale == minQuantityToSale &&
        other.maxQuantityToSale == maxQuantityToSale &&
        other.quantityIncrement == quantityIncrement &&
        other.hasChildProduct == hasChildProduct &&
        other.promotionType == promotionType &&
        other.promotionValue == promotionValue &&
        other.promotionStartdate == promotionStartdate &&
        other.promotionEnddate == promotionEnddate &&
        other.promotionNotes == promotionNotes &&
        other.weight == weight &&
        other.height == height &&
        other.length == length &&
        other.width == width;
  }

  @override
  int get hashCode {
    return Object.hash(
        runtimeType,
        productId,
        sku,
        upc,
        productName,
        alias,
        availableQuantity,
        eta,
        imageUrl,
        masterProductId,
        masterProductName,
        taxClassId,
        standardPrice,
        standardPriceWithoutDiscount,
        sequenceNumber,
        costPrice,
        tags,
        tagName,
        tagId,
        tagImageDtoList);
  }
}
