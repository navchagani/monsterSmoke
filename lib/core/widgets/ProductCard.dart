import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:monstersmoke/Decorations/Decorations.dart';
import 'package:monstersmoke/core/blocs/CustomBlocs.dart';
import 'package:monstersmoke/features/Auth/presentation/pages/AuthActionPage.dart';
import 'package:monstersmoke/features/Customer/presentation/bloc/GetCustomerBloc/customer_bloc_bloc.dart';

class ProductCardWidget extends StatelessWidget {
  final String productImage, productName, productPrice, productQuantity;
  final Function()? onTap, onAddToCart;

  const ProductCardWidget(
      {super.key,
      required this.productImage,
      required this.productName,
      required this.productPrice,
      required this.productQuantity,
      this.onTap,
      this.onAddToCart});

  @override
  Widget build(BuildContext context) {
    final quantity = int.parse(productQuantity);

    return BlocBuilder<CustomerBloc, CustomerBlocState>(
      builder: (context, customerState) {
        final isSignedIn = customerState.customerModel != null;

        return BlocBuilder<IsMobile, bool>(builder: (context, isMobile) {
          return SizedBox(
            height: double.infinity,
            width: 360,
            child: Material(
              elevation: 4.0,
              shadowColor:
                  Theme.of(context).colorScheme.onBackground.withOpacity(0.8),
              color: Colors.white,
              shape: RoundedRectangleBorder(
                side: BorderSide.none,
                borderRadius: BorderRadius.circular(10.0),
              ),
              clipBehavior: Clip.hardEdge,
              child: InkWell(
                onTap: onTap,
                child: Builder(
                  builder: (context) {
                    if (!isMobile) {
                      return Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: SizedBox(
                                  height: 90,
                                  width: 90,
                                  child: Image(
                                    image:
                                        NetworkImage(productImage.toString()),
                                    fit: BoxFit.cover,
                                    errorBuilder: ((context, error,
                                            stackTrace) =>
                                        const Image(
                                            image: NetworkImage(
                                                'https://monstersmokeoutlet.com/asset/img/place-holder.png'))),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Expanded(
                            child: Material(
                              color: Colors.grey.shade200,
                              child: Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Expanded(
                                          child: Text(
                                            productName,
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                            style: const TextStyle(
                                                fontSize: 16,
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                                overflow:
                                                    TextOverflow.ellipsis),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Decorations.height5,
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Expanded(
                                            child: Text(
                                          isSignedIn
                                              ? '\$$productPrice'
                                              : 'Sign In For Price',
                                          style: TextStyle(
                                              fontSize: 18,
                                              color: Colors.green.shade600,
                                              fontWeight: FontWeight.w900,
                                              overflow: TextOverflow.ellipsis),
                                        )),
                                      ],
                                    ),
                                    const Spacer(),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Expanded(
                                            child: Text(
                                          quantity <= 0
                                              ? 'Out of Stock'
                                              : 'In Stock: ${quantity.toString()}',
                                          style: const TextStyle(
                                              fontSize: 16,
                                              color: Colors.black,
                                              fontWeight: FontWeight.normal,
                                              overflow: TextOverflow.ellipsis),
                                        )),
                                        // if (quantity > 0)
                                        //   IconButton(
                                        //       onPressed: isSignedIn
                                        //           ? onAddToCart
                                        //           : () =>
                                        //               showAuthRequiredDialog(
                                        //                   context),
                                        //       icon: const Icon(
                                        //         Icons
                                        //             .add_circle_outline_outlined,
                                        //         size: 30,
                                        //       )),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    }

                    return Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 200,
                          width: 120,
                          child: Material(
                            clipBehavior: Clip.hardEdge,
                            child: Image(
                              image: NetworkImage(productImage.toString()),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Decorations.height10,
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        productName,
                                        maxLines: 3,
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            overflow: TextOverflow.ellipsis),
                                      ),
                                    ),
                                  ],
                                ),
                                // Decorations.height5,
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                        child: Text('price: \$$productPrice')),
                                  ],
                                ),
                                Decorations.height10,
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Expanded(
                                        child:
                                            Text('In Stock: $productQuantity')),
                                  ],
                                ),
                                const Spacer(),
                                // Row(
                                //   mainAxisAlignment: MainAxisAlignment.end,
                                //   crossAxisAlignment: CrossAxisAlignment.end,
                                //   children: [
                                //     IconButton(
                                //         onPressed: () {},
                                //         icon: const Icon(
                                //           Icons.add_circle_outline_outlined,
                                //           size: 30,
                                //         )),
                                //   ],
                                // ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
          );
        });
      },
    );
  }

  showAuthRequiredDialog(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const AuthActionPage()));
  }
}
