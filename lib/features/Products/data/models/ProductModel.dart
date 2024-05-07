class ProductModel {
  final int? productId;
  final dynamic sku;
  final String? upc;
  final String? productName;
  final String? alias;
  final int? availableQuantity;
  final String? eta;
  final String? imageUrl;
  final dynamic masterProductId;
  final dynamic masterProductName;
  final dynamic taxClassId;
  final double? standardPrice;
  final double? standardPriceWithoutDiscount;
  final int? sequenceNumber;
  final dynamic costPrice;
  final dynamic tags;
  final dynamic tagName;
  final dynamic tagId;
  final dynamic tagImageDtoList;
  final int? minQuantityToSale;
  final int? maxQuantityToSale;
  final int? quantityIncrement;
  final bool? hasChildProduct;
  final dynamic promotionType;
  final int? promotionValue;
  final dynamic promotionStartdate;
  final dynamic promotionEnddate;
  final dynamic promotionNotes;
  final dynamic weight;
  final dynamic height;
  final dynamic length;
  final dynamic width;
  final int? quantity;
  const ProductModel(
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
      this.width,
      this.quantity});
  ProductModel copyWith(
      {int? productId,
      dynamic? sku,
      String? upc,
      String? productName,
      String? alias,
      int? availableQuantity,
      String? eta,
      String? imageUrl,
      dynamic? masterProductId,
      dynamic? masterProductName,
      dynamic? taxClassId,
      double? standardPrice,
      double? standardPriceWithoutDiscount,
      int? sequenceNumber,
      dynamic? costPrice,
      dynamic? tags,
      dynamic? tagName,
      dynamic? tagId,
      dynamic? tagImageDtoList,
      int? minQuantityToSale,
      int? maxQuantityToSale,
      int? quantityIncrement,
      bool? hasChildProduct,
      dynamic? promotionType,
      int? promotionValue,
      dynamic? promotionStartdate,
      dynamic? promotionEnddate,
      dynamic? promotionNotes,
      dynamic? weight,
      dynamic? height,
      dynamic? length,
      dynamic? width,
      int? quantity}) {
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
        width: width ?? this.width,
        quantity: quantity ?? this.quantity);
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
      'width': width,
      'quantity': quantity
    };
  }

  static ProductModel fromJson(Map<String, Object?> json) {
    return ProductModel(
        productId: json['productId'] == null ? null : json['productId'] as int,
        sku: json['sku'] as dynamic,
        upc: json['upc'] == null ? null : json['upc'] as String,
        productName:
            json['productName'] == null ? null : json['productName'] as String,
        alias: json['alias'] == null ? null : json['alias'] as String,
        availableQuantity: json['availableQuantity'] == null
            ? null
            : json['availableQuantity'] as int,
        eta: json['eta'] == null ? null : json['eta'] as String,
        imageUrl: json['imageUrl'] == null ? null : json['imageUrl'] as String,
        masterProductId: json['masterProductId'] as dynamic,
        masterProductName: json['masterProductName'] as dynamic,
        taxClassId: json['taxClassId'] as dynamic,
        standardPrice: json['standardPrice'] == null
            ? null
            : json['standardPrice'] as double,
        standardPriceWithoutDiscount:
            json['standardPriceWithoutDiscount'] == null
                ? null
                : json['standardPriceWithoutDiscount'] as double,
        sequenceNumber: json['sequenceNumber'] == null
            ? null
            : json['sequenceNumber'] as int,
        costPrice: json['costPrice'] as dynamic,
        tags: json['tags'] as dynamic,
        tagName: json['tagName'] as dynamic,
        tagId: json['tagId'] as dynamic,
        tagImageDtoList: json['tagImageDtoList'] as dynamic,
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
        promotionType: json['promotionType'] as dynamic,
        promotionValue: json['promotionValue'] == null
            ? null
            : json['promotionValue'] as int,
        promotionStartdate: json['promotionStartdate'] as dynamic,
        promotionEnddate: json['promotionEnddate'] as dynamic,
        promotionNotes: json['promotionNotes'] as dynamic,
        weight: json['weight'] as dynamic,
        height: json['height'] as dynamic,
        length: json['length'] as dynamic,
        width: json['width'] as dynamic,
        quantity: json['quantity'] == null ? null : json['quantity'] as int);
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
width:$width,
quantity:$quantity
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
        other.width == width &&
        other.quantity == quantity;
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
