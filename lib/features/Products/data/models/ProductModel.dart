import 'package:monstersmoke/features/Products/domain/entities/productEntities.dart';

class ProductModel extends ProductEntities {
  ProductModel(
      {super.productId,
      super.sku,
      super.upc,
      super.productName,
      super.alias,
      super.availableQuantity,
      super.eta,
      super.imageUrl,
      super.masterProductId,
      super.masterProductName,
      super.taxClassId,
      super.standardPrice,
      super.standardPriceWithoutDiscount,
      super.sequenceNumber,
      super.costPrice,
      super.tags,
      super.tagName,
      super.tagId,
      super.tagImageDtoList,
      super.minQuantityToSale,
      super.maxQuantityToSale,
      super.quantityIncrement,
      super.hasChildProduct,
      super.promotionType,
      super.promotionValue,
      super.promotionStartdate,
      super.promotionEnddate,
      super.promotionNotes,
      super.weight,
      super.height,
      super.length,
      super.width});
  ProductModel copyWith(
      {String? productId,
      String? sku,
      String? upc,
      String? productName,
      String? alias,
      String? availableQuantity,
      String? eta,
      String? imageUrl,
      String? masterProductId,
      String? masterProductName,
      String? taxClassId,
      String? standardPrice,
      String? standardPriceWithoutDiscount,
      String? sequenceNumber,
      String? costPrice,
      String? tags,
      String? tagName,
      String? tagId,
      String? tagImageDtoList,
      String? minQuantityToSale,
      String? maxQuantityToSale,
      String? quantityIncrement,
      bool? hasChildProduct,
      String? promotionType,
      String? promotionValue,
      String? promotionStartdate,
      String? promotionEnddate,
      String? promotionNotes,
      String? weight,
      String? height,
      String? length,
      String? width}) {
    return ProductModel(
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

  Map<String, Object?> toJson() {
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

  static ProductModel fromJson(Map<String, Object?> json) {
    return ProductModel(
        productId:
            json['productId'] == null ? null : json['productId'] as String,
        sku: json['sku'] as String,
        upc: json['upc'] == null ? null : json['upc'] as String,
        productName:
            json['productName'] == null ? null : json['productName'] as String,
        alias: json['alias'] == null ? null : json['alias'] as String,
        availableQuantity: json['availableQuantity'] == null
            ? null
            : json['availableQuantity'] as String,
        eta: json['eta'] == null ? null : json['eta'] as String,
        imageUrl: json['imageUrl'] == null ? null : json['imageUrl'] as String,
        masterProductId: json['masterProductId'] as String,
        masterProductName: json['masterProductName'] as String,
        taxClassId: json['taxClassId'] as String,
        standardPrice: json['standardPrice'] == null
            ? null
            : json['standardPrice'] as String,
        standardPriceWithoutDiscount:
            json['standardPriceWithoutDiscount'] == null
                ? null
                : json['standardPriceWithoutDiscount'] as String,
        sequenceNumber: json['sequenceNumber'] == null
            ? null
            : json['sequenceNumber'] as String,
        costPrice: json['costPrice'] as String,
        tags: json['tags'] as String,
        tagName: json['tagName'] as String,
        tagId: json['tagId'] as String,
        tagImageDtoList: json['tagImageDtoList'] as String,
        minQuantityToSale: json['minQuantityToSale'] == null
            ? null
            : json['minQuantityToSale'] as String,
        maxQuantityToSale: json['maxQuantityToSale'] == null
            ? null
            : json['maxQuantityToSale'] as String,
        quantityIncrement: json['quantityIncrement'] == null
            ? null
            : json['quantityIncrement'] as String,
        hasChildProduct: json['hasChildProduct'] == null
            ? null
            : json['hasChildProduct'] as bool,
        promotionType: json['promotionType'] as String,
        promotionValue: json['promotionValue'] == null
            ? null
            : json['promotionValue'] as String,
        promotionStartdate: json['promotionStartdate'] as String,
        promotionEnddate: json['promotionEnddate'] as String,
        promotionNotes: json['promotionNotes'] as String,
        weight: json['weight'] as String,
        height: json['height'] as String,
        length: json['length'] as String,
        width: json['width'] as String);
  }

  @override
  String toString() {
    return '''ProductModel(
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
    return other is ProductModel &&
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
