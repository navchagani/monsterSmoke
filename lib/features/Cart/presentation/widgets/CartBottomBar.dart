import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:monstersmoke/Decorations/Decorations.dart';
import 'package:monstersmoke/const/Constants.dart';
import 'package:monstersmoke/core/blocs/CartBloc.dart';
import 'package:monstersmoke/features/Cart/presentation/bloc/cart_bloc.dart';

class CartBottomBar extends StatelessWidget {
  const CartBottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LocalCartBloc, LocalCartState>(
        builder: (context, state) {
      return BottomAppBar(
        height: 50,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.shopping_cart,
              color: Theme.of(context).colorScheme.onBackground,
            ),
            Decorations.width10,
            Text(
              'Your Cart',
              style: TextStyle(
                  color: Theme.of(context).colorScheme.onBackground,
                  fontSize: 20),
            )
          ],
        ),
      );
    });
  }
}
