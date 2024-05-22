import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:monstersmoke/Decorations/Decorations.dart';
import 'package:monstersmoke/cartPage.dart';
import 'package:monstersmoke/core/inject.dart';
import 'package:monstersmoke/features/Cart/presentation/bloc/cart_bloc.dart';

class ReviewPage extends StatefulWidget {
  final Function(int index)? moveToNext;
  const ReviewPage({super.key, this.moveToNext});

  @override
  State<ReviewPage> createState() => _ReviewPageState();
}

class _ReviewPageState extends State<ReviewPage> {
  final cartBloc = getIt<CartBloc>();

  @override
  void initState() {
    cartBloc.add(GetCartEvent(storeId: 2.toString()));
    super.initState();
  }

  @override
  void dispose() {
    cartBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CartBloc, CartState>(
      bloc: cartBloc,
      listener: (context, cardState) {},
      builder: (context, cardState) {
        if (cardState is CartLoadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        if (cardState is CartLoadedState) {
          return ListView.separated(
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int index) {
              final model = cardState.updateCartModel?.cartLineItemDtoList!;

              if (model == null) {
                return const Center(
                  child: Text('Empty Cart'),
                );
              }

              final product = model[index];

              return CartTile(
                // isCart: true,
                isView: true,
                name: product.productName,
                quantity: product.quantity,
                image: product.imageUrl,
                price: product.standardPrice.toString(),
                availableQuantity: product.availableQuantity,
                subSku: product.sku,
                viewCartQuantity:
                    '${product.quantity}x${product.cartStandardPrice}',
                viewPriductTotal:
                    '${double.parse(product.quantity.toString()) * double.parse(product.cartStandardPrice.toString())}',
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return Decorations.height10;
            },
            itemCount:
                cardState.updateCartModel?.cartLineItemDtoList?.length ?? 0,
          );
        }
        return Container();
      },
    );
  }
}
