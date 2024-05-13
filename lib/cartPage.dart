import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:monstersmoke/Decorations/Decorations.dart';
import 'package:monstersmoke/const/Constants.dart';
import 'package:monstersmoke/core/blocs/CartBloc.dart';
import 'package:monstersmoke/core/inject.dart';
import 'package:monstersmoke/features/Auth/presentation/bloc/CustomerBloc/customer_bloc_bloc.dart';
import 'package:monstersmoke/features/Auth/presentation/pages/AuthActionPage.dart';
import 'package:monstersmoke/features/Cart/presentation/bloc/cart_bloc.dart';
import 'package:monstersmoke/features/Products/data/models/updateCartModel.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  void initState() {
    // final cartBloc = BlocProvider.of<CartBloc>(context);
    // cartBloc.add(GetCartEvent(storeId: 2.toString()));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: body(context),
    );
  }

  AppBar appBar() => AppBar(
        title: const Text('Shopping Cart'),
      );

  Widget body(BuildContext context) {
    LocalCartBloc bloc = BlocProvider.of<LocalCartBloc>(context);
    final cartBloc = BlocProvider.of<CartBloc>(context);
    return BlocConsumer<CartBloc, CartState>(
      bloc: cartBloc,
      listener: (context, cardState) {},
      builder: (context, cardState) {
        if (cardState is CartLoadedState) {
          return Column(
            // alignment: Alignment.bottomCenter,
            children: [
              Expanded(
                child: Column(
                  children: [
                    Expanded(
                      child: ListView.separated(
                        shrinkWrap: true,
                        padding: const EdgeInsets.all(15.0),
                        itemBuilder: (BuildContext context, int index) {
                          final model =
                              cardState.updateCartModel?.cartLineItemDtoList!;

                          if (model == null) {
                            return const Center(
                              child: Text('Empty Cart'),
                            );
                          }

                          final product = model[index];

                          return CartTile(
                            isCart: true,
                            name: product.productName,
                            quantity: product.quantity,
                            image: product.imageUrl,
                            price: product.standardPrice.toString(),
                            availableQuantity: product.availableQuantity,
                            onIncrement: () {
                              cartBloc.add(UpdateCartEvent(
                                  storeId: 2.toString(), list: model));
                            },
                            onDecrement: () {
                              cartBloc.add(UpdateCartEvent(
                                  storeId: 2.toString(), list: model));
                            },
                            onRemove: () => onRemoveProduct(
                                context: context, list: [product]),
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return Decorations.height10;
                        },
                        itemCount: cardState
                                .updateCartModel?.cartLineItemDtoList?.length ??
                            0,
                      ),
                    ),
                  ],
                ),
              ),
              Builder(builder: (context) {
                final model = cardState.updateCartModel;
                return Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Material(
                    elevation: 15.0,
                    clipBehavior: Clip.hardEdge,
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.grey.shade100,
                    child: Wrap(
                      children: [
                        ListTile(
                          dense: true,
                          title: const Text('Total Cart Quantity'),
                          trailing: Text(
                            (model?.totalCartQuantity ?? 0.toString())
                                .toString(),
                            style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 16),
                          ),
                        ),
                        ListTile(
                          dense: true,
                          title: const Text('Cart SubTotal'),
                          trailing: Text(
                            '\$${model?.totalCartPrice ?? 0}',
                            style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 16),
                          ),
                        ),
                        ListTile(
                          dense: true,
                          title: const Text('Cart Discount'),
                          trailing: Text(
                            (model?.cartDiscount ?? 0).toString(),
                            style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 16),
                          ),
                        ),
                        ListTile(
                          tileColor: Colors.redAccent.shade700,
                          onTap: () {},
                          shape: RoundedRectangleBorder(
                              side:
                                  BorderSide(color: Colors.redAccent.shade700)),
                          dense: true,
                          title: Text(
                            '\$${model?.cartSubTotal ?? 0}',
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 16),
                          ),
                          trailing: const Text(
                            'CheckOut',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 16),
                          ),
                        )
                      ],
                    ),
                  ),
                );
              })
            ],
          );
        }
        return Container();
      },
    );
  }

  void onRemoveProduct(
      {required BuildContext context,
      required List<CartLineItemDtoList> list}) {
    CartBloc cartBloc = BlocProvider.of<CartBloc>(context);
    cartBloc.add(RemoveFromCartEvent(storeId: 2.toString(), list: list));
  }
}

class CartTile extends StatelessWidget {
  final String? name, subSku, price, image;
  final Function()? onIncrement, onDecrement, onRemove;
  final bool? isCart;
  final int? quantity, availableQuantity;
  const CartTile({
    super.key,
    this.name,
    this.price,
    this.image,
    this.quantity,
    this.subSku,
    this.onIncrement,
    this.onDecrement,
    this.isCart,
    this.availableQuantity,
    this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    final qty = availableQuantity ?? 0;
    final isInStock = qty >= 0 ? true : false;

    return BlocBuilder<CustomerBloc, CustomerBlocState>(
      builder: (context, customerState) {
        final isSignedIn = customerState.customerModel != null;

        return Material(
          elevation: 4.0,
          color: Colors.grey.shade100,
          shape: const RoundedRectangleBorder(
              side: BorderSide.none,
              borderRadius: BorderRadius.all(Radius.circular(10.0))),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                SizedBox(
                  width: 80,
                  height: 80,
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Image(
                      image: NetworkImage(image.toString()),
                      errorBuilder: ((context, error, stackTrace) {
                        return const Image(
                            image: NetworkImage(
                                'https://monstersmokeoutlet.com/asset/img/place-holder.png'));
                      }),
                    ),
                  ),
                ),
                Decorations.width10,
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Expanded(
                              child: Text(
                            name.toString(),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          )),
                        ],
                      ),
                      if (subSku != null)
                        Row(
                          children: [
                            Expanded(
                                child: Text(
                              subSku.toString(),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                  fontWeight: FontWeight.normal),
                            )),
                          ],
                        ),
                      Row(
                        children: [
                          Expanded(child: Text('price \$${price.toString()}')),
                        ],
                      ),
                      // Decorations.height10,
                      if (isCart == false)
                        SizedBox(
                          height: 40,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              isInStock
                                  ? Text(
                                      'In Stock: $availableQuantity',
                                      style: TextStyle(
                                          color: Colors.green.shade500),
                                    )
                                  : const Text(
                                      'Out of Stock',
                                      style:
                                          TextStyle(color: Colors.deepOrange),
                                    ),
                              const Spacer(),
                              if (isInStock)
                                Row(
                                  children: [
                                    IconButton(
                                        onPressed: isSignedIn
                                            ? onDecrement
                                            : () =>
                                                showAuthRequiredDialog(context),
                                        icon: const Icon(
                                          Icons.remove,
                                          size: 30,
                                        )),
                                    Text(quantity.toString()),
                                    IconButton(
                                        onPressed: isSignedIn
                                            ? onIncrement
                                            : () =>
                                                showAuthRequiredDialog(context),
                                        icon: const Icon(
                                          Icons.add,
                                          size: 27,
                                        )),
                                  ],
                                ),
                            ],
                          ),
                        ),
                      if (isCart ?? false)
                        SizedBox(
                          height: 40,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(
                                children: [
                                  IconButton(
                                    icon: const Icon(
                                      Icons.keyboard_arrow_up_rounded,
                                    ),
                                    onPressed: isSignedIn
                                        ? onIncrement
                                        : () => showAuthRequiredDialog(context),
                                    color: Colors.green.shade600,
                                  ),
                                  Text(quantity.toString()),
                                  IconButton(
                                      icon: const Icon(
                                          Icons.keyboard_arrow_down_rounded),
                                      onPressed: isSignedIn
                                          ? onDecrement
                                          : () =>
                                              showAuthRequiredDialog(context),
                                      color: Colors.deepOrange.shade600),
                                ],
                              ),
                              const Spacer(),
                              IconButton(
                                  onPressed: isSignedIn
                                      ? onRemove
                                      : () => showAuthRequiredDialog(context),
                                  icon: const Icon(
                                    Icons.close,
                                    size: 17,
                                    color: Constants.monsterBlue,
                                  ))
                            ],
                          ),
                        )
                    ],
                  ),
                )),

                // Expanded(
                //   child: Container(
                //     padding: const EdgeInsets.symmetric(horizontal: 15.0),
                //     // color: Colors.blue,
                //     width: 100,
                //     height: 100,
                //     child: Column(
                //       mainAxisAlignment: MainAxisAlignment.center,
                //       crossAxisAlignment: CrossAxisAlignment.center,
                //       children: [
                //         const Row(
                //           children: [
                //             Expanded(
                //                 child: Text(
                //               'Light Rise | TB 18K Disposables | 18000 Puffs | Nic 5% | Pack of 5 | Banana Cake',
                //               maxLines: 2,
                //               overflow: TextOverflow.ellipsis,
                //             ))
                //           ],
                //         ),
                //         Decorations.height5,
                //         const Row(
                //           children: [Expanded(child: Text('Stock: 299'))],
                //         )
                //       ],
                //     ),
                //   ),
                // ),
                // const SizedBox(
                //   // color: Colors.deepOrange,
                //   width: 100,
                //   height: 100,
                //   child: Center(
                //       child: Text(
                //     '\$3500',
                //     style: TextStyle(fontSize: 18),
                //   )),
                // ),
                // Container(
                //   padding: const EdgeInsets.symmetric(horizontal: 10.0),
                //   // color: Colors.deepPurple,
                //   width: 150,
                //   height: 100,
                //   child: Row(
                //     children: [
                //       IconButton(
                //           onPressed: onAddQuantity, icon: const Icon(Icons.add)),
                //       const Expanded(child: Center(child: Text('100'))),
                //       IconButton(
                //           onPressed: onRemoveQuantity, icon: const Icon(Icons.remove))
                //     ],
                //   ),
                // ),
                // SizedBox(
                //   // color: Colors.green,
                //   width: 70,
                //   height: 100,
                //   child: IconButton(
                //       color: Colors.deepOrange,
                //       onPressed: onRemoveProduct,
                //       icon: const Icon(Icons.delete)),
                // ),
              ],
            ),
          ),
        );
      },
    );
  }

  showAuthRequiredDialog(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const AuthActionPage()));
  }

  void onAddQuantity() {}

  void onRemoveQuantity() {}
}
