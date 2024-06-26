import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:monstersmoke/Functions/FunctionsProduct.dart';
import 'package:monstersmoke/cartPage.dart';
import 'package:monstersmoke/core/blocs/CartBloc.dart';
import 'package:monstersmoke/core/inject.dart';
import 'package:monstersmoke/features/Auth/presentation/pages/AuthActionPage.dart';
import 'package:monstersmoke/features/Cart/presentation/bloc/cart_bloc.dart';
import 'package:monstersmoke/features/Customer/presentation/bloc/GetCustomerBloc/customer_bloc_bloc.dart';
import 'package:monstersmoke/features/Products/data/models/ProductDetailsModel.dart';
import 'package:monstersmoke/features/Products/data/models/ProductModel.dart';

class CartFloatButton extends StatefulWidget {
  final bool? fromHome;
  const CartFloatButton({super.key, this.fromHome});

  @override
  State<CartFloatButton> createState() => _CartFloatButtonState();
}

class _CartFloatButtonState extends State<CartFloatButton> {
  final cartBloc = getIt<CartBloc>();

  @override
  void dispose() {
    cartBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<LocalCartBloc>(context);

    return BlocConsumer<CartBloc, CartState>(
        bloc: cartBloc,
        listener: (context, cardState) {
          if (cardState is CartLoadedState) {
            if (widget.fromHome ?? false) {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: ((context) => const CartPage())));
            } else {
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: ((context) => const CartPage())));
            }

            LocalCartBloc localCartBloc = BlocProvider.of(context);
            localCartBloc.add(LocalCartClearProductEvent());
            // cartBloc.add(CartInitialEvent());
          }
        },
        builder: (context, cartState) {
          if (cartState is CartLoadingState) {
            return FloatingActionButton(
                backgroundColor: Theme.of(context).colorScheme.primary,
                onPressed: null,
                child: const Padding(
                  padding: EdgeInsets.all(20.0),
                  child: CircularProgressIndicator(
                    strokeWidth: 5.0,
                    color: Colors.white,
                  ),
                ));
          }

          return BlocBuilder<CustomerBloc, CustomerBlocState>(
            builder: (context, customerState) {
              return BlocProvider.value(
                value: bloc,
                child: BlocBuilder<LocalCartBloc, LocalCartState>(
                    bloc: bloc,
                    builder: (context, state) {
                      final length = FunctionMasterProductDetails
                          .getMasterProductDetailsLength(
                              productList: state.listProduct);

                      if (state is LocalCartLoadingState) {
                        return FloatingActionButton(
                            backgroundColor:
                                Theme.of(context).colorScheme.primary,
                            onPressed: null,
                            child: const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: CircularProgressIndicator(
                                strokeWidth: 3.0,
                                color: Colors.white,
                              ),
                            ));
                      }

                      if (state is LocalCartLoadedState && length > 0) {
                        return FloatingActionButton(
                          backgroundColor:
                              Theme.of(context).colorScheme.primary,
                          onPressed: customerState.customerModel == null
                              ? () => navigateToAuthPage()
                              : () => onMovetoCart(
                                  context: context, list: state.listProduct),
                          child: const Icon(Icons.forward),
                        );
                      }

                      return FloatingActionButton(
                          backgroundColor:
                              Theme.of(context).colorScheme.primary,
                          onPressed: customerState.customerModel == null
                              ? () => navigateToAuthPage()
                              : () {
                                  cartBloc
                                      .add(GetCartEvent(storeId: 2.toString()));
                                },
                          child: const Icon(Icons.add_shopping_cart_outlined));
                    }),
              );
            },
          );
        });
  }

  void onMovetoCart(
      {required BuildContext context,
      required List<MasterProductDetails> list}) {
    List<Content> productList = list
        .map((e) => Content(
            availableQuantity: e.availableQuantity,
            eta: e.eta,
            imageUrl: e.imageUrl,
            maxQuantityToSale: e.maxQuantityToSale,
            minQuantityToSale: e.minQuantityToSale,
            productId: e.productId,
            productName: e.productName,
            quantityIncrement: e.quantityIncrement,
            standardPrice: e.standardPrice,
            standardPriceWithoutDiscount: e.standardPriceWithoutDiscount,
            tagImageDtoList: e.tagImageDtoList,
            upc: e.upc,
            quantity: e.quantity))
        .toList();

    cartBloc.add(AddToCartEvent(storeId: 2.toString(), list: productList));
  }

  navigateToAuthPage() {
    Navigator.of(context).push(
        MaterialPageRoute(builder: ((context) => const AuthActionPage())));
  }
}
