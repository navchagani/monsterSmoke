class UpdateCartModel {
  int? totalCartQuantity;
  double? cartSubTotal;
  double? cartDiscount;
  double? totalCartPrice;
  List<CartLineItemDtoList>? cartLineItemDtoList;
  UpdateCartModel(
      {this.totalCartQuantity,
      this.cartSubTotal,
      this.cartDiscount,
      this.totalCartPrice,
      this.cartLineItemDtoList});
  UpdateCartModel copyWith(
      {int? totalCartQuantity,
      double? cartSubTotal,
      double? cartDiscount,
      double? totalCartPrice,
      List<CartLineItemDtoList>? cartLineItemDtoList}) {
    return UpdateCartModel(
        totalCartQuantity: totalCartQuantity ?? this.totalCartQuantity,
        cartSubTotal: cartSubTotal ?? this.cartSubTotal,
        cartDiscount: cartDiscount ?? this.cartDiscount,
        totalCartPrice: totalCartPrice ?? this.totalCartPrice,
        cartLineItemDtoList: cartLineItemDtoList ?? this.cartLineItemDtoList);
  }

  Map<String, Object?> toJson() {
    return {
      'totalCartQuantity': totalCartQuantity,
      'cartSubTotal': cartSubTotal,
      'cartDiscount': cartDiscount,
      'totalCartPrice': totalCartPrice,
      'cartLineItemDtoList': cartLineItemDtoList
          ?.map<Map<String, dynamic>>((data) => data.toJson())
          .toList()
    };
  }

  static UpdateCartModel fromJson(Map<String, Object?> json) {
    return UpdateCartModel(
        totalCartQuantity: json['totalCartQuantity'] == null
            ? null
            : json['totalCartQuantity'] as int,
        cartSubTotal: json['cartSubTotal'] == null
            ? null
            : json['cartSubTotal'] as double,
        cartDiscount: json['cartDiscount'] == null
            ? null
            : json['cartDiscount'] as double,
        totalCartPrice: json['totalCartPrice'] == null
            ? null
            : json['totalCartPrice'] as double,
        cartLineItemDtoList: json['cartLineItemDtoList'] == null
            ? null
            : (json['cartLineItemDtoList'] as List)
                .map<CartLineItemDtoList>((data) =>
                    CartLineItemDtoList.fromJson(data as Map<String, Object?>))
                .toList());
  }

  @override
  String toString() {
    return '''UpdateCartModel(
                totalCartQuantity:$totalCartQuantity,
cartSubTotal:$cartSubTotal,
cartDiscount:$cartDiscount,
totalCartPrice:$totalCartPrice,
cartLineItemDtoList:${cartLineItemDtoList.toString()}
    ) ''';
  }

  @override
  bool operator ==(Object other) {
    return other is UpdateCartModel &&
        other.runtimeType == runtimeType &&
        other.totalCartQuantity == totalCartQuantity &&
        other.cartSubTotal == cartSubTotal &&
        other.cartDiscount == cartDiscount &&
        other.totalCartPrice == totalCartPrice &&
        other.cartLineItemDtoList == cartLineItemDtoList;
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, totalCartQuantity, cartSubTotal,
        cartDiscount, totalCartPrice, cartLineItemDtoList);
  }
}

class CartLineItemDtoList {
  int? id;
  int? productId;
  int? customerId;
  int? storeId;
  String? productName;
  dynamic sku;
  String? upc;
  int? quantity = 1;
  dynamic status;
  double? costPrice;
  double? standardPrice;
  double? cartStandardPrice;
  double? tierPrice;
  double? originalStandardPrice;
  double? adminRetailPrice;
  int? availableQuantity;
  bool? deleted;
  double? discountValue;
  dynamic discountType;
  double? discountAmount;
  dynamic taxClassId;
  dynamic taxType;
  double? taxPercentage;
  double? taxPerVolume;
  bool? outOfStock;
  int? minQuantityToSale;
  int? maxQuantityToSale;
  int? quantityIncrement;
  bool? cartLineItemUpdated;
  String? imageUrl;
  dynamic updatedBy;
  String? insertedTimestamp;
  String? updatedTimestamp;
  double? discount;
  dynamic taxIncludedInSellingPrice;
  dynamic taxPerOunce;
  dynamic directTaxPercentage;
  double? maxCostPrice;
  double? taxAmount;
  dynamic size;
  bool? serviceProduct;
  double? subtotal;
  CartLineItemDtoList(
      {this.id,
      this.productId,
      this.customerId,
      this.storeId,
      this.productName,
      this.sku,
      this.upc,
      this.quantity,
      this.status,
      this.costPrice,
      this.standardPrice,
      this.cartStandardPrice,
      this.tierPrice,
      this.originalStandardPrice,
      this.adminRetailPrice,
      this.availableQuantity,
      this.deleted,
      this.discountValue,
      this.discountType,
      this.discountAmount,
      this.taxClassId,
      this.taxType,
      this.taxPercentage,
      this.taxPerVolume,
      this.outOfStock,
      this.minQuantityToSale,
      this.maxQuantityToSale,
      this.quantityIncrement,
      this.cartLineItemUpdated,
      this.imageUrl,
      this.updatedBy,
      this.insertedTimestamp,
      this.updatedTimestamp,
      this.discount,
      this.taxIncludedInSellingPrice,
      this.taxPerOunce,
      this.directTaxPercentage,
      this.maxCostPrice,
      this.taxAmount,
      this.size,
      this.serviceProduct,
      this.subtotal});
  CartLineItemDtoList copyWith(
      {int? id,
      int? productId,
      int? customerId,
      int? storeId,
      String? productName,
      dynamic sku,
      String? upc,
      int? quantity = 1,
      dynamic status,
      double? costPrice,
      double? standardPrice,
      double? cartStandardPrice,
      double? tierPrice,
      double? originalStandardPrice,
      double? adminRetailPrice,
      int? availableQuantity,
      bool? deleted,
      double? discountValue,
      dynamic discountType,
      double? discountAmount,
      dynamic taxClassId,
      dynamic taxType,
      double? taxPercentage,
      double? taxPerVolume,
      bool? outOfStock,
      int? minQuantityToSale,
      int? maxQuantityToSale,
      int? quantityIncrement,
      bool? cartLineItemUpdated,
      String? imageUrl,
      dynamic updatedBy,
      String? insertedTimestamp,
      String? updatedTimestamp,
      double? discount,
      dynamic taxIncludedInSellingPrice,
      dynamic taxPerOunce,
      dynamic directTaxPercentage,
      double? maxCostPrice,
      double? taxAmount,
      dynamic size,
      bool? serviceProduct,
      double? subtotal}) {
    return CartLineItemDtoList(
        id: id ?? this.id,
        productId: productId ?? this.productId,
        customerId: customerId ?? this.customerId,
        storeId: storeId ?? this.storeId,
        productName: productName ?? this.productName,
        sku: sku ?? this.sku,
        upc: upc ?? this.upc,
        quantity: quantity ?? this.quantity,
        status: status ?? this.status,
        costPrice: costPrice ?? this.costPrice,
        standardPrice: standardPrice ?? this.standardPrice,
        cartStandardPrice: cartStandardPrice ?? this.cartStandardPrice,
        tierPrice: tierPrice ?? this.tierPrice,
        originalStandardPrice:
            originalStandardPrice ?? this.originalStandardPrice,
        adminRetailPrice: adminRetailPrice ?? this.adminRetailPrice,
        availableQuantity: availableQuantity ?? this.availableQuantity,
        deleted: deleted ?? this.deleted,
        discountValue: discountValue ?? this.discountValue,
        discountType: discountType ?? this.discountType,
        discountAmount: discountAmount ?? this.discountAmount,
        taxClassId: taxClassId ?? this.taxClassId,
        taxType: taxType ?? this.taxType,
        taxPercentage: taxPercentage ?? this.taxPercentage,
        taxPerVolume: taxPerVolume ?? this.taxPerVolume,
        outOfStock: outOfStock ?? this.outOfStock,
        minQuantityToSale: minQuantityToSale ?? this.minQuantityToSale,
        maxQuantityToSale: maxQuantityToSale ?? this.maxQuantityToSale,
        quantityIncrement: quantityIncrement ?? this.quantityIncrement,
        cartLineItemUpdated: cartLineItemUpdated ?? this.cartLineItemUpdated,
        imageUrl: imageUrl ?? this.imageUrl,
        updatedBy: updatedBy ?? this.updatedBy,
        insertedTimestamp: insertedTimestamp ?? this.insertedTimestamp,
        updatedTimestamp: updatedTimestamp ?? this.updatedTimestamp,
        discount: discount ?? this.discount,
        taxIncludedInSellingPrice:
            taxIncludedInSellingPrice ?? this.taxIncludedInSellingPrice,
        taxPerOunce: taxPerOunce ?? this.taxPerOunce,
        directTaxPercentage: directTaxPercentage ?? this.directTaxPercentage,
        maxCostPrice: maxCostPrice ?? this.maxCostPrice,
        taxAmount: taxAmount ?? this.taxAmount,
        size: size ?? this.size,
        serviceProduct: serviceProduct ?? this.serviceProduct,
        subtotal: subtotal ?? this.subtotal);
  }

  Map<String, Object?> toJson() {
    return {
      'id': id,
      'productId': productId,
      'customerId': customerId,
      'storeId': storeId,
      'productName': productName,
      'sku': sku,
      'upc': upc,
      'quantity': quantity,
      'status': status,
      'costPrice': costPrice,
      'standardPrice': standardPrice,
      'cartStandardPrice': cartStandardPrice,
      'tierPrice': tierPrice,
      'originalStandardPrice': originalStandardPrice,
      'adminRetailPrice': adminRetailPrice,
      'availableQuantity': availableQuantity,
      'deleted': deleted,
      'discountValue': discountValue,
      'discountType': discountType,
      'discountAmount': discountAmount,
      'taxClassId': taxClassId,
      'taxType': taxType,
      'taxPercentage': taxPercentage,
      'taxPerVolume': taxPerVolume,
      'outOfStock': outOfStock,
      'minQuantityToSale': minQuantityToSale,
      'maxQuantityToSale': maxQuantityToSale,
      'quantityIncrement': quantityIncrement,
      'cartLineItemUpdated': cartLineItemUpdated,
      'imageUrl': imageUrl,
      'updatedBy': updatedBy,
      'insertedTimestamp': insertedTimestamp,
      'updatedTimestamp': updatedTimestamp,
      'discount': discount,
      'taxIncludedInSellingPrice': taxIncludedInSellingPrice,
      'taxPerOunce': taxPerOunce,
      'directTaxPercentage': directTaxPercentage,
      'maxCostPrice': maxCostPrice,
      'taxAmount': taxAmount,
      'size': size,
      'serviceProduct': serviceProduct,
      'subtotal': subtotal
    };
  }

  static CartLineItemDtoList fromJson(Map<String, Object?> json) {
    return CartLineItemDtoList(
        id: json['id'] == null ? null : json['id'] as int,
        productId: json['productId'] == null ? null : json['productId'] as int,
        customerId:
            json['customerId'] == null ? null : json['customerId'] as int,
        storeId: json['storeId'] == null ? null : json['storeId'] as int,
        productName:
            json['productName'] == null ? null : json['productName'] as String,
        sku: json['sku'] as dynamic,
        upc: json['upc'] == null ? null : json['upc'] as String,
        quantity: json['quantity'] == null ? 1 : json['quantity'] as int,
        status: json['status'] as dynamic,
        costPrice:
            json['costPrice'] == null ? null : json['costPrice'] as double,
        standardPrice: json['standardPrice'] == null
            ? null
            : json['standardPrice'] as double,
        cartStandardPrice: json['cartStandardPrice'] == null
            ? null
            : json['cartStandardPrice'] as double,
        tierPrice:
            json['tierPrice'] == null ? null : json['tierPrice'] as double,
        originalStandardPrice: json['originalStandardPrice'] == null
            ? null
            : json['originalStandardPrice'] as double,
        adminRetailPrice: json['adminRetailPrice'] == null
            ? null
            : json['adminRetailPrice'] as double,
        availableQuantity: json['availableQuantity'] == null
            ? null
            : json['availableQuantity'] as int,
        deleted: json['deleted'] == null ? null : json['deleted'] as bool,
        discountValue: json['discountValue'] == null
            ? null
            : json['discountValue'] as double,
        discountType: json['discountType'] as dynamic,
        discountAmount: json['discountAmount'] == null
            ? null
            : json['discountAmount'] as double,
        taxClassId: json['taxClassId'] as dynamic,
        taxType: json['taxType'] as dynamic,
        taxPercentage: json['taxPercentage'] == null
            ? null
            : json['taxPercentage'] as double,
        taxPerVolume: json['taxPerVolume'] == null
            ? null
            : json['taxPerVolume'] as double,
        outOfStock:
            json['outOfStock'] == null ? null : json['outOfStock'] as bool,
        minQuantityToSale: json['minQuantityToSale'] == null
            ? null
            : json['minQuantityToSale'] as int,
        maxQuantityToSale: json['maxQuantityToSale'] == null
            ? null
            : json['maxQuantityToSale'] as int,
        quantityIncrement: json['quantityIncrement'] == null
            ? null
            : json['quantityIncrement'] as int,
        cartLineItemUpdated: json['cartLineItemUpdated'] == null
            ? null
            : json['cartLineItemUpdated'] as bool,
        imageUrl: json['imageUrl'] == null ? null : json['imageUrl'] as String,
        updatedBy: json['updatedBy'] as dynamic,
        insertedTimestamp: json['insertedTimestamp'] == null
            ? null
            : json['insertedTimestamp'] as String,
        updatedTimestamp: json['updatedTimestamp'] == null
            ? null
            : json['updatedTimestamp'] as String,
        discount: json['discount'] == null ? null : json['discount'] as double,
        taxIncludedInSellingPrice: json['taxIncludedInSellingPrice'] as dynamic,
        taxPerOunce: json['taxPerOunce'] as dynamic,
        directTaxPercentage: json['directTaxPercentage'] as dynamic,
        maxCostPrice: json['maxCostPrice'] == null
            ? null
            : json['maxCostPrice'] as double,
        taxAmount:
            json['taxAmount'] == null ? null : json['taxAmount'] as double,
        size: json['size'] as dynamic,
        serviceProduct: json['serviceProduct'] == null
            ? null
            : json['serviceProduct'] as bool,
        subtotal: json['subtotal'] == null ? null : json['subtotal'] as double);
  }

  @override
  String toString() {
    return '''CartLineItemDtoList(
                id:$id,
productId:$productId,
customerId:$customerId,
storeId:$storeId,
productName:$productName,
sku:$sku,
upc:$upc,
quantity:$quantity,
status:$status,
costPrice:$costPrice,
standardPrice:$standardPrice,
cartStandardPrice:$cartStandardPrice,
tierPrice:$tierPrice,
originalStandardPrice:$originalStandardPrice,
adminRetailPrice:$adminRetailPrice,
availableQuantity:$availableQuantity,
deleted:$deleted,
discountValue:$discountValue,
discountType:$discountType,
discountAmount:$discountAmount,
taxClassId:$taxClassId,
taxType:$taxType,
taxPercentage:$taxPercentage,
taxPerVolume:$taxPerVolume,
outOfStock:$outOfStock,
minQuantityToSale:$minQuantityToSale,
maxQuantityToSale:$maxQuantityToSale,
quantityIncrement:$quantityIncrement,
cartLineItemUpdated:$cartLineItemUpdated,
imageUrl:$imageUrl,
updatedBy:$updatedBy,
insertedTimestamp:$insertedTimestamp,
updatedTimestamp:$updatedTimestamp,
discount:$discount,
taxIncludedInSellingPrice:$taxIncludedInSellingPrice,
taxPerOunce:$taxPerOunce,
directTaxPercentage:$directTaxPercentage,
maxCostPrice:$maxCostPrice,
taxAmount:$taxAmount,
size:$size,
serviceProduct:$serviceProduct,
subtotal:$subtotal
    ) ''';
  }

  @override
  bool operator ==(Object other) {
    return other is CartLineItemDtoList &&
        other.runtimeType == runtimeType &&
        other.id == id &&
        other.productId == productId &&
        other.customerId == customerId &&
        other.storeId == storeId &&
        other.productName == productName &&
        other.sku == sku &&
        other.upc == upc &&
        other.quantity == quantity &&
        other.status == status &&
        other.costPrice == costPrice &&
        other.standardPrice == standardPrice &&
        other.cartStandardPrice == cartStandardPrice &&
        other.tierPrice == tierPrice &&
        other.originalStandardPrice == originalStandardPrice &&
        other.adminRetailPrice == adminRetailPrice &&
        other.availableQuantity == availableQuantity &&
        other.deleted == deleted &&
        other.discountValue == discountValue &&
        other.discountType == discountType &&
        other.discountAmount == discountAmount &&
        other.taxClassId == taxClassId &&
        other.taxType == taxType &&
        other.taxPercentage == taxPercentage &&
        other.taxPerVolume == taxPerVolume &&
        other.outOfStock == outOfStock &&
        other.minQuantityToSale == minQuantityToSale &&
        other.maxQuantityToSale == maxQuantityToSale &&
        other.quantityIncrement == quantityIncrement &&
        other.cartLineItemUpdated == cartLineItemUpdated &&
        other.imageUrl == imageUrl &&
        other.updatedBy == updatedBy &&
        other.insertedTimestamp == insertedTimestamp &&
        other.updatedTimestamp == updatedTimestamp &&
        other.discount == discount &&
        other.taxIncludedInSellingPrice == taxIncludedInSellingPrice &&
        other.taxPerOunce == taxPerOunce &&
        other.directTaxPercentage == directTaxPercentage &&
        other.maxCostPrice == maxCostPrice &&
        other.taxAmount == taxAmount &&
        other.size == size &&
        other.serviceProduct == serviceProduct &&
        other.subtotal == subtotal;
  }

  @override
  int get hashCode {
    return Object.hash(
        runtimeType,
        id,
        productId,
        customerId,
        storeId,
        productName,
        sku,
        upc,
        quantity,
        status,
        costPrice,
        standardPrice,
        cartStandardPrice,
        tierPrice,
        originalStandardPrice,
        adminRetailPrice,
        availableQuantity,
        deleted,
        discountValue,
        discountType);
  }
}
