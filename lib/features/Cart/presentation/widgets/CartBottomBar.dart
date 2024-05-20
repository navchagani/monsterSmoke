import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:monstersmoke/Decorations/Decorations.dart';
import 'package:monstersmoke/Functions/FunctionsProduct.dart';
import 'package:monstersmoke/core/blocs/CartBloc.dart';
import 'package:monstersmoke/features/Cart/presentation/bloc/cart_bloc.dart';

class CartBottomBar extends StatelessWidget {
  const CartBottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
      builder: (context, carttate) {
        return BlocBuilder<LocalCartBloc, LocalCartState>(
            builder: (context, state) {
          final length =
              FunctionMasterProductDetails.getMasterProductDetailsLength(
                  productList: state.listProduct);

          final newlength = length == 0
              ? carttate.updateCartModel?.cartLineItemDtoList?.length ?? 0
              : length;
          return Padding(
            padding: const EdgeInsets.all(0.0),
            child: SizedBox(
              height: 50,
              child: ListTile(
                tileColor: Theme.of(context).colorScheme.background,
                shape: Decorations.boxShape,
                // subtitle: Text(''),
                title: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.shopping_cart,
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
                    Decorations.width10,
                    Text(
                      'Your Cart : $newlength',
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.onBackground,
                          fontSize: 20),
                    )
                  ],
                ),
              ),
            ),
          );
        });
      },
    );
  }
}
