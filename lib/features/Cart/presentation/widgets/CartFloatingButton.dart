import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:monstersmoke/Functions/FunctionsProduct.dart';
import 'package:monstersmoke/cartPage.dart';
import 'package:monstersmoke/const/Constants.dart';
import 'package:monstersmoke/core/blocs/CartBloc.dart';
import 'package:monstersmoke/features/Cart/presentation/bloc/cart_bloc.dart';
import 'package:monstersmoke/features/Products/data/models/ProductDetailsModel.dart';
import 'package:monstersmoke/features/Products/data/models/ProductModel.dart';

class CartFloatButton extends StatefulWidget {
  const CartFloatButton({super.key});

  @override
  State<CartFloatButton> createState() => _CartFloatButtonState();
}

class _CartFloatButtonState extends State<CartFloatButton> {
  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<LocalCartBloc>(context);
    final cartBloc = BlocProvider.of<CartBloc>(context);

    return BlocConsumer<CartBloc, CartState>(
        bloc: cartBloc,
        listener: (context, cardState) {
          if (cardState is CartLoadedState) {
            Navigator.of(context).push(MaterialPageRoute(
                builder: ((context) => CartPage(
                      model: cardState.updateCartModel!,
                    ))));

            LocalCartBloc localCartBloc = BlocProvider.of(context);
            localCartBloc.add(LocalCartClearProductEvent());
          }
        },
        builder: (context, cartState) {
          if (cartState is CartLoadingState) {
            return const FloatingActionButton(
                backgroundColor: Constants.monsterBlue,
                onPressed: null,
                child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: CircularProgressIndicator(
                    strokeWidth: 3.0,
                    color: Colors.white,
                  ),
                ));
          }

          // if (cartState is CartLoadedState) {
          //   return FloatingActionButton(
          //     backgroundColor: Constants.monsterBlue,
          //     onPressed: () =>
          //         onMovetoCart(context: context, list: cartState.updateCartModel.cartLineItemDtoList),
          //     child: length == 0
          //         ? const Icon(Icons.add_shopping_cart_outlined)
          //         : Text(
          //             '$length',
          //             style: TextStyle(
          //                 color: Theme.of(context).colorScheme.background,
          //                 fontSize: 20),
          //           ),
          //   );
          // }

          return BlocProvider.value(
            value: bloc,
            child: BlocBuilder<LocalCartBloc, LocalCartState>(
                bloc: bloc,
                builder: (context, state) {
                  final length = FunctionMasterProductDetails
                      .getMasterProductDetailsLength(
                          productList: state.listProduct);

                  if (state is LocalCartLoadingState) {
                    return const FloatingActionButton(
                        backgroundColor: Constants.monsterBlue,
                        onPressed: null,
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: CircularProgressIndicator(
                            strokeWidth: 3.0,
                            color: Colors.white,
                          ),
                        ));
                  }

                  if (state is LocalCartLoadedState) {
                    return FloatingActionButton(
                      backgroundColor: Constants.monsterBlue,
                      onPressed: () => onMovetoCart(
                          context: context, list: state.listProduct),
                      child: Text(
                        '$length',
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.background,
                            fontSize: 20),
                      ),
                    );
                  }

                  return const FloatingActionButton(
                      backgroundColor: Constants.monsterBlue,
                      onPressed: null,
                      child: Icon(Icons.add_shopping_cart_outlined));
                }),
          );
        });
  }

  void onMovetoCart(
      {required BuildContext context,
      required List<MasterProductDetails> list}) {
    List<ProductModel> productList = list
        .map((e) => ProductModel(
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

    CartBloc cartBloc = BlocProvider.of<CartBloc>(context);
    cartBloc.add(AddToCartEvent(storeId: 2.toString(), list: productList));
  }
}
