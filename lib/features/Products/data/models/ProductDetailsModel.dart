class ProductDetailModel {
  final MasterProductDetails? masterProductDetails;
  final List<dynamic>? productImageList;
  final List<dynamic>? header;
  final Body? body;
  const ProductDetailModel(
      {this.masterProductDetails,
      this.productImageList,
      this.header,
      this.body});
  ProductDetailModel copyWith(
      {MasterProductDetails? masterProductDetails,
      List<dynamic>? productImageList,
      List<dynamic>? header,
      Body? body}) {
    return ProductDetailModel(
        masterProductDetails: masterProductDetails ?? this.masterProductDetails,
        productImageList: productImageList ?? this.productImageList,
        header: header ?? this.header,
        body: body ?? this.body);
  }

  Map<String, Object?> toJson() {
    return {
      'masterProductDetails': masterProductDetails?.toJson(),
      'productImageList': productImageList,
      'header': header,
      'body': body?.toJson()
    };
  }

  static ProductDetailModel fromJson(Map<String, Object?> json) {
    return ProductDetailModel(
        masterProductDetails: json['masterProductDetails'] == null
            ? null
            : MasterProductDetails.fromJson(
                json['masterProductDetails'] as Map<String, Object?>),
        productImageList: json['productImageList'] == null
            ? null
            : json['productImageList'] as List<dynamic>,
        header: json['header'] == null ? null : json['header'] as List<dynamic>,
        body: json['body'] == null
            ? null
            : Body.fromJson(json['body'] as Map<String, Object?>));
  }

  @override
  String toString() {
    return '''ProductDetailModel(
                masterProductDetails:${masterProductDetails.toString()},
productImageList:$productImageList,
header:$header,
body:${body.toString()}
    ) ''';
  }

  @override
  bool operator ==(Object other) {
    return other is ProductDetailModel &&
        other.runtimeType == runtimeType &&
        other.masterProductDetails == masterProductDetails &&
        other.productImageList == productImageList &&
        other.header == header &&
        other.body == body;
  }

  @override
  int get hashCode {
    return Object.hash(
        runtimeType, masterProductDetails, productImageList, header, body);
  }
}

class Body {
  final List<Content>? content;
  final Pageable? pageable;
  final int? totalElements;
  final int? totalPages;
  final bool? last;
  final bool? first;
  final Sort? sort;
  final int? size;
  final int? number;
  final int? numberOfElements;
  final bool? empty;
  const Body(
      {this.content,
      this.pageable,
      this.totalElements,
      this.totalPages,
      this.last,
      this.first,
      this.sort,
      this.size,
      this.number,
      this.numberOfElements,
      this.empty});
  Body copyWith(
      {List<Content>? content,
      Pageable? pageable,
      int? totalElements,
      int? totalPages,
      bool? last,
      bool? first,
      Sort? sort,
      int? size,
      int? number,
      int? numberOfElements,
      bool? empty}) {
    return Body(
        content: content ?? this.content,
        pageable: pageable ?? this.pageable,
        totalElements: totalElements ?? this.totalElements,
        totalPages: totalPages ?? this.totalPages,
        last: last ?? this.last,
        first: first ?? this.first,
        sort: sort ?? this.sort,
        size: size ?? this.size,
        number: number ?? this.number,
        numberOfElements: numberOfElements ?? this.numberOfElements,
        empty: empty ?? this.empty);
  }

  Map<String, Object?> toJson() {
    return {
      'content':
          content?.map<Map<String, dynamic>>((data) => data.toJson()).toList(),
      'pageable': pageable?.toJson(),
      'totalElements': totalElements,
      'totalPages': totalPages,
      'last': last,
      'first': first,
      'sort': sort?.toJson(),
      'size': size,
      'number': number,
      'numberOfElements': numberOfElements,
      'empty': empty
    };
  }

  static Body fromJson(Map<String, Object?> json) {
    return Body(
        content: json['content'] == null
            ? null
            : (json['content'] as List)
                .map<Content>(
                    (data) => Content.fromJson(data as Map<String, Object?>))
                .toList(),
        pageable: json['pageable'] == null
            ? null
            : Pageable.fromJson(json['pageable'] as Map<String, Object?>),
        totalElements:
            json['totalElements'] == null ? null : json['totalElements'] as int,
        totalPages:
            json['totalPages'] == null ? null : json['totalPages'] as int,
        last: json['last'] == null ? null : json['last'] as bool,
        first: json['first'] == null ? null : json['first'] as bool,
        sort: json['sort'] == null
            ? null
            : Sort.fromJson(json['sort'] as Map<String, Object?>),
        size: json['size'] == null ? null : json['size'] as int,
        number: json['number'] == null ? null : json['number'] as int,
        numberOfElements: json['numberOfElements'] == null
            ? null
            : json['numberOfElements'] as int,
        empty: json['empty'] == null ? null : json['empty'] as bool);
  }

  @override
  String toString() {
    return '''Body(
                content:${content.toString()},
pageable:${pageable.toString()},
totalElements:$totalElements,
totalPages:$totalPages,
last:$last,
first:$first,
sort:${sort.toString()},
size:$size,
number:$number,
numberOfElements:$numberOfElements,
empty:$empty
    ) ''';
  }

  @override
  bool operator ==(Object other) {
    return other is Body &&
        other.runtimeType == runtimeType &&
        other.content == content &&
        other.pageable == pageable &&
        other.totalElements == totalElements &&
        other.totalPages == totalPages &&
        other.last == last &&
        other.first == first &&
        other.sort == sort &&
        other.size == size &&
        other.number == number &&
        other.numberOfElements == numberOfElements &&
        other.empty == empty;
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, content, pageable, totalElements,
        totalPages, last, first, sort, size, number, numberOfElements, empty);
  }
}

class Pageable {
  final Sort? sort;
  final int? pageNumber;
  final int? pageSize;
  final int? offset;
  final bool? unpaged;
  final bool? paged;
  const Pageable(
      {this.sort,
      this.pageNumber,
      this.pageSize,
      this.offset,
      this.unpaged,
      this.paged});
  Pageable copyWith(
      {Sort? sort,
      int? pageNumber,
      int? pageSize,
      int? offset,
      bool? unpaged,
      bool? paged}) {
    return Pageable(
        sort: sort ?? this.sort,
        pageNumber: pageNumber ?? this.pageNumber,
        pageSize: pageSize ?? this.pageSize,
        offset: offset ?? this.offset,
        unpaged: unpaged ?? this.unpaged,
        paged: paged ?? this.paged);
  }

  Map<String, Object?> toJson() {
    return {
      'sort': sort?.toJson(),
      'pageNumber': pageNumber,
      'pageSize': pageSize,
      'offset': offset,
      'unpaged': unpaged,
      'paged': paged
    };
  }

  static Pageable fromJson(Map<String, Object?> json) {
    return Pageable(
        sort: json['sort'] == null
            ? null
            : Sort.fromJson(json['sort'] as Map<String, Object?>),
        pageNumber:
            json['pageNumber'] == null ? null : json['pageNumber'] as int,
        pageSize: json['pageSize'] == null ? null : json['pageSize'] as int,
        offset: json['offset'] == null ? null : json['offset'] as int,
        unpaged: json['unpaged'] == null ? null : json['unpaged'] as bool,
        paged: json['paged'] == null ? null : json['paged'] as bool);
  }

  @override
  String toString() {
    return '''Pageable(
                sort:${sort.toString()},
pageNumber:$pageNumber,
pageSize:$pageSize,
offset:$offset,
unpaged:$unpaged,
paged:$paged
    ) ''';
  }

  @override
  bool operator ==(Object other) {
    return other is Pageable &&
        other.runtimeType == runtimeType &&
        other.sort == sort &&
        other.pageNumber == pageNumber &&
        other.pageSize == pageSize &&
        other.offset == offset &&
        other.unpaged == unpaged &&
        other.paged == paged;
  }

  @override
  int get hashCode {
    return Object.hash(
        runtimeType, sort, pageNumber, pageSize, offset, unpaged, paged);
  }
}

class Sort {
  final bool? sorted;
  final bool? unsorted;
  final bool? empty;
  const Sort({this.sorted, this.unsorted, this.empty});
  Sort copyWith({bool? sorted, bool? unsorted, bool? empty}) {
    return Sort(
        sorted: sorted ?? this.sorted,
        unsorted: unsorted ?? this.unsorted,
        empty: empty ?? this.empty);
  }

  Map<String, Object?> toJson() {
    return {'sorted': sorted, 'unsorted': unsorted, 'empty': empty};
  }

  static Sort fromJson(Map<String, Object?> json) {
    return Sort(
        sorted: json['sorted'] == null ? null : json['sorted'] as bool,
        unsorted: json['unsorted'] == null ? null : json['unsorted'] as bool,
        empty: json['empty'] == null ? null : json['empty'] as bool);
  }

  @override
  String toString() {
    return '''Sort(
                sorted:$sorted,
unsorted:$unsorted,
empty:$empty
    ) ''';
  }

  @override
  bool operator ==(Object other) {
    return other is Sort &&
        other.runtimeType == runtimeType &&
        other.sorted == sorted &&
        other.unsorted == unsorted &&
        other.empty == empty;
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, sorted, unsorted, empty);
  }
}

class Content {
  final String? masterProductId;
  final int? productId;
  final String? productCategoryId;
  final String? productName;
  final String? urlAlias;
  final String? shortDescription;
  final String? fullDescription;
  final int? availableQuantity;
  final String? eta;
  final double? standardPrice;
  final double? standardPriceWithoutDiscount;
  final String? imageUrl;
  final String? upc;
  final String? sku;
  final String? sequenceNumber;
  final ProductVariantLabelValues? productVariantLabelValues;
  final bool? categorySelected;
  final int? minQuantityToSale;
  final int? maxQuantityToSale;
  final int? quantityIncrement;
  final String? tagImageDtoList;
  final String? attachmentUrlList;
  final String? metaTitle;
  final String? metaKeyword;
  final String? metaDescription;
  final String? modelName;
  final double? msrp;
  final int? boxQuantity;
  final int? caseQuantity;
  final double? nicotineStrength;
  final double? volume;
  final String? ouncePerProduct;
  const Content(
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
  Content copyWith(
      {String? masterProductId,
      int? productId,
      String? productCategoryId,
      String? productName,
      String? urlAlias,
      String? shortDescription,
      String? fullDescription,
      int? availableQuantity,
      String? eta,
      double? standardPrice,
      double? standardPriceWithoutDiscount,
      String? imageUrl,
      String? upc,
      String? sku,
      String? sequenceNumber,
      ProductVariantLabelValues? productVariantLabelValues,
      bool? categorySelected,
      int? minQuantityToSale,
      int? maxQuantityToSale,
      int? quantityIncrement,
      String? tagImageDtoList,
      String? attachmentUrlList,
      String? metaTitle,
      String? metaKeyword,
      String? metaDescription,
      String? modelName,
      double? msrp,
      int? boxQuantity,
      int? caseQuantity,
      double? nicotineStrength,
      double? volume,
      String? ouncePerProduct}) {
    return Content(
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
      'productVariantLabelValues': productVariantLabelValues?.toJson(),
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

  static Content fromJson(Map<String, Object?> json) {
    return Content(
        masterProductId: json['masterProductId'] as String?,
        productId: json['productId'] == null ? null : json['productId'] as int,
        productCategoryId: json['productCategoryId'] as String?,
        productName:
            json['productName'] == null ? null : json['productName'] as String,
        urlAlias: json['urlAlias'] as String?,
        shortDescription: json['shortDescription'] == null
            ? null
            : json['shortDescription'] as String,
        fullDescription: json['fullDescription'] == null
            ? null
            : json['fullDescription'] as String,
        availableQuantity: json['availableQuantity'] == null
            ? null
            : json['availableQuantity'] as int,
        eta: json['eta'] == null ? null : json['eta'] as String,
        standardPrice: json['standardPrice'] == null
            ? null
            : json['standardPrice'] as double,
        standardPriceWithoutDiscount:
            json['standardPriceWithoutDiscount'] == null
                ? null
                : json['standardPriceWithoutDiscount'] as double,
        imageUrl: json['imageUrl'] == null ? null : json['imageUrl'] as String,
        upc: json['upc'] == null ? null : json['upc'] as String,
        sku: json['sku'] == null ? null : json['sku'] as String,
        sequenceNumber: json['sequenceNumber'] as String?,
        productVariantLabelValues: json['productVariantLabelValues'] == null
            ? null
            : ProductVariantLabelValues.fromJson(
                json['productVariantLabelValues'] as Map<String, Object?>),
        categorySelected: json['categorySelected'] == null
            ? null
            : json['categorySelected'] as bool,
        minQuantityToSale: json['minQuantityToSale'] == null
            ? null
            : json['minQuantityToSale'] as int,
        maxQuantityToSale: json['maxQuantityToSale'] == null
            ? null
            : json['maxQuantityToSale'] as int,
        quantityIncrement: json['quantityIncrement'] == null
            ? null
            : json['quantityIncrement'] as int,
        tagImageDtoList: json['tagImageDtoList'] as String?,
        attachmentUrlList: json['attachmentUrlList'] as String?,
        metaTitle: json['metaTitle'] as String?,
        metaKeyword: json['metaKeyword'] as String?,
        metaDescription: json['metaDescription'] as String?,
        modelName: json['modelName'] as String?,
        msrp: json['msrp'] == null ? null : json['msrp'] as double,
        boxQuantity: json['boxQuantity'] as int?,
        caseQuantity:
            json['caseQuantity'] == null ? null : json['caseQuantity'] as int,
        nicotineStrength: json['nicotineStrength'] == null
            ? null
            : json['nicotineStrength'] as double,
        volume: json['volume'] == null ? null : json['volume'] as double,
        ouncePerProduct: json['ouncePerProduct'] as String?);
  }

  @override
  String toString() {
    return '''Content(
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
productVariantLabelValues:${productVariantLabelValues.toString()},
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
    return other is Content &&
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

class ProductVariantLabelValues {
  final String? FLAVORS;
  const ProductVariantLabelValues({this.FLAVORS});
  ProductVariantLabelValues copyWith({String? FLAVORS}) {
    return ProductVariantLabelValues(FLAVORS: FLAVORS ?? this.FLAVORS);
  }

  Map<String, Object?> toJson() {
    return {'FLAVORS': FLAVORS};
  }

  static ProductVariantLabelValues fromJson(Map<String, Object?> json) {
    return ProductVariantLabelValues(
        FLAVORS: json['FLAVORS'] == null ? null : json['FLAVORS'] as String);
  }

  @override
  String toString() {
    return '''ProductVariantLabelValues(
                FLAVORS:$FLAVORS
    ) ''';
  }

  @override
  bool operator ==(Object other) {
    return other is ProductVariantLabelValues &&
        other.runtimeType == runtimeType &&
        other.FLAVORS == FLAVORS;
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, FLAVORS);
  }
}

class MasterProductDetails {
  final int? masterProductId;
  final int? productId;
  final String? productCategoryId;
  final String? productName;
  final String? urlAlias;
  final String? shortDescription;
  final String? fullDescription;
  final int? availableQuantity;
  final String? eta;
  final double? standardPrice;
  final double? standardPriceWithoutDiscount;
  final String? imageUrl;
  final String? upc;
  final String? sku;
  final String? sequenceNumber;
  final String? productVariantLabelValues;
  final bool? categorySelected;
  final int? minQuantityToSale;
  final int? maxQuantityToSale;
  final int? quantityIncrement;
  final String? tagImageDtoList;
  final String? attachmentUrlList;
  final String? metaTitle;
  final String? metaKeyword;
  final String? metaDescription;
  final String? modelName;
  final double? msrp;
  final String? boxQuantity;
  final int? caseQuantity;
  final double? nicotineStrength;
  final double? volume;
  final String? ouncePerProduct;
  const MasterProductDetails(
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
  MasterProductDetails copyWith(
      {int? masterProductId,
      int? productId,
      String? productCategoryId,
      String? productName,
      String? urlAlias,
      String? shortDescription,
      String? fullDescription,
      int? availableQuantity,
      String? eta,
      double? standardPrice,
      double? standardPriceWithoutDiscount,
      String? imageUrl,
      String? upc,
      String? sku,
      String? sequenceNumber,
      String? productVariantLabelValues,
      bool? categorySelected,
      int? minQuantityToSale,
      int? maxQuantityToSale,
      int? quantityIncrement,
      String? tagImageDtoList,
      String? attachmentUrlList,
      String? metaTitle,
      String? metaKeyword,
      String? metaDescription,
      String? modelName,
      double? msrp,
      String? boxQuantity,
      int? caseQuantity,
      double? nicotineStrength,
      double? volume,
      String? ouncePerProduct}) {
    return MasterProductDetails(
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

  static MasterProductDetails fromJson(Map<String, Object?> json) {
    return MasterProductDetails(
        masterProductId: json['masterProductId'] == null
            ? null
            : json['masterProductId'] as int,
        productId: json['productId'] == null ? null : json['productId'] as int,
        productCategoryId: json['productCategoryId'] as String?,
        productName:
            json['productName'] == null ? null : json['productName'] as String,
        urlAlias: json['urlAlias'] as String?,
        shortDescription: json['shortDescription'] == null
            ? null
            : json['shortDescription'] as String,
        fullDescription: json['fullDescription'] == null
            ? null
            : json['fullDescription'] as String,
        availableQuantity: json['availableQuantity'] == null
            ? null
            : json['availableQuantity'] as int,
        eta: json['eta'] == null ? null : json['eta'] as String,
        standardPrice: json['standardPrice'] == null
            ? null
            : json['standardPrice'] as double,
        standardPriceWithoutDiscount:
            json['standardPriceWithoutDiscount'] == null
                ? null
                : json['standardPriceWithoutDiscount'] as double,
        imageUrl: json['imageUrl'] == null ? null : json['imageUrl'] as String,
        upc: json['upc'] == null ? null : json['upc'] as String,
        sku: json['sku'] == null ? null : json['sku'] as String,
        sequenceNumber: json['sequenceNumber'] as String?,
        productVariantLabelValues: json['productVariantLabelValues'] as String?,
        categorySelected: json['categorySelected'] == null
            ? null
            : json['categorySelected'] as bool,
        minQuantityToSale: json['minQuantityToSale'] == null
            ? null
            : json['minQuantityToSale'] as int,
        maxQuantityToSale: json['maxQuantityToSale'] == null
            ? null
            : json['maxQuantityToSale'] as int,
        quantityIncrement: json['quantityIncrement'] == null
            ? null
            : json['quantityIncrement'] as int,
        tagImageDtoList: json['tagImageDtoList'] as String?,
        attachmentUrlList: json['attachmentUrlList'] as String?,
        metaTitle: json['metaTitle'] as String?,
        metaKeyword: json['metaKeyword'] as String?,
        metaDescription: json['metaDescription'] as String?,
        modelName:
            json['modelName'] == null ? null : json['modelName'] as String,
        msrp: json['msrp'] == null ? null : json['msrp'] as double,
        boxQuantity: json['boxQuantity'] as String?,
        caseQuantity:
            json['caseQuantity'] == null ? null : json['caseQuantity'] as int,
        nicotineStrength: json['nicotineStrength'] == null
            ? null
            : json['nicotineStrength'] as double,
        volume: json['volume'] == null ? null : json['volume'] as double,
        ouncePerProduct: json['ouncePerProduct'] as String?);
  }

  @override
  String toString() {
    return '''MasterProductDetails(
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
    return other is MasterProductDetails &&
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
