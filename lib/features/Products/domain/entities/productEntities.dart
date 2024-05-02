import 'package:equatable/equatable.dart';

class ProductEntities extends Equatable {
  String? productId;
  String? sku;
  String? upc;
  String? productName;
  String? alias;
  String? availableQuantity;
  String? eta;
  String? imageUrl;
  String? masterProductId;
  String? masterProductName;
  String? taxClassId;
  String? standardPrice;
  String? standardPriceWithoutDiscount;
  String? sequenceNumber;
  String? costPrice;
  String? tags;
  String? tagName;
  String? tagId;
  String? tagImageDtoList;
  String? minQuantityToSale;
  String? maxQuantityToSale;
  String? quantityIncrement;
  bool? hasChildProduct;
  String? promotionType;
  String? promotionValue;
  String? promotionStartdate;
  String? promotionEnddate;
  String? promotionNotes;
  String? weight;
  String? height;
  String? length;
  String? width;

  ProductEntities(
      {required this.productId,
      required this.sku,
      required this.upc,
      required this.productName,
      required this.alias,
      required this.availableQuantity,
      required this.eta,
      required this.imageUrl,
      required this.masterProductId,
      required this.masterProductName,
      required this.taxClassId,
      required this.standardPrice,
      required this.standardPriceWithoutDiscount,
      required this.sequenceNumber,
      required this.costPrice,
      required this.tags,
      required this.tagName,
      required this.tagId,
      required this.tagImageDtoList,
      required this.minQuantityToSale,
      required this.maxQuantityToSale,
      required this.quantityIncrement,
      required this.hasChildProduct,
      required this.promotionType,
      required this.promotionValue,
      required this.promotionStartdate,
      required this.promotionEnddate,
      required this.promotionNotes,
      required this.weight,
      required this.height,
      required this.length,
      required this.width});

  @override
  List<Object?> get props => throw UnimplementedError();
}
