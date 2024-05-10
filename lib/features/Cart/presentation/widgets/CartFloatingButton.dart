import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:monstersmoke/cartPage.dart';
import 'package:monstersmoke/const/Constants.dart';
import 'package:monstersmoke/features/Cart/presentation/bloc/cart_bloc.dart';
import 'package:monstersmoke/features/Products/data/models/updateCartModel.dart';

class CartFloatButton extends StatelessWidget {
  const CartFloatButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(builder: (context, state) {
      if (state is CartLoadingState) {
        return const FloatingActionButton(
            backgroundColor: Constants.monsterBlue,
            onPressed: null,
            isExtended: true,
            child: Padding(
              padding: EdgeInsets.all(20.0),
              child: CircularProgressIndicator(
                color: Colors.white,
              ),
            ));
      }

      if (state is CartLoadedState) {
        final length = state.updateCartModel?.totalCartQuantity ?? 0;
        return FloatingActionButton(
          backgroundColor: Constants.monsterBlue,
          onPressed: () =>
              onMovetoCart(context: context, model: state.updateCartModel!),
          isExtended: true,
          child: Text(
            length.toString(),
            style: TextStyle(
                color: Theme.of(context).colorScheme.background, fontSize: 20),
          ),
        );
      }

      return FloatingActionButton(
        backgroundColor: Constants.monsterBlue,
        onPressed: null,
        isExtended: true,
        child: Text(
          '0',
          style: TextStyle(
              color: Theme.of(context).colorScheme.background, fontSize: 20),
        ),
      );
    });
  }

  void onMovetoCart(
      {required BuildContext context, required UpdateCartModel model}) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: ((context) => CartPage(
              model: model,
            ))));
  }
}
