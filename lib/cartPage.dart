import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:monstersmoke/Decorations/Decorations.dart';
import 'package:monstersmoke/const/Constants.dart';
import 'package:monstersmoke/core/inject.dart';
import 'package:monstersmoke/features/Auth/presentation/pages/AuthActionPage.dart';
import 'package:monstersmoke/features/Cart/presentation/bloc/cart_bloc.dart';
import 'package:monstersmoke/features/Customer/presentation/bloc/GetCustomerBloc/customer_bloc_bloc.dart';
import 'package:monstersmoke/features/PlaceOrder/presentation/pages/CheckOutPage.dart';
import 'package:monstersmoke/features/Products/data/models/updateCartModel.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final cartBloc = getIt<CartBloc>();
  @override
  void initState() {
    cartBloc.add(GetCartEvent(storeId: 2.toString()));
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
        backgroundColor: Colors.white,
        title: const Text('Shopping Cart'),
      );

  Widget body(BuildContext context) {
    return BlocConsumer<CartBloc, CartState>(
      bloc: cartBloc,
      listener: (context, cardState) {},
      builder: (context, cardState) {
        if (cardState is CartLoadingState) {
          return const Column(
            children: [
              Expanded(
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              )
            ],
          );
        }

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

                          return Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: CartTile(
                              isCart: true,
                              name: product.productName,
                              quantity: product.quantity,
                              image: product.imageUrl,
                              price: product.standardPrice.toString(),
                              availableQuantity: product.availableQuantity,
                              onIncrement: () {
                                setState(() {
                                  product.quantity = product.quantity! + 1;
                                });
                                cartBloc.add(UpdateCartEvent(
                                    storeId: 2.toString(), list: [product]));
                              },
                              onDecrement: () {
                                product.quantity = product.quantity! - 1;
                                if (product.quantity! > 0) {
                                  cartBloc.add(UpdateCartEvent(
                                      storeId: 2.toString(), list: [product]));
                                }
                              },
                              onRemove: () => onRemoveProduct(
                                  context: context, list: [product]),
                            ),
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
                return Container(
                  decoration: const BoxDecoration(
                      color: Color(0xff202b38),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(50),
                          topRight: Radius.circular(50))),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Wrap(
                      children: [
                        ListTile(
                          dense: true,
                          title: const Text('Total Cart Quantity',
                              style: TextStyle(
                                color: Colors.white,
                              )),
                          trailing: Text(
                            (model?.totalCartQuantity ?? 0.toString())
                                .toString(),
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 16),
                          ),
                        ),
                        ListTile(
                          dense: true,
                          title: const Text('Cart SubTotal',
                              style: TextStyle(
                                color: Colors.white,
                              )),
                          trailing: Text(
                            '\$${model?.totalCartPrice ?? 0}',
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 16),
                          ),
                        ),
                        ListTile(
                          dense: true,
                          title: const Text('Cart Discount',
                              style: TextStyle(
                                color: Colors.white,
                              )),
                          trailing: Text(
                            (model?.cartDiscount ?? 0).toString(),
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 16),
                          ),
                        ),
                        Container(
                          height: 70,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(30)),
                          child: Center(
                            child: ListTile(
                              tileColor: Colors.redAccent.shade700,
                              onTap: onMoveToCheckOut,
                              shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                      color: Colors.redAccent.shade700)),
                              dense: true,
                              title: Text(
                                '\$${model?.cartSubTotal ?? 0}',
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16),
                              ),
                              trailing: const Text(
                                'CheckOut',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16),
                              ),
                            ),
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
    cartBloc.add(RemoveFromCartEvent(storeId: 2.toString(), list: list));
  }

  void onMoveToCheckOut() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: ((context) => const CheckOutPage())));
  }
}

class CartTile extends StatelessWidget {
  final String? name, subSku, price, image, viewCartQuantity, viewPriductTotal;
  final Function()? onIncrement, onDecrement, onRemove;
  final bool? isCart, isView;
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
    this.isView,
    this.viewCartQuantity,
    this.viewPriductTotal,
  });

  @override
  Widget build(BuildContext context) {
    final qty = availableQuantity ?? 0;
    final isInStock = qty >= 0 ? true : false;

    return BlocBuilder<CustomerBloc, CustomerBlocState>(
      builder: (context, customerState) {
        final isSignedIn = customerState.customerModel != null;

        return Column(
          children: [
            if (isCart == true)
              Align(
                alignment: Alignment.topRight,
                child: InkWell(
                  onTap: isSignedIn
                      ? onRemove
                      : () => showAuthRequiredDialog(context),
                  child: Container(
                    height: 20,
                    width: 20,
                    decoration: const BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.all(Radius.circular(50))),
                    child: const Icon(
                      Icons.close,
                      size: 10,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            Material(
              elevation: 4.0,
              color: Colors.white,
              shape: const RoundedRectangleBorder(
                  side: BorderSide.none,
                  borderRadius: BorderRadius.all(Radius.circular(40.0))),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    SizedBox(
                      width: 120,
                      height: 120,
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
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                  child: Text(
                                name.toString(),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold),
                              )),
                            ],
                          ),
                          if (isCart == true)
                            Text("Qty: ${quantity.toString()}"),

                          if (subSku != null)
                            Row(
                              children: [
                                Expanded(
                                  child: Text("Qty: ${quantity.toString()}"),
                                ),
                              ],
                            ),
                          Row(
                            children: [
                              Expanded(
                                  child: Text('price \$${price.toString()}')),
                            ],
                          ),
                          if (isView ?? false)
                            Row(
                              children: [
                                Expanded(
                                    child: Text(viewCartQuantity.toString())),
                                Expanded(
                                    child: Text(viewPriductTotal.toString()))
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
                                          style: TextStyle(
                                              color: Colors.deepOrange),
                                        ),
                                  const Spacer(),
                                  const Row(
                                    children: [],
                                  ),
                                ],
                              ),
                            ),
                        ],
                      ),
                    )),

                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        if (isCart == true)
                          IconButton(
                            icon: const Icon(
                              Icons.add,
                              size: 35,
                            ),
                            onPressed: isSignedIn
                                ? onIncrement
                                : () => showAuthRequiredDialog(context),
                          ),
                        if (isCart == true)
                          IconButton(
                            icon: const Icon(
                              Icons.remove,
                              size: 40,
                            ),
                            onPressed: isSignedIn
                                ? onDecrement
                                : () => showAuthRequiredDialog(context),
                          ),

                        // if (isCart == true) const Spacer(),

                        if (isInStock && isCart == false)
                          IconButton(
                              onPressed: isSignedIn
                                  ? onIncrement
                                  : () => showAuthRequiredDialog(context),
                              icon: const Icon(
                                Icons.add,
                                size: 35,
                              )),
                        if (isInStock && isCart == false)
                          IconButton(
                              onPressed: isSignedIn
                                  ? onDecrement
                                  : () => showAuthRequiredDialog(context),
                              icon: const Icon(
                                Icons.remove,
                                size: 40,
                              )),
                      ],
                    )

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
            ),
          ],
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
