import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:monstersmoke/features/Cart/presentation/bloc/cart_bloc.dart';

class PlaceOrderPage extends StatelessWidget {
  const PlaceOrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cartBloc = BlocProvider.of<CartBloc>(context);
    return Column(
      children: [
        Material(
            borderRadius: BorderRadius.circular(10.0),
            child: BlocProvider.value(
              value: cartBloc,
              child: BlocBuilder<CartBloc, CartState>(
                builder: (context, state) {
                  if (state is CartLoadedState) {
                    return Column(children: [
                      Row(children: [
                        Expanded(
                            child: Text(
                                'Total Items (${state.updateCartModel?.totalCartQuantity})')),
                        Expanded(
                            child: Text(state.updateCartModel!.totalCartPrice
                                .toString())),
                      ])
                    ]);
                  }

                  return Container();
                },
              ),
            ))
      ],
    );
  }
}
