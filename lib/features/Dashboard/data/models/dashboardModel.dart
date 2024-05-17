class DashboardModel {
  final int? totalNumberOfOrders;
  final double? totalAmountSpend;
  final double? dueAmount;
  final int? storeCredit;
  final int? rmaCredit;
  final int? buyBackCredit;
  const DashboardModel(
      {this.totalNumberOfOrders,
      this.totalAmountSpend,
      this.dueAmount,
      this.storeCredit,
      this.rmaCredit,
      this.buyBackCredit});
  DashboardModel copyWith(
      {int? totalNumberOfOrders,
      double? totalAmountSpend,
      double? dueAmount,
      int? storeCredit,
      int? rmaCredit,
      int? buyBackCredit}) {
    return DashboardModel(
        totalNumberOfOrders: totalNumberOfOrders ?? this.totalNumberOfOrders,
        totalAmountSpend: totalAmountSpend ?? this.totalAmountSpend,
        dueAmount: dueAmount ?? this.dueAmount,
        storeCredit: storeCredit ?? this.storeCredit,
        rmaCredit: rmaCredit ?? this.rmaCredit,
        buyBackCredit: buyBackCredit ?? this.buyBackCredit);
  }

  Map<String, Object?> toJson() {
    return {
      'totalNumberOfOrders': totalNumberOfOrders,
      'totalAmountSpend': totalAmountSpend,
      'dueAmount': dueAmount,
      'storeCredit': storeCredit,
      'rmaCredit': rmaCredit,
      'buyBackCredit': buyBackCredit
    };
  }

  static DashboardModel fromJson(Map<String, Object?> json) {
    return DashboardModel(
        totalNumberOfOrders: json['totalNumberOfOrders'] == null
            ? null
            : json['totalNumberOfOrders'] as int,
        totalAmountSpend: json['totalAmountSpend'] == null
            ? null
            : json['totalAmountSpend'] as double,
        dueAmount:
            json['dueAmount'] == null ? null : json['dueAmount'] as double,
        storeCredit:
            json['storeCredit'] == null ? null : json['storeCredit'] as int,
        rmaCredit: json['rmaCredit'] == null ? null : json['rmaCredit'] as int,
        buyBackCredit: json['buyBackCredit'] == null
            ? null
            : json['buyBackCredit'] as int);
  }

  @override
  String toString() {
    return '''DashboardModel(
                totalNumberOfOrders:$totalNumberOfOrders,
totalAmountSpend:$totalAmountSpend,
dueAmount:$dueAmount,
storeCredit:$storeCredit,
rmaCredit:$rmaCredit,
buyBackCredit:$buyBackCredit
    ) ''';
  }

  @override
  bool operator ==(Object other) {
    return other is DashboardModel &&
        other.runtimeType == runtimeType &&
        other.totalNumberOfOrders == totalNumberOfOrders &&
        other.totalAmountSpend == totalAmountSpend &&
        other.dueAmount == dueAmount &&
        other.storeCredit == storeCredit &&
        other.rmaCredit == rmaCredit &&
        other.buyBackCredit == buyBackCredit;
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, totalNumberOfOrders, totalAmountSpend,
        dueAmount, storeCredit, rmaCredit, buyBackCredit);
  }
}
