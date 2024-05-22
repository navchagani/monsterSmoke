class ProductModel {
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
  const ProductModel(
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
  ProductModel copyWith(
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
    return ProductModel(
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

  static ProductModel fromJson(Map<String, Object?> json) {
    return ProductModel(
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
    return '''Content(
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
    return other is ProductModel &&
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
  final int? pageSize;
  final int? pageNumber;
  final int? offset;
  final bool? unpaged;
  final bool? paged;
  const Pageable(
      {this.sort,
      this.pageSize,
      this.pageNumber,
      this.offset,
      this.unpaged,
      this.paged});
  Pageable copyWith(
      {Sort? sort,
      int? pageSize,
      int? pageNumber,
      int? offset,
      bool? unpaged,
      bool? paged}) {
    return Pageable(
        sort: sort ?? this.sort,
        pageSize: pageSize ?? this.pageSize,
        pageNumber: pageNumber ?? this.pageNumber,
        offset: offset ?? this.offset,
        unpaged: unpaged ?? this.unpaged,
        paged: paged ?? this.paged);
  }

  Map<String, Object?> toJson() {
    return {
      'sort': sort?.toJson(),
      'pageSize': pageSize,
      'pageNumber': pageNumber,
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
        pageSize: json['pageSize'] == null ? null : json['pageSize'] as int,
        pageNumber:
            json['pageNumber'] == null ? null : json['pageNumber'] as int,
        offset: json['offset'] == null ? null : json['offset'] as int,
        unpaged: json['unpaged'] == null ? null : json['unpaged'] as bool,
        paged: json['paged'] == null ? null : json['paged'] as bool);
  }

  @override
  String toString() {
    return '''Pageable(
                sort:${sort.toString()},
pageSize:$pageSize,
pageNumber:$pageNumber,
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
        other.pageSize == pageSize &&
        other.pageNumber == pageNumber &&
        other.offset == offset &&
        other.unpaged == unpaged &&
        other.paged == paged;
  }

  @override
  int get hashCode {
    return Object.hash(
        runtimeType, sort, pageSize, pageNumber, offset, unpaged, paged);
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
  final double? promotionValue;
  final dynamic promotionStartdate;
  final dynamic promotionEnddate;
  final dynamic promotionNotes;
  final dynamic weight;
  final dynamic height;
  final dynamic length;
  final dynamic width;
  final int? quantity;
  const Content(
      {this.quantity,
      this.productId,
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
  Content copyWith(
      {int? productId,
      dynamic sku,
      String? upc,
      String? productName,
      String? alias,
      int? availableQuantity,
      String? eta,
      String? imageUrl,
      dynamic masterProductId,
      dynamic masterProductName,
      dynamic taxClassId,
      double? standardPrice,
      double? standardPriceWithoutDiscount,
      int? sequenceNumber,
      dynamic costPrice,
      dynamic tags,
      dynamic tagName,
      dynamic tagId,
      dynamic tagImageDtoList,
      int? minQuantityToSale,
      int? maxQuantityToSale,
      int? quantityIncrement,
      bool? hasChildProduct,
      dynamic promotionType,
      double? promotionValue,
      dynamic promotionStartdate,
      dynamic promotionEnddate,
      dynamic promotionNotes,
      dynamic weight,
      dynamic height,
      dynamic length,
      dynamic width}) {
    return Content(
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

  static Content fromJson(Map<String, Object?> json) {
    return Content(
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
            : json['promotionValue'] as double,
        promotionStartdate: json['promotionStartdate'] as dynamic,
        promotionEnddate: json['promotionEnddate'] as dynamic,
        promotionNotes: json['promotionNotes'] as dynamic,
        weight: json['weight'] as dynamic,
        height: json['height'] as dynamic,
        length: json['length'] as dynamic,
        width: json['width'] as dynamic);
  }

  @override
  String toString() {
    return '''Content(
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
    return other is Content &&
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
