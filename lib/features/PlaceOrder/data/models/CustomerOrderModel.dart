class CustomerOrderModel {
  final int? orderId;
  final int? totalQuantity;
  final int? discount;
  final double? totalAmount;
  final double? dueBalance;
  final String? status;
  final dynamic customerName;
  final String? companyName;
  final String? storeName;
  final dynamic trackingNumber;
  final String? trackingNumberUrl;
  final String? insertedTimestamp;
  const CustomerOrderModel(
      {this.orderId,
      this.totalQuantity,
      this.discount,
      this.totalAmount,
      this.dueBalance,
      this.status,
      this.customerName,
      this.companyName,
      this.storeName,
      this.trackingNumber,
      this.trackingNumberUrl,
      this.insertedTimestamp});
  CustomerOrderModel copyWith(
      {int? orderId,
      int? totalQuantity,
      int? discount,
      double? totalAmount,
      double? dueBalance,
      String? status,
      dynamic customerName,
      String? companyName,
      String? storeName,
      dynamic trackingNumber,
      String? trackingNumberUrl,
      String? insertedTimestamp}) {
    return CustomerOrderModel(
        orderId: orderId ?? this.orderId,
        totalQuantity: totalQuantity ?? this.totalQuantity,
        discount: discount ?? this.discount,
        totalAmount: totalAmount ?? this.totalAmount,
        dueBalance: dueBalance ?? this.dueBalance,
        status: status ?? this.status,
        customerName: customerName ?? this.customerName,
        companyName: companyName ?? this.companyName,
        storeName: storeName ?? this.storeName,
        trackingNumber: trackingNumber ?? this.trackingNumber,
        trackingNumberUrl: trackingNumberUrl ?? this.trackingNumberUrl,
        insertedTimestamp: insertedTimestamp ?? this.insertedTimestamp);
  }

  Map<String, Object?> toJson() {
    return {
      'orderId': orderId,
      'totalQuantity': totalQuantity,
      'discount': discount,
      'totalAmount': totalAmount,
      'dueBalance': dueBalance,
      'status': status,
      'customerName': customerName,
      'companyName': companyName,
      'storeName': storeName,
      'trackingNumber': trackingNumber,
      'trackingNumberUrl': trackingNumberUrl,
      'insertedTimestamp': insertedTimestamp
    };
  }

  static CustomerOrderModel fromJson(Map<String, Object?> json) {
    return CustomerOrderModel(
        orderId: json['orderId'] == null ? null : json['orderId'] as int,
        totalQuantity:
            json['totalQuantity'] == null ? null : json['totalQuantity'] as int,
        discount: json['discount'] == null ? null : json['discount'] as int,
        totalAmount:
            json['totalAmount'] == null ? null : json['totalAmount'] as double,
        dueBalance:
            json['dueBalance'] == null ? null : json['dueBalance'] as double,
        status: json['status'] == null ? null : json['status'] as String,
        customerName: json['customerName'] as dynamic,
        companyName:
            json['companyName'] == null ? null : json['companyName'] as String,
        storeName:
            json['storeName'] == null ? null : json['storeName'] as String,
        trackingNumber: json['trackingNumber'] as dynamic,
        trackingNumberUrl: json['trackingNumberUrl'] == null
            ? null
            : json['trackingNumberUrl'] as String,
        insertedTimestamp: json['insertedTimestamp'] == null
            ? null
            : json['insertedTimestamp'] as String);
  }

  @override
  String toString() {
    return '''CustomerOrderModel(
                orderId:$orderId,
totalQuantity:$totalQuantity,
discount:$discount,
totalAmount:$totalAmount,
dueBalance:$dueBalance,
status:$status,
customerName:$customerName,
companyName:$companyName,
storeName:$storeName,
trackingNumber:$trackingNumber,
trackingNumberUrl:$trackingNumberUrl,
insertedTimestamp:$insertedTimestamp
    ) ''';
  }

  @override
  bool operator ==(Object other) {
    return other is CustomerOrderModel &&
        other.runtimeType == runtimeType &&
        other.orderId == orderId &&
        other.totalQuantity == totalQuantity &&
        other.discount == discount &&
        other.totalAmount == totalAmount &&
        other.dueBalance == dueBalance &&
        other.status == status &&
        other.customerName == customerName &&
        other.companyName == companyName &&
        other.storeName == storeName &&
        other.trackingNumber == trackingNumber &&
        other.trackingNumberUrl == trackingNumberUrl &&
        other.insertedTimestamp == insertedTimestamp;
  }

  @override
  int get hashCode {
    return Object.hash(
        runtimeType,
        orderId,
        totalQuantity,
        discount,
        totalAmount,
        dueBalance,
        status,
        customerName,
        companyName,
        storeName,
        trackingNumber,
        trackingNumberUrl,
        insertedTimestamp);
  }
}
