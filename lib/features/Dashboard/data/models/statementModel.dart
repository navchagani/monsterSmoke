class StatementModel {
  final CustomerStatementSummaryDto? customerStatementSummaryDto;
  final List<CustomerDetailedStatementReportDtoList>?
      customerDetailedStatementReportDtoList;
  const StatementModel(
      {this.customerStatementSummaryDto,
      this.customerDetailedStatementReportDtoList});
  StatementModel copyWith(
      {CustomerStatementSummaryDto? customerStatementSummaryDto,
      List<CustomerDetailedStatementReportDtoList>?
          customerDetailedStatementReportDtoList}) {
    return StatementModel(
        customerStatementSummaryDto:
            customerStatementSummaryDto ?? this.customerStatementSummaryDto,
        customerDetailedStatementReportDtoList:
            customerDetailedStatementReportDtoList ??
                this.customerDetailedStatementReportDtoList);
  }

  Map<String, Object?> toJson() {
    return {
      'customerStatementSummaryDto': customerStatementSummaryDto?.toJson(),
      'customerDetailedStatementReportDtoList':
          customerDetailedStatementReportDtoList
              ?.map<Map<String, dynamic>>((data) => data.toJson())
              .toList()
    };
  }

  static StatementModel fromJson(Map<String, Object?> json) {
    return StatementModel(
        customerStatementSummaryDto: json['customerStatementSummaryDto'] == null
            ? null
            : CustomerStatementSummaryDto.fromJson(
                json['customerStatementSummaryDto'] as Map<String, Object?>),
        customerDetailedStatementReportDtoList:
            json['customerDetailedStatementReportDtoList'] == null
                ? null
                : (json['customerDetailedStatementReportDtoList'] as List)
                    .map<CustomerDetailedStatementReportDtoList>((data) =>
                        CustomerDetailedStatementReportDtoList.fromJson(
                            data as Map<String, Object?>))
                    .toList());
  }

  @override
  String toString() {
    return '''StatementModel(
                customerStatementSummaryDto:${customerStatementSummaryDto.toString()},
customerDetailedStatementReportDtoList:${customerDetailedStatementReportDtoList.toString()}
    ) ''';
  }

  @override
  bool operator ==(Object other) {
    return other is StatementModel &&
        other.runtimeType == runtimeType &&
        other.customerStatementSummaryDto == customerStatementSummaryDto &&
        other.customerDetailedStatementReportDtoList ==
            customerDetailedStatementReportDtoList;
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, customerStatementSummaryDto,
        customerDetailedStatementReportDtoList);
  }
}

class CustomerDetailedStatementReportDtoList {
  final String? date;
  final String? id;
  final dynamic type;
  final String? description;
  final int? creditAmount;
  final int? debitAmount;
  final int? dueInvoiceAmount;
  final int? excessAmount;
  final int? balance;
  final dynamic transactionId;
  final dynamic notes;
  final dynamic vendorBillNo;
  final dynamic vendorInvoiceNumber;
  const CustomerDetailedStatementReportDtoList(
      {this.date,
      this.id,
      this.type,
      this.description,
      this.creditAmount,
      this.debitAmount,
      this.dueInvoiceAmount,
      this.excessAmount,
      this.balance,
      this.transactionId,
      this.notes,
      this.vendorBillNo,
      this.vendorInvoiceNumber});
  CustomerDetailedStatementReportDtoList copyWith(
      {String? date,
      String? id,
      dynamic type,
      String? description,
      int? creditAmount,
      int? debitAmount,
      int? dueInvoiceAmount,
      int? excessAmount,
      int? balance,
      dynamic transactionId,
      dynamic notes,
      dynamic vendorBillNo,
      dynamic vendorInvoiceNumber}) {
    return CustomerDetailedStatementReportDtoList(
        date: date ?? this.date,
        id: id ?? this.id,
        type: type ?? this.type,
        description: description ?? this.description,
        creditAmount: creditAmount ?? this.creditAmount,
        debitAmount: debitAmount ?? this.debitAmount,
        dueInvoiceAmount: dueInvoiceAmount ?? this.dueInvoiceAmount,
        excessAmount: excessAmount ?? this.excessAmount,
        balance: balance ?? this.balance,
        transactionId: transactionId ?? this.transactionId,
        notes: notes ?? this.notes,
        vendorBillNo: vendorBillNo ?? this.vendorBillNo,
        vendorInvoiceNumber: vendorInvoiceNumber ?? this.vendorInvoiceNumber);
  }

  Map<String, Object?> toJson() {
    return {
      'date': date,
      'id': id,
      'type': type,
      'description': description,
      'creditAmount': creditAmount,
      'debitAmount': debitAmount,
      'dueInvoiceAmount': dueInvoiceAmount,
      'excessAmount': excessAmount,
      'balance': balance,
      'transactionId': transactionId,
      'notes': notes,
      'vendorBillNo': vendorBillNo,
      'vendorInvoiceNumber': vendorInvoiceNumber
    };
  }

  static CustomerDetailedStatementReportDtoList fromJson(
      Map<String, Object?> json) {
    return CustomerDetailedStatementReportDtoList(
        date: json['date'] == null ? null : json['date'] as String,
        id: json['id'] == null ? null : json['id'] as String,
        type: json['type'] as dynamic,
        description:
            json['description'] == null ? null : json['description'] as String,
        creditAmount:
            json['creditAmount'] == null ? null : json['creditAmount'] as int,
        debitAmount:
            json['debitAmount'] == null ? null : json['debitAmount'] as int,
        dueInvoiceAmount: json['dueInvoiceAmount'] == null
            ? null
            : json['dueInvoiceAmount'] as int,
        excessAmount:
            json['excessAmount'] == null ? null : json['excessAmount'] as int,
        balance: json['balance'] == null ? null : json['balance'] as int,
        transactionId: json['transactionId'] as dynamic,
        notes: json['notes'] as dynamic,
        vendorBillNo: json['vendorBillNo'] as dynamic,
        vendorInvoiceNumber: json['vendorInvoiceNumber'] as dynamic);
  }

  @override
  String toString() {
    return '''CustomerDetailedStatementReportDtoList(
                date:$date,
id:$id,
type:$type,
description:$description,
creditAmount:$creditAmount,
debitAmount:$debitAmount,
dueInvoiceAmount:$dueInvoiceAmount,
excessAmount:$excessAmount,
balance:$balance,
transactionId:$transactionId,
notes:$notes,
vendorBillNo:$vendorBillNo,
vendorInvoiceNumber:$vendorInvoiceNumber
    ) ''';
  }

  @override
  bool operator ==(Object other) {
    return other is CustomerDetailedStatementReportDtoList &&
        other.runtimeType == runtimeType &&
        other.date == date &&
        other.id == id &&
        other.type == type &&
        other.description == description &&
        other.creditAmount == creditAmount &&
        other.debitAmount == debitAmount &&
        other.dueInvoiceAmount == dueInvoiceAmount &&
        other.excessAmount == excessAmount &&
        other.balance == balance &&
        other.transactionId == transactionId &&
        other.notes == notes &&
        other.vendorBillNo == vendorBillNo &&
        other.vendorInvoiceNumber == vendorInvoiceNumber;
  }

  @override
  int get hashCode {
    return Object.hash(
        runtimeType,
        date,
        id,
        type,
        description,
        creditAmount,
        debitAmount,
        dueInvoiceAmount,
        excessAmount,
        balance,
        transactionId,
        notes,
        vendorBillNo,
        vendorInvoiceNumber);
  }
}

class CustomerStatementSummaryDto {
  final int? openingBalance;
  final double? invoicedAmount;
  final int? amountReceived;
  final double? totalDueBalance;
  const CustomerStatementSummaryDto(
      {this.openingBalance,
      this.invoicedAmount,
      this.amountReceived,
      this.totalDueBalance});
  CustomerStatementSummaryDto copyWith(
      {int? openingBalance,
      double? invoicedAmount,
      int? amountReceived,
      double? totalDueBalance}) {
    return CustomerStatementSummaryDto(
        openingBalance: openingBalance ?? this.openingBalance,
        invoicedAmount: invoicedAmount ?? this.invoicedAmount,
        amountReceived: amountReceived ?? this.amountReceived,
        totalDueBalance: totalDueBalance ?? this.totalDueBalance);
  }

  Map<String, Object?> toJson() {
    return {
      'openingBalance': openingBalance,
      'invoicedAmount': invoicedAmount,
      'amountReceived': amountReceived,
      'totalDueBalance': totalDueBalance
    };
  }

  static CustomerStatementSummaryDto fromJson(Map<String, Object?> json) {
    return CustomerStatementSummaryDto(
        openingBalance: json['openingBalance'] == null
            ? null
            : json['openingBalance'] as int,
        invoicedAmount: json['invoicedAmount'] == null
            ? null
            : json['invoicedAmount'] as double,
        amountReceived: json['amountReceived'] == null
            ? null
            : json['amountReceived'] as int,
        totalDueBalance: json['totalDueBalance'] == null
            ? null
            : json['totalDueBalance'] as double);
  }

  @override
  String toString() {
    return '''CustomerStatementSummaryDto(
                openingBalance:$openingBalance,
invoicedAmount:$invoicedAmount,
amountReceived:$amountReceived,
totalDueBalance:$totalDueBalance
    ) ''';
  }

  @override
  bool operator ==(Object other) {
    return other is CustomerStatementSummaryDto &&
        other.runtimeType == runtimeType &&
        other.openingBalance == openingBalance &&
        other.invoicedAmount == invoicedAmount &&
        other.amountReceived == amountReceived &&
        other.totalDueBalance == totalDueBalance;
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, openingBalance, invoicedAmount,
        amountReceived, totalDueBalance);
  }
}
