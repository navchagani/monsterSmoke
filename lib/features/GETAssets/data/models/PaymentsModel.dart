class PaymentsModel {
  final int? id;
  final int? createdBy;
  final String? insertedTimestamp;
  final dynamic updatedBy;
  final dynamic updatedTimestamp;
  final String? name;
  final dynamic description;
  final bool? ecommerce;
  final bool? rma;
  final bool? buyBack;
  final bool? realPayment;
  final bool? allowFutureDate;
  final dynamic paymentFor;
  final bool? eligibleForBatchDeposit;
  final int? sequenceNumber;
  const PaymentsModel(
      {this.id,
      this.createdBy,
      this.insertedTimestamp,
      this.updatedBy,
      this.updatedTimestamp,
      this.name,
      this.description,
      this.ecommerce,
      this.rma,
      this.buyBack,
      this.realPayment,
      this.allowFutureDate,
      this.paymentFor,
      this.eligibleForBatchDeposit,
      this.sequenceNumber});
  PaymentsModel copyWith(
      {int? id,
      int? createdBy,
      String? insertedTimestamp,
      dynamic? updatedBy,
      dynamic? updatedTimestamp,
      String? name,
      dynamic? description,
      bool? ecommerce,
      bool? rma,
      bool? buyBack,
      bool? realPayment,
      bool? allowFutureDate,
      dynamic? paymentFor,
      bool? eligibleForBatchDeposit,
      int? sequenceNumber}) {
    return PaymentsModel(
        id: id ?? this.id,
        createdBy: createdBy ?? this.createdBy,
        insertedTimestamp: insertedTimestamp ?? this.insertedTimestamp,
        updatedBy: updatedBy ?? this.updatedBy,
        updatedTimestamp: updatedTimestamp ?? this.updatedTimestamp,
        name: name ?? this.name,
        description: description ?? this.description,
        ecommerce: ecommerce ?? this.ecommerce,
        rma: rma ?? this.rma,
        buyBack: buyBack ?? this.buyBack,
        realPayment: realPayment ?? this.realPayment,
        allowFutureDate: allowFutureDate ?? this.allowFutureDate,
        paymentFor: paymentFor ?? this.paymentFor,
        eligibleForBatchDeposit:
            eligibleForBatchDeposit ?? this.eligibleForBatchDeposit,
        sequenceNumber: sequenceNumber ?? this.sequenceNumber);
  }

  Map<String, Object?> toJson() {
    return {
      'id': id,
      'createdBy': createdBy,
      'insertedTimestamp': insertedTimestamp,
      'updatedBy': updatedBy,
      'updatedTimestamp': updatedTimestamp,
      'name': name,
      'description': description,
      'ecommerce': ecommerce,
      'rma': rma,
      'buyBack': buyBack,
      'realPayment': realPayment,
      'allowFutureDate': allowFutureDate,
      'paymentFor': paymentFor,
      'eligibleForBatchDeposit': eligibleForBatchDeposit,
      'sequenceNumber': sequenceNumber
    };
  }

  static PaymentsModel fromJson(Map<String, Object?> json) {
    return PaymentsModel(
        id: json['id'] == null ? null : json['id'] as int,
        createdBy: json['createdBy'] == null ? null : json['createdBy'] as int,
        insertedTimestamp: json['insertedTimestamp'] == null
            ? null
            : json['insertedTimestamp'] as String,
        updatedBy: json['updatedBy'] as dynamic,
        updatedTimestamp: json['updatedTimestamp'] as dynamic,
        name: json['name'] == null ? null : json['name'] as String,
        description: json['description'] as dynamic,
        ecommerce: json['ecommerce'] == null ? null : json['ecommerce'] as bool,
        rma: json['rma'] == null ? null : json['rma'] as bool,
        buyBack: json['buyBack'] == null ? null : json['buyBack'] as bool,
        realPayment:
            json['realPayment'] == null ? null : json['realPayment'] as bool,
        allowFutureDate: json['allowFutureDate'] == null
            ? null
            : json['allowFutureDate'] as bool,
        paymentFor: json['paymentFor'] as dynamic,
        eligibleForBatchDeposit: json['eligibleForBatchDeposit'] == null
            ? null
            : json['eligibleForBatchDeposit'] as bool,
        sequenceNumber: json['sequenceNumber'] == null
            ? null
            : json['sequenceNumber'] as int);
  }

  @override
  String toString() {
    return '''PaymentsModel(
                id:$id,
createdBy:$createdBy,
insertedTimestamp:$insertedTimestamp,
updatedBy:$updatedBy,
updatedTimestamp:$updatedTimestamp,
name:$name,
description:$description,
ecommerce:$ecommerce,
rma:$rma,
buyBack:$buyBack,
realPayment:$realPayment,
allowFutureDate:$allowFutureDate,
paymentFor:$paymentFor,
eligibleForBatchDeposit:$eligibleForBatchDeposit,
sequenceNumber:$sequenceNumber
    ) ''';
  }

  @override
  bool operator ==(Object other) {
    return other is PaymentsModel &&
        other.runtimeType == runtimeType &&
        other.id == id &&
        other.createdBy == createdBy &&
        other.insertedTimestamp == insertedTimestamp &&
        other.updatedBy == updatedBy &&
        other.updatedTimestamp == updatedTimestamp &&
        other.name == name &&
        other.description == description &&
        other.ecommerce == ecommerce &&
        other.rma == rma &&
        other.buyBack == buyBack &&
        other.realPayment == realPayment &&
        other.allowFutureDate == allowFutureDate &&
        other.paymentFor == paymentFor &&
        other.eligibleForBatchDeposit == eligibleForBatchDeposit &&
        other.sequenceNumber == sequenceNumber;
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
        name,
        description,
        ecommerce,
        rma,
        buyBack,
        realPayment,
        allowFutureDate,
        paymentFor,
        eligibleForBatchDeposit,
        sequenceNumber);
  }
}
