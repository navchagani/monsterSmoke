import 'package:monstersmoke/features/Products/data/models/ProductDetailsModel.dart';

class FunctionMasterProductDetails {
  static double applyDiscount(
      {required String selectedValue,
      required double discount,
      required double amount,
      bool? isReturnZero}) {
    // double price = double.parse(discount.toString());
    if (selectedValue == "Percentage") {
      double? discountedPrice = amount - (amount * (discount / 100));
      return discountedPrice;
    } else if (selectedValue == 'Fixed') {
      double? discountedPrice = amount - discount;
      return discountedPrice;
    } else {
      return isReturnZero ?? false ? 0.0 : amount;
    }
  }

  static int getMasterProductDetailsLength(
      {required List<MasterProductDetails> productList}) {
    List<int?> quantities = productList
        .map((product) => product.quantity == null
            ? 0
            : int.parse(product.quantity.toString()))
        .toList();

    final sum = quantities.fold(
        0, (previousValue, element) => previousValue + element!.toInt());

    return sum;
  }

  static double productstotal(
      {required List<MasterProductDetails> productList}) {
    final sum = double.parse(productList
        .map((product) {
          return product.standardPrice ??
              0.0 * double.parse(product.quantity.toString());
        })
        .toList()
        .fold(0.0, (previousValue, element) => previousValue + element)
        .toString());

    return sum;
  }

  // static double applyTax({required double total, required TaxModel taxModel}) {
  //   double taxRate = taxModel.amount == null
  //       ? 0.0
  //       : double.parse(taxModel.amount.toString()) / 100;

  //   double taxAmount = total * taxRate;
  //   double totalWithTax = total + taxAmount;

  //   return totalWithTax;
  // }

  // double calculateItemTotal(
  //     {required TotalDiscountModel? discountprice,
  //     required List<MasterProductDetails> listMasterProductDetails}) {
  //   double itemTotal = 0.0;

  //   itemTotal = FunctionMasterProductDetails.productstotal(
  //       productList: listMasterProductDetails);

  //   return FunctionMasterProductDetails.applyDiscount(
  //       selectedValue: discountprice!.type.toString(),
  //       discount: (discountprice.amount?.toDouble() ?? 0.0).toDouble(),
  //       amount: itemTotal);
  // }
}
