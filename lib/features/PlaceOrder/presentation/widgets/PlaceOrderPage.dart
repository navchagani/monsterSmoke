
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:monstersmoke/Decorations/Decorations.dart';
import 'package:monstersmoke/core/PDFs/PDFfunctions.dart';
import 'package:monstersmoke/core/blocs/CustomBlocs.dart';
import 'package:monstersmoke/core/inject.dart';
import 'package:monstersmoke/core/widgets/CustomButton.dart';
import 'package:monstersmoke/core/widgets/CustomDialog.dart';
import 'package:monstersmoke/core/widgets/CustomIniputField.dart';
import 'package:monstersmoke/core/widgets/CustomPDFViewer.dart';
import 'package:monstersmoke/features/Auth/data/models/CustomerModel.dart';
import 'package:monstersmoke/features/Cart/presentation/bloc/cart_bloc.dart';
import 'package:monstersmoke/features/GETAssets/data/models/PaymentsModel.dart';
import 'package:monstersmoke/features/GETAssets/data/models/ShippingAddressModel.dart';
import 'package:monstersmoke/features/PlaceOrder/data/models/placeOrderModel.dart';
import 'package:monstersmoke/features/PlaceOrder/presentation/bloc/placeorder_bloc.dart';
import 'package:monstersmoke/features/Products/data/models/updateCartModel.dart';
import 'package:monstersmoke/features/sharedPrefsApi.dart';

class PlaceOrderPage extends StatefulWidget {
  const PlaceOrderPage({super.key});

  @override
  State<PlaceOrderPage> createState() => _PlaceOrderPageState();
}

class _PlaceOrderPageState extends State<PlaceOrderPage> {
  final cartBloc = getIt<CartBloc>();
  final placeOrderBloc = getIt<PlaceorderBloc>();
  @override
  void initState() {
    cartBloc.add(GetCartEvent(storeId: 2.toString()));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: placeOrderBloc,
      child: BlocListener<PlaceorderBloc, PlaceorderState>(
        listener: (context, placeOrderState) {
          if (placeOrderState is PlaceOrderLoadingState) {
            CustomDialog(context: context, text: 'Getting Your Order Placed..')
                .showLoadingDialog();
          }

          if (placeOrderState is PlaceOrderCompletedState) {
            Navigator.of(context).pop();
            CustomDialog(context: context, text: 'Order Placed Successfully..')
                .showCompletedDialog();

            placeOrderBloc.add(GetCustomerOrderDetailsEvent(
                token: null,
                defaultStoreId: 2.toString(),
                storeIdList: '1,2',
                isEcommerce: true,
                orderNumber: placeOrderState.placeOrderResModel.orderDto?.id));
          }

          if (placeOrderState is OrderDetailsCompletedState) {
            moveToPdfViewer(pdfString: placeOrderState.pdf!);
          }

          if (placeOrderState is PlaceOrderErrorState) {
            Navigator.of(context).pop();

            CustomDialog(context: context, text: placeOrderState.error.message)
                .showErrorDialog();
          }
        },
        child: BlocProvider.value(
          value: cartBloc,
          child: BlocBuilder<CartBloc, CartState>(
            builder: (context, state) {
              if (state is CartLoadedState) {
                return BlocBuilder<CustomerCardBloc, CustomerOrderCard?>(
                  builder: (context, customerCardModel) {
                    return BlocBuilder<SelectedAddressBloc,
                        CustomerStoreAddressList?>(
                      builder: (context, selectedAddress) {
                        return BlocBuilder<SelectedShipmentBloc,
                            ShippingAddressModel?>(
                          builder: (context, selectedShipment) {
                            return BlocBuilder<SelectedPaymentBloc,
                                PaymentsModel?>(
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
                                                child:
                                                    Text('Shipping Charges')),
                                            Expanded(
                                                child: Text(
                                              '\$${selectedShipment?.amount.toString()}',
                                              textAlign: TextAlign.end,
                                              style: TextStyle(
                                                  color: Colors.green.shade600),
                                            )),
                                          ]),
                                          Row(children: [
                                            const Expanded(
                                                child: Text('Tax Charges')),
                                            Expanded(
                                                child: Text(
                                              '\$${0.0}',
                                              textAlign: TextAlign.end,
                                              style: TextStyle(
                                                  color: Colors.green.shade600),
                                            )),
                                          ]),
                                          Row(children: [
                                            const Expanded(
                                                child: Text('Grand Total')),
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
                                          selectedPayment: selectedPayment,
                                          card: customerCardModel),
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
                  },
                );
              }

              return Container();
            },
          ),
        ),
      ),
    );
  }

  moveToPdfViewer({required String pdfString}) async {
    final file = await MakePDF.saveTempPdf(pdfString);

    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
            builder: ((context) => PdfPreviewPage(pdf: file.path))),
        (route) => route.isFirst);
  }

  onPlaceOrder(
      {UpdateCartModel? cartList,
      CustomerStoreAddressList? selectedAddress,
      ShippingAddressModel? selectedShipment,
      PaymentsModel? selectedPayment,
      CustomerOrderCard? card}) async {
    OrderDto orderDto = OrderDto(
        customerBillingAddressId: selectedAddress?.id,
        paymentTermsId: 1,
        customerShippingAddressId: selectedShipment?.id,
        shippingAmount: selectedShipment?.amount?.toInt(),
        preferredPaymentMethodId: selectedPayment?.id,
        preferredPaymentModeId: selectedPayment?.id,
        preferredShippingModeId: selectedShipment?.id,
        primarySalesRepresentativeId: selectedShipment?.id,
        totalAmount: cartList?.cartSubTotal,
        totalQuantity: cartList?.totalCartQuantity,
        subTotal: cartList?.cartSubTotal,
        status: 'Pro Forma',
        storeId: 2,
        taxAmount: 0,
        adjustmentValue: 0,
        orderNotes: '',
        customerNotes: '',
        internalNotes: '');

    PaymentDtoList paymentDtoList = PaymentDtoList(
        paymentModeId: selectedPayment?.id,
        amount: cartList?.cartSubTotal,
        customerOrderCard: card);

    PlaceOrderModel placeOrderModel = PlaceOrderModel(
        discountCouponList: [],
        paymentDtoList: [paymentDtoList],
        orderDto: orderDto);

    final token = await SharedPrefsApi.instance.getFromShared(key: 'login');
    // log('$token');
    // log('${placeOrderModel.toJson()}');

    placeOrderBloc.add(PlaceOrderEvent(
        placeOrderModel: placeOrderModel,
        token: token.toString(),
        storeId: 2.toString()));
  }
}
