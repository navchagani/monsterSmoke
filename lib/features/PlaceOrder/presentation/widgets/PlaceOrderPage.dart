import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:monstersmoke/Decorations/Decorations.dart';
import 'package:monstersmoke/core/blocs/CustomBlocs.dart';
import 'package:monstersmoke/core/inject.dart';
import 'package:monstersmoke/core/widgets/CustomButton.dart';
import 'package:monstersmoke/core/widgets/CustomIniputField.dart';
import 'package:monstersmoke/features/Auth/data/models/CustomerModel.dart';
import 'package:monstersmoke/features/Cart/presentation/bloc/cart_bloc.dart';
import 'package:monstersmoke/features/GETAssets/data/models/PaymentsModel.dart';
import 'package:monstersmoke/features/GETAssets/data/models/ShippingAddressModel.dart';
import 'package:monstersmoke/features/PlaceOrder/data/models/placeOrderModel.dart';
import 'package:monstersmoke/features/Products/data/models/updateCartModel.dart';

class PlaceOrderPage extends StatefulWidget {
  const PlaceOrderPage({super.key});

  @override
  State<PlaceOrderPage> createState() => _PlaceOrderPageState();
}

class _PlaceOrderPageState extends State<PlaceOrderPage> {
  final cartBloc = getIt<CartBloc>();
  @override
  void initState() {
    cartBloc.add(GetCartEvent(storeId: 2.toString()));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: cartBloc,
      child: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          if (state is CartLoadedState) {
            return BlocBuilder<SelectedAddressBloc, CustomerStoreAddressList?>(
              builder: (context, selectedAddress) {
                return BlocBuilder<SelectedShipmentBloc, ShippingAddressModel?>(
                  builder: (context, selectedShipment) {
                    return BlocBuilder<SelectedPaymentBloc, PaymentsModel?>(
                      builder: (context, selectedPayment) {
                        return Column(
                          children: [
                            Material(
                              borderRadius: BorderRadius.circular(10.0),
                              child: Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Column(children: [
                                  Row(children: [
                                    Expanded(
                                        child: Text(
                                            'Total Items (${state.updateCartModel?.totalCartQuantity})')),
                                    Expanded(
                                        child: Text(
                                      '\$${state.updateCartModel!.totalCartPrice.toString()}',
                                      textAlign: TextAlign.end,
                                      style: TextStyle(
                                          color: Colors.green.shade600),
                                    )),
                                  ]),
                                  Row(children: [
                                    const Expanded(
                                        child: Text('Shipping Charges')),
                                    Expanded(
                                        child: Text(
                                      '\$${state.updateCartModel!.totalCartPrice.toString()}',
                                      textAlign: TextAlign.end,
                                      style: TextStyle(
                                          color: Colors.green.shade600),
                                    )),
                                  ]),
                                  Row(children: [
                                    const Expanded(child: Text('Tax Charges')),
                                    Expanded(
                                        child: Text(
                                      '\$${state.updateCartModel!.totalCartPrice.toString()}',
                                      textAlign: TextAlign.end,
                                      style: TextStyle(
                                          color: Colors.green.shade600),
                                    )),
                                  ]),
                                  Row(children: [
                                    const Expanded(child: Text('Grand Total')),
                                    Expanded(
                                        child: Text(
                                      '\$${state.updateCartModel!.totalCartPrice.toString()}',
                                      textAlign: TextAlign.end,
                                      style: TextStyle(
                                          color: Colors.green.shade600),
                                    )),
                                  ]),
                                ]),
                              ),
                            ),
                            Decorations.height30,
                            const Row(
                              children: [
                                Text('Leave A Comment'),
                              ],
                            ),
                            Decorations.height15,
                            const CustomInputField(
                                labelText: 'Comment',
                                hintText: 'Leave A Comment'),
                            Decorations.height15,
                            CustomButton(
                              text: 'Place Order',
                              enabled: true,
                              onTap: () => onPlaceOrder(
                                  cartList: state.updateCartModel,
                                  selectedAddress: selectedAddress,
                                  selectedShipment: selectedShipment,
                                  selectedPayment: selectedPayment),
                              backgroundColor:
                                  Theme.of(context).colorScheme.primary,
                            )
                          ],
                        );
                      },
                    );
                  },
                );
              },
            );
          }

          return Container();
        },
      ),
    );
  }

  onPlaceOrder(
      {UpdateCartModel? cartList,
      CustomerStoreAddressList? selectedAddress,
      ShippingAddressModel? selectedShipment,
      PaymentsModel? selectedPayment}) {
    OrderDto orderDto = OrderDto(
      customerBillingAddressId: selectedAddress?.id,
      paymentTermsId: selectedPayment?.id,
      customerShippingAddressId: selectedShipment?.id,
      shippingAmount: selectedShipment?.amount?.toInt(),
      preferredPaymentMethodId: selectedPayment?.id,
      preferredPaymentModeId: selectedPayment?.id,
      preferredShippingModeId: selectedShipment?.id,
      totalAmount: cartList?.cartSubTotal,
      totalQuantity: cartList?.totalCartQuantity,
      subTotal: cartList?.cartSubTotal,
    );

    const PaymentDtoList paymentDtoList = PaymentDtoList();

    PlaceOrderModel placeOrderModel = PlaceOrderModel(
        discountCouponList: [],
        paymentDtoList: [paymentDtoList],
        orderDto: orderDto);
  }
}
