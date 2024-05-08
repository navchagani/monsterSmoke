import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:monstersmoke/cartPage.dart';
import 'package:monstersmoke/features/Cart/presentation/bloc/cart_bloc.dart';

class CartFloatButton extends StatelessWidget {
  const CartFloatButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(builder: (context, state) {
      final length =
          state.updateCartModel?.cartLineItemDtoList?.length ?? 0.toString();

      final isLoading = state is CartLoadingState;

      return FloatingActionButton(
        onPressed: () => onMovetoCart(context: context),
        isExtended: true,
        child: isLoading
            ? const Padding(
                padding: EdgeInsets.all(20.0),
                child: CircularProgressIndicator(
                  color: Colors.white,
                ),
              )
            : Text(
                length.toString(),
                style: TextStyle(
                    color: Theme.of(context).colorScheme.background,
                    fontSize: 20),
              ),
      );
    });
  }

  void onMovetoCart({required BuildContext context}) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: ((context) => const CartPage())));
  }
}
