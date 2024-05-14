class PlaceOrderResModel {
  final OrderDto? orderDto;
  final dynamic orderLineItemDtoList;
  final List<PaymentDtoList>? paymentDtoList;
  final dynamic configOrderTagList;
  final dynamic customerDto;
  final dynamic orderTaxMapList;
  final List<dynamic>? discountCouponList;
  final dynamic paypalDetails;
  final dynamic brainTreePaymentNonceDto;
  final dynamic brainTreePaypalDto;
  final dynamic orderShipmentDto;
  final bool? productOutOfStock;
  const PlaceOrderResModel(
      {this.orderDto,
      this.orderLineItemDtoList,
      this.paymentDtoList,
      this.configOrderTagList,
      this.customerDto,
      this.orderTaxMapList,
      this.discountCouponList,
      this.paypalDetails,
      this.brainTreePaymentNonceDto,
      this.brainTreePaypalDto,
      this.orderShipmentDto,
      this.productOutOfStock});
  PlaceOrderResModel copyWith(
      {OrderDto? orderDto,
      dynamic orderLineItemDtoList,
      List<PaymentDtoList>? paymentDtoList,
      dynamic configOrderTagList,
      dynamic customerDto,
      dynamic orderTaxMapList,
      List<dynamic>? discountCouponList,
      dynamic paypalDetails,
      dynamic brainTreePaymentNonceDto,
      dynamic brainTreePaypalDto,
      dynamic orderShipmentDto,
      bool? productOutOfStock}) {
    return PlaceOrderResModel(
        orderDto: orderDto ?? this.orderDto,
        orderLineItemDtoList: orderLineItemDtoList ?? this.orderLineItemDtoList,
        paymentDtoList: paymentDtoList ?? this.paymentDtoList,
        configOrderTagList: configOrderTagList ?? this.configOrderTagList,
        customerDto: customerDto ?? this.customerDto,
        orderTaxMapList: orderTaxMapList ?? this.orderTaxMapList,
        discountCouponList: discountCouponList ?? this.discountCouponList,
        paypalDetails: paypalDetails ?? this.paypalDetails,
        brainTreePaymentNonceDto:
            brainTreePaymentNonceDto ?? this.brainTreePaymentNonceDto,
        brainTreePaypalDto: brainTreePaypalDto ?? this.brainTreePaypalDto,
        orderShipmentDto: orderShipmentDto ?? this.orderShipmentDto,
        productOutOfStock: productOutOfStock ?? this.productOutOfStock);
  }

  Map<String, Object?> toJson() {
    return {
      'orderDto': orderDto?.toJson(),
      'orderLineItemDtoList': orderLineItemDtoList,
      'paymentDtoList': paymentDtoList
          ?.map<Map<String, dynamic>>((data) => data.toJson())
          .toList(),
      'configOrderTagList': configOrderTagList,
      'customerDto': customerDto,
      'orderTaxMapList': orderTaxMapList,
      'discountCouponList': discountCouponList,
      'paypalDetails': paypalDetails,
      'brainTreePaymentNonceDto': brainTreePaymentNonceDto,
      'brainTreePaypalDto': brainTreePaypalDto,
      'orderShipmentDto': orderShipmentDto,
      'productOutOfStock': productOutOfStock
    };
  }

  static PlaceOrderResModel fromJson(Map<String, Object?> json) {
    return PlaceOrderResModel(
        orderDto: json['orderDto'] == null
            ? null
            : OrderDto.fromJson(json['orderDto'] as Map<String, Object?>),
        orderLineItemDtoList: json['orderLineItemDtoList'] as dynamic,
        paymentDtoList: json['paymentDtoList'] == null
            ? null
            : (json['paymentDtoList'] as List)
                .map<PaymentDtoList>((data) =>
                    PaymentDtoList.fromJson(data as Map<String, Object?>))
                .toList(),
        configOrderTagList: json['configOrderTagList'] as dynamic,
        customerDto: json['customerDto'] as dynamic,
        orderTaxMapList: json['orderTaxMapList'] as dynamic,
        discountCouponList: json['discountCouponList'] == null
            ? null
            : json['discountCouponList'] as List<dynamic>,
        paypalDetails: json['paypalDetails'] as dynamic,
        brainTreePaymentNonceDto: json['brainTreePaymentNonceDto'] as dynamic,
        brainTreePaypalDto: json['brainTreePaypalDto'] as dynamic,
        orderShipmentDto: json['orderShipmentDto'] as dynamic,
        productOutOfStock: json['productOutOfStock'] == null
            ? null
            : json['productOutOfStock'] as bool);
  }

  @override
  String toString() {
    return '''PlaceOrderResModel(
                orderDto:${orderDto.toString()},
orderLineItemDtoList:$orderLineItemDtoList,
paymentDtoList:${paymentDtoList.toString()},
configOrderTagList:$configOrderTagList,
customerDto:$customerDto,
orderTaxMapList:$orderTaxMapList,
discountCouponList:$discountCouponList,
paypalDetails:$paypalDetails,
brainTreePaymentNonceDto:$brainTreePaymentNonceDto,
brainTreePaypalDto:$brainTreePaypalDto,
orderShipmentDto:$orderShipmentDto,
productOutOfStock:$productOutOfStock
    ) ''';
  }

  @override
  bool operator ==(Object other) {
    return other is PlaceOrderResModel &&
        other.runtimeType == runtimeType &&
        other.orderDto == orderDto &&
        other.orderLineItemDtoList == orderLineItemDtoList &&
        other.paymentDtoList == paymentDtoList &&
        other.configOrderTagList == configOrderTagList &&
        other.customerDto == customerDto &&
        other.orderTaxMapList == orderTaxMapList &&
        other.discountCouponList == discountCouponList &&
        other.paypalDetails == paypalDetails &&
        other.brainTreePaymentNonceDto == brainTreePaymentNonceDto &&
        other.brainTreePaypalDto == brainTreePaypalDto &&
        other.orderShipmentDto == orderShipmentDto &&
        other.productOutOfStock == productOutOfStock;
  }

  @override
  int get hashCode {
    return Object.hash(
        runtimeType,
        orderDto,
        orderLineItemDtoList,
        paymentDtoList,
        configOrderTagList,
        customerDto,
        orderTaxMapList,
        discountCouponList,
        paypalDetails,
        brainTreePaymentNonceDto,
        brainTreePaypalDto,
        orderShipmentDto,
        productOutOfStock);
  }
}

class PaymentDtoList {
  final int? id;
  final dynamic createdBy;
  final dynamic insertedTimestamp;
  final dynamic updatedBy;
  final dynamic updatedTimestamp;
  final dynamic orderId;
  final dynamic customerId;
  final dynamic customerName;
  final dynamic company;
  final dynamic vendorId;
  final dynamic purchaseOrderId;
  final dynamic billId;
  final dynamic paymentType;
  final dynamic paymentTypeName;
  final int? paymentModeId;
  final dynamic paymentModeName;
  final dynamic parentPaymentId;
  final dynamic excessPaymentParentId;
  final dynamic transactionId;
  final dynamic authorizationTransactionId;
  final int? amount;
  final int? excessAmount;
  final dynamic status;
  final bool? sendConfirmation;
  final dynamic createdByEmployeeName;
  final bool? savePaymentInBulk;
  final bool? savePaymentWithExcessPayment;
  final dynamic brainTreePaymentNonceDto;
  final dynamic customerOrderCard;
  final dynamic storePaymentConfigurationDto;
  final int? dueBalance;
  final int? totalPaidAmount;
  final int? totalOrderAmount;
  final dynamic authorizeDotNetCustomerProfileId;
  final dynamic authorizeDotNetCustomerPaymentProfileId;
  final int? cashAmount;
  final int? checkAmount;
  final int? creditCardAmount;
  final dynamic orderIds;
  final bool? capturePaymentWithTransactionId;
  final dynamic notes;
  final dynamic updatedByEmployeeName;
  const PaymentDtoList(
      {this.id,
      this.createdBy,
      this.insertedTimestamp,
      this.updatedBy,
      this.updatedTimestamp,
      this.orderId,
      this.customerId,
      this.customerName,
      this.company,
      this.vendorId,
      this.purchaseOrderId,
      this.billId,
      this.paymentType,
      this.paymentTypeName,
      this.paymentModeId,
      this.paymentModeName,
      this.parentPaymentId,
      this.excessPaymentParentId,
      this.transactionId,
      this.authorizationTransactionId,
      this.amount,
      this.excessAmount,
      this.status,
      this.sendConfirmation,
      this.createdByEmployeeName,
      this.savePaymentInBulk,
      this.savePaymentWithExcessPayment,
      this.brainTreePaymentNonceDto,
      this.customerOrderCard,
      this.storePaymentConfigurationDto,
      this.dueBalance,
      this.totalPaidAmount,
      this.totalOrderAmount,
      this.authorizeDotNetCustomerProfileId,
      this.authorizeDotNetCustomerPaymentProfileId,
      this.cashAmount,
      this.checkAmount,
      this.creditCardAmount,
      this.orderIds,
      this.capturePaymentWithTransactionId,
      this.notes,
      this.updatedByEmployeeName});
  PaymentDtoList copyWith(
      {int? id,
      dynamic createdBy,
      dynamic insertedTimestamp,
      dynamic updatedBy,
      dynamic updatedTimestamp,
      dynamic orderId,
      dynamic customerId,
      dynamic customerName,
      dynamic company,
      dynamic vendorId,
      dynamic purchaseOrderId,
      dynamic billId,
      dynamic paymentType,
      dynamic paymentTypeName,
      int? paymentModeId,
      dynamic paymentModeName,
      dynamic parentPaymentId,
      dynamic excessPaymentParentId,
      dynamic transactionId,
      dynamic authorizationTransactionId,
      int? amount,
      int? excessAmount,
      dynamic status,
      bool? sendConfirmation,
      dynamic createdByEmployeeName,
      bool? savePaymentInBulk,
      bool? savePaymentWithExcessPayment,
      dynamic brainTreePaymentNonceDto,
      dynamic customerOrderCard,
      dynamic storePaymentConfigurationDto,
      int? dueBalance,
      int? totalPaidAmount,
      int? totalOrderAmount,
      dynamic authorizeDotNetCustomerProfileId,
      dynamic authorizeDotNetCustomerPaymentProfileId,
      int? cashAmount,
      int? checkAmount,
      int? creditCardAmount,
      dynamic orderIds,
      bool? capturePaymentWithTransactionId,
      dynamic notes,
      dynamic updatedByEmployeeName}) {
    return PaymentDtoList(
        id: id ?? this.id,
        createdBy: createdBy ?? this.createdBy,
        insertedTimestamp: insertedTimestamp ?? this.insertedTimestamp,
        updatedBy: updatedBy ?? this.updatedBy,
        updatedTimestamp: updatedTimestamp ?? this.updatedTimestamp,
        orderId: orderId ?? this.orderId,
        customerId: customerId ?? this.customerId,
        customerName: customerName ?? this.customerName,
        company: company ?? this.company,
        vendorId: vendorId ?? this.vendorId,
        purchaseOrderId: purchaseOrderId ?? this.purchaseOrderId,
        billId: billId ?? this.billId,
        paymentType: paymentType ?? this.paymentType,
        paymentTypeName: paymentTypeName ?? this.paymentTypeName,
        paymentModeId: paymentModeId ?? this.paymentModeId,
        paymentModeName: paymentModeName ?? this.paymentModeName,
        parentPaymentId: parentPaymentId ?? this.parentPaymentId,
        excessPaymentParentId:
            excessPaymentParentId ?? this.excessPaymentParentId,
        transactionId: transactionId ?? this.transactionId,
        authorizationTransactionId:
            authorizationTransactionId ?? this.authorizationTransactionId,
        amount: amount ?? this.amount,
        excessAmount: excessAmount ?? this.excessAmount,
        status: status ?? this.status,
        sendConfirmation: sendConfirmation ?? this.sendConfirmation,
        createdByEmployeeName:
            createdByEmployeeName ?? this.createdByEmployeeName,
        savePaymentInBulk: savePaymentInBulk ?? this.savePaymentInBulk,
        savePaymentWithExcessPayment:
            savePaymentWithExcessPayment ?? this.savePaymentWithExcessPayment,
        brainTreePaymentNonceDto:
            brainTreePaymentNonceDto ?? this.brainTreePaymentNonceDto,
        customerOrderCard: customerOrderCard ?? this.customerOrderCard,
        storePaymentConfigurationDto:
            storePaymentConfigurationDto ?? this.storePaymentConfigurationDto,
        dueBalance: dueBalance ?? this.dueBalance,
        totalPaidAmount: totalPaidAmount ?? this.totalPaidAmount,
        totalOrderAmount: totalOrderAmount ?? this.totalOrderAmount,
        authorizeDotNetCustomerProfileId: authorizeDotNetCustomerProfileId ??
            this.authorizeDotNetCustomerProfileId,
        authorizeDotNetCustomerPaymentProfileId:
            authorizeDotNetCustomerPaymentProfileId ??
                this.authorizeDotNetCustomerPaymentProfileId,
        cashAmount: cashAmount ?? this.cashAmount,
        checkAmount: checkAmount ?? this.checkAmount,
        creditCardAmount: creditCardAmount ?? this.creditCardAmount,
        orderIds: orderIds ?? this.orderIds,
        capturePaymentWithTransactionId: capturePaymentWithTransactionId ??
            this.capturePaymentWithTransactionId,
        notes: notes ?? this.notes,
        updatedByEmployeeName:
            updatedByEmployeeName ?? this.updatedByEmployeeName);
  }

  Map<String, Object?> toJson() {
    return {
      'id': id,
      'createdBy': createdBy,
      'insertedTimestamp': insertedTimestamp,
      'updatedBy': updatedBy,
      'updatedTimestamp': updatedTimestamp,
      'orderId': orderId,
      'customerId': customerId,
      'customerName': customerName,
      'company': company,
      'vendorId': vendorId,
      'purchaseOrderId': purchaseOrderId,
      'billId': billId,
      'paymentType': paymentType,
      'paymentTypeName': paymentTypeName,
      'paymentModeId': paymentModeId,
      'paymentModeName': paymentModeName,
      'parentPaymentId': parentPaymentId,
      'excessPaymentParentId': excessPaymentParentId,
      'transactionId': transactionId,
      'authorizationTransactionId': authorizationTransactionId,
      'amount': amount,
      'excessAmount': excessAmount,
      'status': status,
      'sendConfirmation': sendConfirmation,
      'createdByEmployeeName': createdByEmployeeName,
      'savePaymentInBulk': savePaymentInBulk,
      'savePaymentWithExcessPayment': savePaymentWithExcessPayment,
      'brainTreePaymentNonceDto': brainTreePaymentNonceDto,
      'customerOrderCard': customerOrderCard,
      'storePaymentConfigurationDto': storePaymentConfigurationDto,
      'dueBalance': dueBalance,
      'totalPaidAmount': totalPaidAmount,
      'totalOrderAmount': totalOrderAmount,
      'authorizeDotNetCustomerProfileId': authorizeDotNetCustomerProfileId,
      'authorizeDotNetCustomerPaymentProfileId':
          authorizeDotNetCustomerPaymentProfileId,
      'cashAmount': cashAmount,
      'checkAmount': checkAmount,
      'creditCardAmount': creditCardAmount,
      'orderIds': orderIds,
      'capturePaymentWithTransactionId': capturePaymentWithTransactionId,
      'notes': notes,
      'updatedByEmployeeName': updatedByEmployeeName
    };
  }

  static PaymentDtoList fromJson(Map<String, Object?> json) {
    return PaymentDtoList(
        id: json['id'] == null ? null : json['id'] as int,
        createdBy: json['createdBy'] as dynamic,
        insertedTimestamp: json['insertedTimestamp'] as dynamic,
        updatedBy: json['updatedBy'] as dynamic,
        updatedTimestamp: json['updatedTimestamp'] as dynamic,
        orderId: json['orderId'] as dynamic,
        customerId: json['customerId'] as dynamic,
        customerName: json['customerName'] as dynamic,
        company: json['company'] as dynamic,
        vendorId: json['vendorId'] as dynamic,
        purchaseOrderId: json['purchaseOrderId'] as dynamic,
        billId: json['billId'] as dynamic,
        paymentType: json['paymentType'] as dynamic,
        paymentTypeName: json['paymentTypeName'] as dynamic,
        paymentModeId:
            json['paymentModeId'] == null ? null : json['paymentModeId'] as int,
        paymentModeName: json['paymentModeName'] as dynamic,
        parentPaymentId: json['parentPaymentId'] as dynamic,
        excessPaymentParentId: json['excessPaymentParentId'] as dynamic,
        transactionId: json['transactionId'] as dynamic,
        authorizationTransactionId:
            json['authorizationTransactionId'] as dynamic,
        amount: json['amount'] == null ? null : json['amount'] as int,
        excessAmount:
            json['excessAmount'] == null ? null : json['excessAmount'] as int,
        status: json['status'] as dynamic,
        sendConfirmation: json['sendConfirmation'] == null
            ? null
            : json['sendConfirmation'] as bool,
        createdByEmployeeName: json['createdByEmployeeName'] as dynamic,
        savePaymentInBulk: json['savePaymentInBulk'] == null
            ? null
            : json['savePaymentInBulk'] as bool,
        savePaymentWithExcessPayment:
            json['savePaymentWithExcessPayment'] == null
                ? null
                : json['savePaymentWithExcessPayment'] as bool,
        brainTreePaymentNonceDto: json['brainTreePaymentNonceDto'] as dynamic,
        customerOrderCard: json['customerOrderCard'] as dynamic,
        storePaymentConfigurationDto:
            json['storePaymentConfigurationDto'] as dynamic,
        dueBalance:
            json['dueBalance'] == null ? null : json['dueBalance'] as int,
        totalPaidAmount: json['totalPaidAmount'] == null
            ? null
            : json['totalPaidAmount'] as int,
        totalOrderAmount: json['totalOrderAmount'] == null
            ? null
            : json['totalOrderAmount'] as int,
        authorizeDotNetCustomerProfileId:
            json['authorizeDotNetCustomerProfileId'] as dynamic,
        authorizeDotNetCustomerPaymentProfileId:
            json['authorizeDotNetCustomerPaymentProfileId'] as dynamic,
        cashAmount:
            json['cashAmount'] == null ? null : json['cashAmount'] as int,
        checkAmount:
            json['checkAmount'] == null ? null : json['checkAmount'] as int,
        creditCardAmount: json['creditCardAmount'] == null
            ? null
            : json['creditCardAmount'] as int,
        orderIds: json['orderIds'] as dynamic,
        capturePaymentWithTransactionId:
            json['capturePaymentWithTransactionId'] == null
                ? null
                : json['capturePaymentWithTransactionId'] as bool,
        notes: json['notes'] as dynamic,
        updatedByEmployeeName: json['updatedByEmployeeName'] as dynamic);
  }

  @override
  String toString() {
    return '''PaymentDtoList(
                id:$id,
createdBy:$createdBy,
insertedTimestamp:$insertedTimestamp,
updatedBy:$updatedBy,
updatedTimestamp:$updatedTimestamp,
orderId:$orderId,
customerId:$customerId,
customerName:$customerName,
company:$company,
vendorId:$vendorId,
purchaseOrderId:$purchaseOrderId,
billId:$billId,
paymentType:$paymentType,
paymentTypeName:$paymentTypeName,
paymentModeId:$paymentModeId,
paymentModeName:$paymentModeName,
parentPaymentId:$parentPaymentId,
excessPaymentParentId:$excessPaymentParentId,
transactionId:$transactionId,
authorizationTransactionId:$authorizationTransactionId,
amount:$amount,
excessAmount:$excessAmount,
status:$status,
sendConfirmation:$sendConfirmation,
createdByEmployeeName:$createdByEmployeeName,
savePaymentInBulk:$savePaymentInBulk,
savePaymentWithExcessPayment:$savePaymentWithExcessPayment,
brainTreePaymentNonceDto:$brainTreePaymentNonceDto,
customerOrderCard:$customerOrderCard,
storePaymentConfigurationDto:$storePaymentConfigurationDto,
dueBalance:$dueBalance,
totalPaidAmount:$totalPaidAmount,
totalOrderAmount:$totalOrderAmount,
authorizeDotNetCustomerProfileId:$authorizeDotNetCustomerProfileId,
authorizeDotNetCustomerPaymentProfileId:$authorizeDotNetCustomerPaymentProfileId,
cashAmount:$cashAmount,
checkAmount:$checkAmount,
creditCardAmount:$creditCardAmount,
orderIds:$orderIds,
capturePaymentWithTransactionId:$capturePaymentWithTransactionId,
notes:$notes,
updatedByEmployeeName:$updatedByEmployeeName
    ) ''';
  }

  @override
  bool operator ==(Object other) {
    return other is PaymentDtoList &&
        other.runtimeType == runtimeType &&
        other.id == id &&
        other.createdBy == createdBy &&
        other.insertedTimestamp == insertedTimestamp &&
        other.updatedBy == updatedBy &&
        other.updatedTimestamp == updatedTimestamp &&
        other.orderId == orderId &&
        other.customerId == customerId &&
        other.customerName == customerName &&
        other.company == company &&
        other.vendorId == vendorId &&
        other.purchaseOrderId == purchaseOrderId &&
        other.billId == billId &&
        other.paymentType == paymentType &&
        other.paymentTypeName == paymentTypeName &&
        other.paymentModeId == paymentModeId &&
        other.paymentModeName == paymentModeName &&
        other.parentPaymentId == parentPaymentId &&
        other.excessPaymentParentId == excessPaymentParentId &&
        other.transactionId == transactionId &&
        other.authorizationTransactionId == authorizationTransactionId &&
        other.amount == amount &&
        other.excessAmount == excessAmount &&
        other.status == status &&
        other.sendConfirmation == sendConfirmation &&
        other.createdByEmployeeName == createdByEmployeeName &&
        other.savePaymentInBulk == savePaymentInBulk &&
        other.savePaymentWithExcessPayment == savePaymentWithExcessPayment &&
        other.brainTreePaymentNonceDto == brainTreePaymentNonceDto &&
        other.customerOrderCard == customerOrderCard &&
        other.storePaymentConfigurationDto == storePaymentConfigurationDto &&
        other.dueBalance == dueBalance &&
        other.totalPaidAmount == totalPaidAmount &&
        other.totalOrderAmount == totalOrderAmount &&
        other.authorizeDotNetCustomerProfileId ==
            authorizeDotNetCustomerProfileId &&
        other.authorizeDotNetCustomerPaymentProfileId ==
            authorizeDotNetCustomerPaymentProfileId &&
        other.cashAmount == cashAmount &&
        other.checkAmount == checkAmount &&
        other.creditCardAmount == creditCardAmount &&
        other.orderIds == orderIds &&
        other.capturePaymentWithTransactionId ==
            capturePaymentWithTransactionId &&
        other.notes == notes &&
        other.updatedByEmployeeName == updatedByEmployeeName;
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
        orderId,
        customerId,
        customerName,
        company,
        vendorId,
        purchaseOrderId,
        billId,
        paymentType,
        paymentTypeName,
        paymentModeId,
        paymentModeName,
        parentPaymentId,
        excessPaymentParentId,
        transactionId);
  }
}

class OrderDto {
  final int? id;
  final dynamic createdBy;
  final String? insertedTimestamp;
  final dynamic updatedBy;
  final String? updatedTimestamp;
  final int? storeId;
  final dynamic storeName;
  final int? wareHouseId;
  final int? salesRepresentativeId;
  final int? customerId;
  final int? customerShippingAddressId;
  final int? customerBillingAddressId;
  final int? totalQuantity;
  final int? subTotal;
  final int? lineItemDiscount;
  final int? couponDiscount;
  final int? orderDiscount;
  final dynamic orderDiscountType;
  final int? shippingAmount;
  final int? taxAmount;
  final int? totalAmount;
  final int? dueAmount;
  final double? previousDueBalance;
  final dynamic totalDueAmount;
  final String? internalNotes;
  final String? customerNotes;
  final String? orderNotes;
  final String? status;
  final int? paymentTermsId;
  final dynamic paymentTermsName;
  final dynamic shipTimestamp;
  final dynamic invoiceTimestamp;
  final dynamic returnOrderId;
  final int? freightCharge;
  final int? hazmatCharge;
  final dynamic repairOrderId;
  final String? dueDate;
  final int? preferredShippingModeId;
  final int? preferredPaymentModeId;
  final int? createdByCustomer;
  final dynamic quotationId;
  final dynamic parentOrderId;
  final dynamic adjustmentId;
  final int? adjustmentValue;
  final dynamic adjustmentName;
  final dynamic orderFulfillmentId;
  final dynamic saleRepresentativeName;
  final dynamic preferredShippingModeName;
  final dynamic preferredPaymentModeName;
  final dynamic createdByName;
  final dynamic createdByCustomerName;
  final int? grossMargin;
  final int? grossMarginPercentage;
  final int? totalCostPrice;
  final dynamic totalML;
  final dynamic totalTaxableML;
  final dynamic orderFulfilledBy;
  final dynamic orderFulfilledByName;
  final dynamic storeInvoiceConfigurationDto;
  const OrderDto(
      {this.id,
      this.createdBy,
      this.insertedTimestamp,
      this.updatedBy,
      this.updatedTimestamp,
      this.storeId,
      this.storeName,
      this.wareHouseId,
      this.salesRepresentativeId,
      this.customerId,
      this.customerShippingAddressId,
      this.customerBillingAddressId,
      this.totalQuantity,
      this.subTotal,
      this.lineItemDiscount,
      this.couponDiscount,
      this.orderDiscount,
      this.orderDiscountType,
      this.shippingAmount,
      this.taxAmount,
      this.totalAmount,
      this.dueAmount,
      this.previousDueBalance,
      this.totalDueAmount,
      this.internalNotes,
      this.customerNotes,
      this.orderNotes,
      this.status,
      this.paymentTermsId,
      this.paymentTermsName,
      this.shipTimestamp,
      this.invoiceTimestamp,
      this.returnOrderId,
      this.freightCharge,
      this.hazmatCharge,
      this.repairOrderId,
      this.dueDate,
      this.preferredShippingModeId,
      this.preferredPaymentModeId,
      this.createdByCustomer,
      this.quotationId,
      this.parentOrderId,
      this.adjustmentId,
      this.adjustmentValue,
      this.adjustmentName,
      this.orderFulfillmentId,
      this.saleRepresentativeName,
      this.preferredShippingModeName,
      this.preferredPaymentModeName,
      this.createdByName,
      this.createdByCustomerName,
      this.grossMargin,
      this.grossMarginPercentage,
      this.totalCostPrice,
      this.totalML,
      this.totalTaxableML,
      this.orderFulfilledBy,
      this.orderFulfilledByName,
      this.storeInvoiceConfigurationDto});
  OrderDto copyWith(
      {int? id,
      dynamic createdBy,
      String? insertedTimestamp,
      dynamic updatedBy,
      String? updatedTimestamp,
      int? storeId,
      dynamic storeName,
      int? wareHouseId,
      int? salesRepresentativeId,
      int? customerId,
      int? customerShippingAddressId,
      int? customerBillingAddressId,
      int? totalQuantity,
      int? subTotal,
      int? lineItemDiscount,
      int? couponDiscount,
      int? orderDiscount,
      dynamic orderDiscountType,
      int? shippingAmount,
      int? taxAmount,
      int? totalAmount,
      int? dueAmount,
      double? previousDueBalance,
      dynamic totalDueAmount,
      String? internalNotes,
      String? customerNotes,
      String? orderNotes,
      String? status,
      int? paymentTermsId,
      dynamic paymentTermsName,
      dynamic shipTimestamp,
      dynamic invoiceTimestamp,
      dynamic returnOrderId,
      int? freightCharge,
      int? hazmatCharge,
      dynamic repairOrderId,
      String? dueDate,
      int? preferredShippingModeId,
      int? preferredPaymentModeId,
      int? createdByCustomer,
      dynamic quotationId,
      dynamic parentOrderId,
      dynamic adjustmentId,
      int? adjustmentValue,
      dynamic adjustmentName,
      dynamic orderFulfillmentId,
      dynamic saleRepresentativeName,
      dynamic preferredShippingModeName,
      dynamic preferredPaymentModeName,
      dynamic createdByName,
      dynamic createdByCustomerName,
      int? grossMargin,
      int? grossMarginPercentage,
      int? totalCostPrice,
      dynamic totalML,
      dynamic totalTaxableML,
      dynamic orderFulfilledBy,
      dynamic orderFulfilledByName,
      dynamic storeInvoiceConfigurationDto}) {
    return OrderDto(
        id: id ?? this.id,
        createdBy: createdBy ?? this.createdBy,
        insertedTimestamp: insertedTimestamp ?? this.insertedTimestamp,
        updatedBy: updatedBy ?? this.updatedBy,
        updatedTimestamp: updatedTimestamp ?? this.updatedTimestamp,
        storeId: storeId ?? this.storeId,
        storeName: storeName ?? this.storeName,
        wareHouseId: wareHouseId ?? this.wareHouseId,
        salesRepresentativeId:
            salesRepresentativeId ?? this.salesRepresentativeId,
        customerId: customerId ?? this.customerId,
        customerShippingAddressId:
            customerShippingAddressId ?? this.customerShippingAddressId,
        customerBillingAddressId:
            customerBillingAddressId ?? this.customerBillingAddressId,
        totalQuantity: totalQuantity ?? this.totalQuantity,
        subTotal: subTotal ?? this.subTotal,
        lineItemDiscount: lineItemDiscount ?? this.lineItemDiscount,
        couponDiscount: couponDiscount ?? this.couponDiscount,
        orderDiscount: orderDiscount ?? this.orderDiscount,
        orderDiscountType: orderDiscountType ?? this.orderDiscountType,
        shippingAmount: shippingAmount ?? this.shippingAmount,
        taxAmount: taxAmount ?? this.taxAmount,
        totalAmount: totalAmount ?? this.totalAmount,
        dueAmount: dueAmount ?? this.dueAmount,
        previousDueBalance: previousDueBalance ?? this.previousDueBalance,
        totalDueAmount: totalDueAmount ?? this.totalDueAmount,
        internalNotes: internalNotes ?? this.internalNotes,
        customerNotes: customerNotes ?? this.customerNotes,
        orderNotes: orderNotes ?? this.orderNotes,
        status: status ?? this.status,
        paymentTermsId: paymentTermsId ?? this.paymentTermsId,
        paymentTermsName: paymentTermsName ?? this.paymentTermsName,
        shipTimestamp: shipTimestamp ?? this.shipTimestamp,
        invoiceTimestamp: invoiceTimestamp ?? this.invoiceTimestamp,
        returnOrderId: returnOrderId ?? this.returnOrderId,
        freightCharge: freightCharge ?? this.freightCharge,
        hazmatCharge: hazmatCharge ?? this.hazmatCharge,
        repairOrderId: repairOrderId ?? this.repairOrderId,
        dueDate: dueDate ?? this.dueDate,
        preferredShippingModeId:
            preferredShippingModeId ?? this.preferredShippingModeId,
        preferredPaymentModeId:
            preferredPaymentModeId ?? this.preferredPaymentModeId,
        createdByCustomer: createdByCustomer ?? this.createdByCustomer,
        quotationId: quotationId ?? this.quotationId,
        parentOrderId: parentOrderId ?? this.parentOrderId,
        adjustmentId: adjustmentId ?? this.adjustmentId,
        adjustmentValue: adjustmentValue ?? this.adjustmentValue,
        adjustmentName: adjustmentName ?? this.adjustmentName,
        orderFulfillmentId: orderFulfillmentId ?? this.orderFulfillmentId,
        saleRepresentativeName:
            saleRepresentativeName ?? this.saleRepresentativeName,
        preferredShippingModeName:
            preferredShippingModeName ?? this.preferredShippingModeName,
        preferredPaymentModeName:
            preferredPaymentModeName ?? this.preferredPaymentModeName,
        createdByName: createdByName ?? this.createdByName,
        createdByCustomerName:
            createdByCustomerName ?? this.createdByCustomerName,
        grossMargin: grossMargin ?? this.grossMargin,
        grossMarginPercentage:
            grossMarginPercentage ?? this.grossMarginPercentage,
        totalCostPrice: totalCostPrice ?? this.totalCostPrice,
        totalML: totalML ?? this.totalML,
        totalTaxableML: totalTaxableML ?? this.totalTaxableML,
        orderFulfilledBy: orderFulfilledBy ?? this.orderFulfilledBy,
        orderFulfilledByName: orderFulfilledByName ?? this.orderFulfilledByName,
        storeInvoiceConfigurationDto:
            storeInvoiceConfigurationDto ?? this.storeInvoiceConfigurationDto);
  }

  Map<String, Object?> toJson() {
    return {
      'id': id,
      'createdBy': createdBy,
      'insertedTimestamp': insertedTimestamp,
      'updatedBy': updatedBy,
      'updatedTimestamp': updatedTimestamp,
      'storeId': storeId,
      'storeName': storeName,
      'wareHouseId': wareHouseId,
      'salesRepresentativeId': salesRepresentativeId,
      'customerId': customerId,
      'customerShippingAddressId': customerShippingAddressId,
      'customerBillingAddressId': customerBillingAddressId,
      'totalQuantity': totalQuantity,
      'subTotal': subTotal,
      'lineItemDiscount': lineItemDiscount,
      'couponDiscount': couponDiscount,
      'orderDiscount': orderDiscount,
      'orderDiscountType': orderDiscountType,
      'shippingAmount': shippingAmount,
      'taxAmount': taxAmount,
      'totalAmount': totalAmount,
      'dueAmount': dueAmount,
      'previousDueBalance': previousDueBalance,
      'totalDueAmount': totalDueAmount,
      'internalNotes': internalNotes,
      'customerNotes': customerNotes,
      'orderNotes': orderNotes,
      'status': status,
      'paymentTermsId': paymentTermsId,
      'paymentTermsName': paymentTermsName,
      'shipTimestamp': shipTimestamp,
      'invoiceTimestamp': invoiceTimestamp,
      'returnOrderId': returnOrderId,
      'freightCharge': freightCharge,
      'hazmatCharge': hazmatCharge,
      'repairOrderId': repairOrderId,
      'dueDate': dueDate,
      'preferredShippingModeId': preferredShippingModeId,
      'preferredPaymentModeId': preferredPaymentModeId,
      'createdByCustomer': createdByCustomer,
      'quotationId': quotationId,
      'parentOrderId': parentOrderId,
      'adjustmentId': adjustmentId,
      'adjustmentValue': adjustmentValue,
      'adjustmentName': adjustmentName,
      'orderFulfillmentId': orderFulfillmentId,
      'saleRepresentativeName': saleRepresentativeName,
      'preferredShippingModeName': preferredShippingModeName,
      'preferredPaymentModeName': preferredPaymentModeName,
      'createdByName': createdByName,
      'createdByCustomerName': createdByCustomerName,
      'grossMargin': grossMargin,
      'grossMarginPercentage': grossMarginPercentage,
      'totalCostPrice': totalCostPrice,
      'totalML': totalML,
      'totalTaxableML': totalTaxableML,
      'orderFulfilledBy': orderFulfilledBy,
      'orderFulfilledByName': orderFulfilledByName,
      'storeInvoiceConfigurationDto': storeInvoiceConfigurationDto
    };
  }

  static OrderDto fromJson(Map<String, Object?> json) {
    return OrderDto(
        id: json['id'] == null ? null : json['id'] as int,
        createdBy: json['createdBy'] as dynamic,
        insertedTimestamp: json['insertedTimestamp'] == null
            ? null
            : json['insertedTimestamp'] as String,
        updatedBy: json['updatedBy'] as dynamic,
        updatedTimestamp: json['updatedTimestamp'] == null
            ? null
            : json['updatedTimestamp'] as String,
        storeId: json['storeId'] == null ? null : json['storeId'] as int,
        storeName: json['storeName'] as dynamic,
        wareHouseId:
            json['wareHouseId'] == null ? null : json['wareHouseId'] as int,
        salesRepresentativeId: json['salesRepresentativeId'] == null
            ? null
            : json['salesRepresentativeId'] as int,
        customerId:
            json['customerId'] == null ? null : json['customerId'] as int,
        customerShippingAddressId: json['customerShippingAddressId'] == null
            ? null
            : json['customerShippingAddressId'] as int,
        customerBillingAddressId: json['customerBillingAddressId'] == null
            ? null
            : json['customerBillingAddressId'] as int,
        totalQuantity:
            json['totalQuantity'] == null ? null : json['totalQuantity'] as int,
        subTotal: json['subTotal'] == null ? null : json['subTotal'] as int,
        lineItemDiscount: json['lineItemDiscount'] == null
            ? null
            : json['lineItemDiscount'] as int,
        couponDiscount: json['couponDiscount'] == null
            ? null
            : json['couponDiscount'] as int,
        orderDiscount:
            json['orderDiscount'] == null ? null : json['orderDiscount'] as int,
        orderDiscountType: json['orderDiscountType'] as dynamic,
        shippingAmount: json['shippingAmount'] == null
            ? null
            : json['shippingAmount'] as int,
        taxAmount: json['taxAmount'] == null ? null : json['taxAmount'] as int,
        totalAmount:
            json['totalAmount'] == null ? null : json['totalAmount'] as int,
        dueAmount: json['dueAmount'] == null ? null : json['dueAmount'] as int,
        previousDueBalance: json['previousDueBalance'] == null
            ? null
            : json['previousDueBalance'] as double,
        totalDueAmount: json['totalDueAmount'] as dynamic,
        internalNotes: json['internalNotes'] == null
            ? null
            : json['internalNotes'] as String,
        customerNotes: json['customerNotes'] == null
            ? null
            : json['customerNotes'] as String,
        orderNotes:
            json['orderNotes'] == null ? null : json['orderNotes'] as String,
        status: json['status'] == null ? null : json['status'] as String,
        paymentTermsId: json['paymentTermsId'] == null
            ? null
            : json['paymentTermsId'] as int,
        paymentTermsName: json['paymentTermsName'] as dynamic,
        shipTimestamp: json['shipTimestamp'] as dynamic,
        invoiceTimestamp: json['invoiceTimestamp'] as dynamic,
        returnOrderId: json['returnOrderId'] as dynamic,
        freightCharge:
            json['freightCharge'] == null ? null : json['freightCharge'] as int,
        hazmatCharge:
            json['hazmatCharge'] == null ? null : json['hazmatCharge'] as int,
        repairOrderId: json['repairOrderId'] as dynamic,
        dueDate: json['dueDate'] == null ? null : json['dueDate'] as String,
        preferredShippingModeId: json['preferredShippingModeId'] == null
            ? null
            : json['preferredShippingModeId'] as int,
        preferredPaymentModeId: json['preferredPaymentModeId'] == null
            ? null
            : json['preferredPaymentModeId'] as int,
        createdByCustomer: json['createdByCustomer'] == null
            ? null
            : json['createdByCustomer'] as int,
        quotationId: json['quotationId'] as dynamic,
        parentOrderId: json['parentOrderId'] as dynamic,
        adjustmentId: json['adjustmentId'] as dynamic,
        adjustmentValue: json['adjustmentValue'] == null
            ? null
            : json['adjustmentValue'] as int,
        adjustmentName: json['adjustmentName'] as dynamic,
        orderFulfillmentId: json['orderFulfillmentId'] as dynamic,
        saleRepresentativeName: json['saleRepresentativeName'] as dynamic,
        preferredShippingModeName: json['preferredShippingModeName'] as dynamic,
        preferredPaymentModeName: json['preferredPaymentModeName'] as dynamic,
        createdByName: json['createdByName'] as dynamic,
        createdByCustomerName: json['createdByCustomerName'] as dynamic,
        grossMargin:
            json['grossMargin'] == null ? null : json['grossMargin'] as int,
        grossMarginPercentage: json['grossMarginPercentage'] == null
            ? null
            : json['grossMarginPercentage'] as int,
        totalCostPrice: json['totalCostPrice'] == null
            ? null
            : json['totalCostPrice'] as int,
        totalML: json['totalML'] as dynamic,
        totalTaxableML: json['totalTaxableML'] as dynamic,
        orderFulfilledBy: json['orderFulfilledBy'] as dynamic,
        orderFulfilledByName: json['orderFulfilledByName'] as dynamic,
        storeInvoiceConfigurationDto:
            json['storeInvoiceConfigurationDto'] as dynamic);
  }

  @override
  String toString() {
    return '''OrderDto(
                id:$id,
createdBy:$createdBy,
insertedTimestamp:$insertedTimestamp,
updatedBy:$updatedBy,
updatedTimestamp:$updatedTimestamp,
storeId:$storeId,
storeName:$storeName,
wareHouseId:$wareHouseId,
salesRepresentativeId:$salesRepresentativeId,
customerId:$customerId,
customerShippingAddressId:$customerShippingAddressId,
customerBillingAddressId:$customerBillingAddressId,
totalQuantity:$totalQuantity,
subTotal:$subTotal,
lineItemDiscount:$lineItemDiscount,
couponDiscount:$couponDiscount,
orderDiscount:$orderDiscount,
orderDiscountType:$orderDiscountType,
shippingAmount:$shippingAmount,
taxAmount:$taxAmount,
totalAmount:$totalAmount,
dueAmount:$dueAmount,
previousDueBalance:$previousDueBalance,
totalDueAmount:$totalDueAmount,
internalNotes:$internalNotes,
customerNotes:$customerNotes,
orderNotes:$orderNotes,
status:$status,
paymentTermsId:$paymentTermsId,
paymentTermsName:$paymentTermsName,
shipTimestamp:$shipTimestamp,
invoiceTimestamp:$invoiceTimestamp,
returnOrderId:$returnOrderId,
freightCharge:$freightCharge,
hazmatCharge:$hazmatCharge,
repairOrderId:$repairOrderId,
dueDate:$dueDate,
preferredShippingModeId:$preferredShippingModeId,
preferredPaymentModeId:$preferredPaymentModeId,
createdByCustomer:$createdByCustomer,
quotationId:$quotationId,
parentOrderId:$parentOrderId,
adjustmentId:$adjustmentId,
adjustmentValue:$adjustmentValue,
adjustmentName:$adjustmentName,
orderFulfillmentId:$orderFulfillmentId,
saleRepresentativeName:$saleRepresentativeName,
preferredShippingModeName:$preferredShippingModeName,
preferredPaymentModeName:$preferredPaymentModeName,
createdByName:$createdByName,
createdByCustomerName:$createdByCustomerName,
grossMargin:$grossMargin,
grossMarginPercentage:$grossMarginPercentage,
totalCostPrice:$totalCostPrice,
totalML:$totalML,
totalTaxableML:$totalTaxableML,
orderFulfilledBy:$orderFulfilledBy,
orderFulfilledByName:$orderFulfilledByName,
storeInvoiceConfigurationDto:$storeInvoiceConfigurationDto
    ) ''';
  }

  @override
  bool operator ==(Object other) {
    return other is OrderDto &&
        other.runtimeType == runtimeType &&
        other.id == id &&
        other.createdBy == createdBy &&
        other.insertedTimestamp == insertedTimestamp &&
        other.updatedBy == updatedBy &&
        other.updatedTimestamp == updatedTimestamp &&
        other.storeId == storeId &&
        other.storeName == storeName &&
        other.wareHouseId == wareHouseId &&
        other.salesRepresentativeId == salesRepresentativeId &&
        other.customerId == customerId &&
        other.customerShippingAddressId == customerShippingAddressId &&
        other.customerBillingAddressId == customerBillingAddressId &&
        other.totalQuantity == totalQuantity &&
        other.subTotal == subTotal &&
        other.lineItemDiscount == lineItemDiscount &&
        other.couponDiscount == couponDiscount &&
        other.orderDiscount == orderDiscount &&
        other.orderDiscountType == orderDiscountType &&
        other.shippingAmount == shippingAmount &&
        other.taxAmount == taxAmount &&
        other.totalAmount == totalAmount &&
        other.dueAmount == dueAmount &&
        other.previousDueBalance == previousDueBalance &&
        other.totalDueAmount == totalDueAmount &&
        other.internalNotes == internalNotes &&
        other.customerNotes == customerNotes &&
        other.orderNotes == orderNotes &&
        other.status == status &&
        other.paymentTermsId == paymentTermsId &&
        other.paymentTermsName == paymentTermsName &&
        other.shipTimestamp == shipTimestamp &&
        other.invoiceTimestamp == invoiceTimestamp &&
        other.returnOrderId == returnOrderId &&
        other.freightCharge == freightCharge &&
        other.hazmatCharge == hazmatCharge &&
        other.repairOrderId == repairOrderId &&
        other.dueDate == dueDate &&
        other.preferredShippingModeId == preferredShippingModeId &&
        other.preferredPaymentModeId == preferredPaymentModeId &&
        other.createdByCustomer == createdByCustomer &&
        other.quotationId == quotationId &&
        other.parentOrderId == parentOrderId &&
        other.adjustmentId == adjustmentId &&
        other.adjustmentValue == adjustmentValue &&
        other.adjustmentName == adjustmentName &&
        other.orderFulfillmentId == orderFulfillmentId &&
        other.saleRepresentativeName == saleRepresentativeName &&
        other.preferredShippingModeName == preferredShippingModeName &&
        other.preferredPaymentModeName == preferredPaymentModeName &&
        other.createdByName == createdByName &&
        other.createdByCustomerName == createdByCustomerName &&
        other.grossMargin == grossMargin &&
        other.grossMarginPercentage == grossMarginPercentage &&
        other.totalCostPrice == totalCostPrice &&
        other.totalML == totalML &&
        other.totalTaxableML == totalTaxableML &&
        other.orderFulfilledBy == orderFulfilledBy &&
        other.orderFulfilledByName == orderFulfilledByName &&
        other.storeInvoiceConfigurationDto == storeInvoiceConfigurationDto;
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
        storeId,
        storeName,
        wareHouseId,
        salesRepresentativeId,
        customerId,
        customerShippingAddressId,
        customerBillingAddressId,
        totalQuantity,
        subTotal,
        lineItemDiscount,
        couponDiscount,
        orderDiscount,
        orderDiscountType,
        shippingAmount);
  }
}
