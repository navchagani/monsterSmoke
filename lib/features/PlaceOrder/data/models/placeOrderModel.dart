class PlaceOrderModel {
  final List<dynamic>? discountCouponList;
  final OrderDto? orderDto;
  final List<PaymentDtoList>? paymentDtoList;
  const PlaceOrderModel(
      {this.discountCouponList, this.orderDto, this.paymentDtoList});
  PlaceOrderModel copyWith(
      {List<dynamic>? discountCouponList,
      OrderDto? orderDto,
      List<PaymentDtoList>? paymentDtoList}) {
    return PlaceOrderModel(
        discountCouponList: discountCouponList ?? this.discountCouponList,
        orderDto: orderDto ?? this.orderDto,
        paymentDtoList: paymentDtoList ?? this.paymentDtoList);
  }

  Map<String, Object?> toJson() {
    return {
      'discountCouponList': discountCouponList,
      'orderDto': orderDto?.toJson(),
      'paymentDtoList': paymentDtoList
          ?.map<Map<String, dynamic>>((data) => data.toJson())
          .toList()
    };
  }

  static PlaceOrderModel fromJson(Map<String, Object?> json) {
    return PlaceOrderModel(
        discountCouponList: json['discountCouponList'] == null
            ? null
            : json['discountCouponList'] as List<dynamic>,
        orderDto: json['orderDto'] == null
            ? null
            : OrderDto.fromJson(json['orderDto'] as Map<String, Object?>),
        paymentDtoList: json['paymentDtoList'] == null
            ? null
            : (json['paymentDtoList'] as List)
                .map<PaymentDtoList>((data) =>
                    PaymentDtoList.fromJson(data as Map<String, Object?>))
                .toList());
  }

  @override
  String toString() {
    return '''PlaceOrderModel(
                discountCouponList:$discountCouponList,
orderDto:${orderDto.toString()},
paymentDtoList:${paymentDtoList.toString()}
    ) ''';
  }

  @override
  bool operator ==(Object other) {
    return other is PlaceOrderModel &&
        other.runtimeType == runtimeType &&
        other.discountCouponList == discountCouponList &&
        other.orderDto == orderDto &&
        other.paymentDtoList == paymentDtoList;
  }

  @override
  int get hashCode {
    return Object.hash(
        runtimeType, discountCouponList, orderDto, paymentDtoList);
  }
}

class PaymentDtoList {
  final double? amount;
  final int? paymentModeId;
  final CustomerOrderCard? customerOrderCard;
  const PaymentDtoList(
      {this.amount, this.paymentModeId, this.customerOrderCard});
  PaymentDtoList copyWith(
      {double? amount,
      int? paymentModeId,
      CustomerOrderCard? customerOrderCard}) {
    return PaymentDtoList(
        amount: amount ?? this.amount,
        paymentModeId: paymentModeId ?? this.paymentModeId,
        customerOrderCard: customerOrderCard ?? this.customerOrderCard);
  }

  Map<String, Object?> toJson() {
    return {
      'amount': amount,
      'paymentModeId': paymentModeId,
      'customerOrderCard': customerOrderCard?.toJson()
    };
  }

  static PaymentDtoList fromJson(Map<String, Object?> json) {
    return PaymentDtoList(
        amount: json['amount'] == null ? null : json['amount'] as double,
        paymentModeId:
            json['paymentModeId'] == null ? null : json['paymentModeId'] as int,
        customerOrderCard: json['customerOrderCard'] == null
            ? null
            : CustomerOrderCard.fromJson(
                json['customerOrderCard'] as Map<String, Object?>));
  }

  @override
  String toString() {
    return '''PaymentDtoList(
                amount:$amount,
paymentModeId:$paymentModeId,
customerOrderCard:${customerOrderCard.toString()}
    ) ''';
  }

  @override
  bool operator ==(Object other) {
    return other is PaymentDtoList &&
        other.runtimeType == runtimeType &&
        other.amount == amount &&
        other.paymentModeId == paymentModeId &&
        other.customerOrderCard == customerOrderCard;
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, amount, paymentModeId, customerOrderCard);
  }
}

class CustomerOrderCard {
  final String? firstName;
  final String? lastName;
  final String? cardNumber;
  final String? expirationMonth;
  final String? expirationYear;
  final String? cvv;
  final String? address;
  final String? city;
  final int? stateId;
  final String? zipcode;
  final int? countryId;
  const CustomerOrderCard(
      {this.firstName,
      this.lastName,
      this.cardNumber,
      this.expirationMonth,
      this.expirationYear,
      this.cvv,
      this.address,
      this.city,
      this.stateId,
      this.zipcode,
      this.countryId});
  CustomerOrderCard copyWith(
      {String? firstName,
      String? lastName,
      String? cardNumber,
      String? expirationMonth,
      String? expirationYear,
      String? cvv,
      String? address,
      String? city,
      int? stateId,
      String? zipcode,
      int? countryId}) {
    return CustomerOrderCard(
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        cardNumber: cardNumber ?? this.cardNumber,
        expirationMonth: expirationMonth ?? this.expirationMonth,
        expirationYear: expirationYear ?? this.expirationYear,
        cvv: cvv ?? this.cvv,
        address: address ?? this.address,
        city: city ?? this.city,
        stateId: stateId ?? this.stateId,
        zipcode: zipcode ?? this.zipcode,
        countryId: countryId ?? this.countryId);
  }

  Map<String, Object?> toJson() {
    return {
      'firstName': firstName,
      'lastName': lastName,
      'cardNumber': cardNumber,
      'expirationMonth': expirationMonth,
      'expirationYear': expirationYear,
      'cvv': cvv,
      'address': address,
      'city': city,
      'stateId': stateId,
      'zipcode': zipcode,
      'countryId': countryId
    };
  }

  static CustomerOrderCard fromJson(Map<String, Object?> json) {
    return CustomerOrderCard(
        firstName:
            json['firstName'] == null ? null : json['firstName'] as String,
        lastName: json['lastName'] == null ? null : json['lastName'] as String,
        cardNumber:
            json['cardNumber'] == null ? null : json['cardNumber'] as String,
        expirationMonth: json['expirationMonth'] == null
            ? null
            : json['expirationMonth'] as String,
        expirationYear: json['expirationYear'] == null
            ? null
            : json['expirationYear'] as String,
        cvv: json['cvv'] == null ? null : json['cvv'] as String,
        address: json['address'] == null ? null : json['address'] as String,
        city: json['city'] == null ? null : json['city'] as String,
        stateId: json['stateId'] == null ? null : json['stateId'] as int,
        zipcode: json['zipcode'] == null ? null : json['zipcode'] as String,
        countryId: json['countryId'] == null ? null : json['countryId'] as int);
  }

  @override
  String toString() {
    return '''CustomerOrderCard(
                firstName:$firstName,
lastName:$lastName,
cardNumber:$cardNumber,
expirationMonth:$expirationMonth,
expirationYear:$expirationYear,
cvv:$cvv,
address:$address,
city:$city,
stateId:$stateId,
zipcode:$zipcode,
countryId:$countryId
    ) ''';
  }

  @override
  bool operator ==(Object other) {
    return other is CustomerOrderCard &&
        other.runtimeType == runtimeType &&
        other.firstName == firstName &&
        other.lastName == lastName &&
        other.cardNumber == cardNumber &&
        other.expirationMonth == expirationMonth &&
        other.expirationYear == expirationYear &&
        other.cvv == cvv &&
        other.address == address &&
        other.city == city &&
        other.stateId == stateId &&
        other.zipcode == zipcode &&
        other.countryId == countryId;
  }

  @override
  int get hashCode {
    return Object.hash(
        runtimeType,
        firstName,
        lastName,
        cardNumber,
        expirationMonth,
        expirationYear,
        cvv,
        address,
        city,
        stateId,
        zipcode,
        countryId);
  }
}

class OrderDto {
  final int? customerBillingAddressId;
  final dynamic customerId;
  final String? customerNotes;
  final int? customerShippingAddressId;
  final int? discount;
  final String? internalNotes;
  final dynamic invoiceTimestamp;
  final int? paymentTermsId;
  final int? preferredPaymentMethodId;
  final int? preferredPaymentModeId;
  final int? preferredShippingModeId;
  final int? primarySalesRepresentativeId;
  final dynamic shipTimestamp;
  final String? orderNotes;
  final String? status;
  final int? storeId;
  final int? shippingAmount;
  final double? subTotal;
  final int? taxAmount;
  final double? totalAmount;
  final int? totalQuantity;
  final int? adjustmentValue;
  const OrderDto(
      {this.customerBillingAddressId,
      this.customerId,
      this.customerNotes,
      this.customerShippingAddressId,
      this.discount,
      this.internalNotes,
      this.invoiceTimestamp,
      this.paymentTermsId,
      this.preferredPaymentMethodId,
      this.preferredPaymentModeId,
      this.preferredShippingModeId,
      this.primarySalesRepresentativeId,
      this.shipTimestamp,
      this.orderNotes,
      this.status,
      this.storeId,
      this.shippingAmount,
      this.subTotal,
      this.taxAmount,
      this.totalAmount,
      this.totalQuantity,
      this.adjustmentValue});
  OrderDto copyWith(
      {int? customerBillingAddressId,
      dynamic customerId,
      String? customerNotes,
      int? customerShippingAddressId,
      int? discount,
      String? internalNotes,
      dynamic invoiceTimestamp,
      int? paymentTermsId,
      int? preferredPaymentMethodId,
      int? preferredPaymentModeId,
      int? preferredShippingModeId,
      int? primarySalesRepresentativeId,
      dynamic shipTimestamp,
      String? orderNotes,
      String? status,
      int? storeId,
      int? shippingAmount,
      double? subTotal,
      int? taxAmount,
      double? totalAmount,
      int? totalQuantity,
      int? adjustmentValue}) {
    return OrderDto(
        customerBillingAddressId:
            customerBillingAddressId ?? this.customerBillingAddressId,
        customerId: customerId ?? this.customerId,
        customerNotes: customerNotes ?? this.customerNotes,
        customerShippingAddressId:
            customerShippingAddressId ?? this.customerShippingAddressId,
        discount: discount ?? this.discount,
        internalNotes: internalNotes ?? this.internalNotes,
        invoiceTimestamp: invoiceTimestamp ?? this.invoiceTimestamp,
        paymentTermsId: paymentTermsId ?? this.paymentTermsId,
        preferredPaymentMethodId:
            preferredPaymentMethodId ?? this.preferredPaymentMethodId,
        preferredPaymentModeId:
            preferredPaymentModeId ?? this.preferredPaymentModeId,
        preferredShippingModeId:
            preferredShippingModeId ?? this.preferredShippingModeId,
        primarySalesRepresentativeId:
            primarySalesRepresentativeId ?? this.primarySalesRepresentativeId,
        shipTimestamp: shipTimestamp ?? this.shipTimestamp,
        orderNotes: orderNotes ?? this.orderNotes,
        status: status ?? this.status,
        storeId: storeId ?? this.storeId,
        shippingAmount: shippingAmount ?? this.shippingAmount,
        subTotal: subTotal ?? this.subTotal,
        taxAmount: taxAmount ?? this.taxAmount,
        totalAmount: totalAmount ?? this.totalAmount,
        totalQuantity: totalQuantity ?? this.totalQuantity,
        adjustmentValue: adjustmentValue ?? this.adjustmentValue);
  }

  Map<String, Object?> toJson() {
    return {
      'customerBillingAddressId': customerBillingAddressId,
      'customerId': customerId,
      'customerNotes': customerNotes,
      'customerShippingAddressId': customerShippingAddressId,
      'discount': discount,
      'internalNotes': internalNotes,
      'invoiceTimestamp': invoiceTimestamp,
      'paymentTermsId': paymentTermsId,
      'preferredPaymentMethodId': preferredPaymentMethodId,
      'preferredPaymentModeId': preferredPaymentModeId,
      'preferredShippingModeId': preferredShippingModeId,
      'primarySalesRepresentativeId': primarySalesRepresentativeId,
      'shipTimestamp': shipTimestamp,
      'orderNotes': orderNotes,
      'status': status,
      'storeId': storeId,
      'shippingAmount': shippingAmount,
      'subTotal': subTotal,
      'taxAmount': taxAmount,
      'totalAmount': totalAmount,
      'totalQuantity': totalQuantity,
      'adjustmentValue': adjustmentValue
    };
  }

  static OrderDto fromJson(Map<String, Object?> json) {
    return OrderDto(
        customerBillingAddressId: json['customerBillingAddressId'] == null
            ? null
            : json['customerBillingAddressId'] as int,
        customerId: json['customerId'] as dynamic,
        customerNotes: json['customerNotes'] == null
            ? null
            : json['customerNotes'] as String,
        customerShippingAddressId: json['customerShippingAddressId'] == null
            ? null
            : json['customerShippingAddressId'] as int,
        discount: json['discount'] == null ? null : json['discount'] as int,
        internalNotes: json['internalNotes'] == null
            ? null
            : json['internalNotes'] as String,
        invoiceTimestamp: json['invoiceTimestamp'] as dynamic,
        paymentTermsId: json['paymentTermsId'] == null
            ? null
            : json['paymentTermsId'] as int,
        preferredPaymentMethodId: json['preferredPaymentMethodId'] == null
            ? null
            : json['preferredPaymentMethodId'] as int,
        preferredPaymentModeId: json['preferredPaymentModeId'] == null
            ? null
            : json['preferredPaymentModeId'] as int,
        preferredShippingModeId: json['preferredShippingModeId'] == null
            ? null
            : json['preferredShippingModeId'] as int,
        primarySalesRepresentativeId:
            json['primarySalesRepresentativeId'] == null
                ? null
                : json['primarySalesRepresentativeId'] as int,
        shipTimestamp: json['shipTimestamp'] as dynamic,
        orderNotes:
            json['orderNotes'] == null ? null : json['orderNotes'] as String,
        status: json['status'] == null ? null : json['status'] as String,
        storeId: json['storeId'] == null ? null : json['storeId'] as int,
        shippingAmount: json['shippingAmount'] == null
            ? null
            : json['shippingAmount'] as int,
        subTotal: json['subTotal'] == null ? null : json['subTotal'] as double,
        taxAmount: json['taxAmount'] == null ? null : json['taxAmount'] as int,
        totalAmount:
            json['totalAmount'] == null ? null : json['totalAmount'] as double,
        totalQuantity:
            json['totalQuantity'] == null ? null : json['totalQuantity'] as int,
        adjustmentValue: json['adjustmentValue'] == null
            ? null
            : json['adjustmentValue'] as int);
  }

  @override
  String toString() {
    return '''OrderDto(
                customerBillingAddressId:$customerBillingAddressId,
customerId:$customerId,
customerNotes:$customerNotes,
customerShippingAddressId:$customerShippingAddressId,
discount:$discount,
internalNotes:$internalNotes,
invoiceTimestamp:$invoiceTimestamp,
paymentTermsId:$paymentTermsId,
preferredPaymentMethodId:$preferredPaymentMethodId,
preferredPaymentModeId:$preferredPaymentModeId,
preferredShippingModeId:$preferredShippingModeId,
primarySalesRepresentativeId:$primarySalesRepresentativeId,
shipTimestamp:$shipTimestamp,
orderNotes:$orderNotes,
status:$status,
storeId:$storeId,
shippingAmount:$shippingAmount,
subTotal:$subTotal,
taxAmount:$taxAmount,
totalAmount:$totalAmount,
totalQuantity:$totalQuantity,
adjustmentValue:$adjustmentValue
    ) ''';
  }

  @override
  bool operator ==(Object other) {
    return other is OrderDto &&
        other.runtimeType == runtimeType &&
        other.customerBillingAddressId == customerBillingAddressId &&
        other.customerId == customerId &&
        other.customerNotes == customerNotes &&
        other.customerShippingAddressId == customerShippingAddressId &&
        other.discount == discount &&
        other.internalNotes == internalNotes &&
        other.invoiceTimestamp == invoiceTimestamp &&
        other.paymentTermsId == paymentTermsId &&
        other.preferredPaymentMethodId == preferredPaymentMethodId &&
        other.preferredPaymentModeId == preferredPaymentModeId &&
        other.preferredShippingModeId == preferredShippingModeId &&
        other.primarySalesRepresentativeId == primarySalesRepresentativeId &&
        other.shipTimestamp == shipTimestamp &&
        other.orderNotes == orderNotes &&
        other.status == status &&
        other.storeId == storeId &&
        other.shippingAmount == shippingAmount &&
        other.subTotal == subTotal &&
        other.taxAmount == taxAmount &&
        other.totalAmount == totalAmount &&
        other.totalQuantity == totalQuantity &&
        other.adjustmentValue == adjustmentValue;
  }

  @override
  int get hashCode {
    return Object.hash(
        runtimeType,
        customerBillingAddressId,
        customerId,
        customerNotes,
        customerShippingAddressId,
        discount,
        internalNotes,
        invoiceTimestamp,
        paymentTermsId,
        preferredPaymentMethodId,
        preferredPaymentModeId,
        preferredShippingModeId,
        primarySalesRepresentativeId,
        shipTimestamp,
        orderNotes,
        status,
        storeId,
        shippingAmount,
        subTotal,
        taxAmount);
  }
}
