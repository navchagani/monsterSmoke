import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:monstersmoke/Decorations/Decorations.dart';
import 'package:monstersmoke/cartPage.dart';
import 'package:monstersmoke/core/blocs/CartBloc.dart';
import 'package:monstersmoke/core/inject.dart';
import 'package:monstersmoke/features/Cart/presentation/widgets/CartBottomBar.dart';
import 'package:monstersmoke/features/Cart/presentation/widgets/CartFloatingButton.dart';
import 'package:monstersmoke/features/Products/data/models/ProductDetailsModel.dart';
import 'package:monstersmoke/features/Products/data/models/ProductModel.dart';
import 'package:monstersmoke/features/Products/presentation/bloc/Productbloc/product_bloc_bloc.dart';

class ProductDetailPage extends StatefulWidget {
  final Content model;
  const ProductDetailPage({super.key, required this.model});

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  final bloc = getIt<ProductBloc>();

  @override
  void initState() {
    bloc.add(GetProductDetailEvent('2', widget.model.productId.toString()));

    super.initState();
  }

  @override
  void dispose() {
    bloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
        value: bloc,
        child: BlocBuilder<ProductBloc, ProductBlocState>(
          bloc: bloc,
          builder: (context, productState) {
            if (productState is ProductLoadingState) {
              return const Scaffold(
                body: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            }

            if (productState is ProductDetailCompletedState) {
              final product =
                  productState.productDetailModel.masterProductDetails;
              return NestedScrollView(
                body: Scaffold(
                  backgroundColor: const Color.fromARGB(255, 241, 239, 239),
                  body: body(),
                  bottomNavigationBar: const CartBottomBar(),
                  floatingActionButton: const CartFloatButton(),
                  floatingActionButtonLocation:
                      FloatingActionButtonLocation.miniEndDocked,
                ),
                headerSliverBuilder:
                    (BuildContext context, bool innerBoxIsScrolled) {
                  return [
                    sliverAppBar(model: product!),
                    sliverAppBar1(product: productState.productDetailModel),
                    // sliverAppBar2()
                  ];
                },
              );
            }
            return Container();
          },
        ));
  }

  Widget sliverAppBar1({required ProductDetailModel product}) {
    LocalCartBloc bloc = BlocProvider.of<LocalCartBloc>(context);

    return BlocBuilder<LocalCartBloc, LocalCartState>(
      builder: (context, cartState) {
        // int newQ = cartState.listProduct.contains(product.masterProductDetails)
        //     ? product.masterProductDetails?.quantity ?? 1
        //     : 1;
        return SliverAppBar(
            leadingWidth: 0.0,
            primary: false,
            pinned: false,
            toolbarHeight: 170,
            backgroundColor: Colors.white,
            automaticallyImplyLeading: false,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 241, 239, 239),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50),
                        topRight: Radius.circular(50))),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 30.0, vertical: 15.0),
                  child: CartTile(
                    isCart: false,
                    onIncrement: () {
                      bloc.add(LocalCartAddProductEvent(
                          product.masterProductDetails!));
                    },
                    onDecrement: () {
                      bloc.add(LocalCartOndecrementEvent(
                          product.masterProductDetails!));
                    },
                    name: product.masterProductDetails?.productName.toString(),
                    subSku:
                        'SubSku: ${product.masterProductDetails?.sku.toString()}',
                    image: product.productImageList!.first.toString(),
                    price:
                        product.masterProductDetails?.standardPrice.toString(),
                    quantity: product.masterProductDetails?.quantity,
                    availableQuantity:
                        product.masterProductDetails?.availableQuantity ?? 0,
                  ),
                ),
              ),
            ));
      },
    );
  }

  Widget sliverAppBar({required MasterProductDetails model}) => SliverAppBar(
        // automaticallyImplyLeading: false,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
              decoration: BoxDecoration(
                  color: Colors.grey, borderRadius: BorderRadius.circular(50)),
              child: IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(
                    Icons.arrow_back_ios_new,
                    color: Colors.white,
                  ))),
        ),
        pinned: true,
        toolbarHeight: 55,
        expandedHeight: 400,
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        flexibleSpace: Padding(
          padding: const EdgeInsets.only(bottom: 15.0),
          child: Material(
            color: Colors.white,
            surfaceTintColor: Colors.white,
            clipBehavior: Clip.hardEdge,
            child: FlexibleSpaceBar(
                background: Image(
              image: NetworkImage(widget.model.imageUrl.toString()),
              errorBuilder: ((context, error, stackTrace) {
                return const Image(
                    fit: BoxFit.fitWidth,
                    image: NetworkImage(
                        'https://monstersmokeoutlet.com/asset/img/place-holder.png'));
              }),
            )),
          ),
        ),
        // title: Text(
        //   widget.model.productName.toString(),
        //   overflow: TextOverflow.ellipsis,
        // ),
      );

  // Widget sliverAppBar2() => SliverAppBar(
  //       automaticallyImplyLeading: false,
  //       pinned: true,
  //       primary: false,
  //       toolbarHeight: 40,
  //       backgroundColor: Theme.of(context).scaffoldBackgroundColor,
  //     );

  Widget body() => BlocProvider.value(
        value: bloc,
        child: BlocBuilder<ProductBloc, ProductBlocState>(
          bloc: bloc,
          builder: (context, productState) {
            if (productState is ProductDetailCompletedState) {
              final variationProduct =
                  productState.productDetailModel.body?.content!;

              return Column(
                children: [
                  if (variationProduct!.isNotEmpty)
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30.0, vertical: 15.0),
                        child: Text(
                          'Product Variations',
                          style: const TextStyle(
                              fontSize: 20,
                              // color: Colors.black,
                              fontWeight: FontWeight.bold),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                  Expanded(
                      child: ListView.separated(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30.0, vertical: 15.0),
                    itemBuilder: ((context, index) {
                      LocalCartBloc bloc = BlocProvider.of(context);

                      final variationProduct =
                          productState.productDetailModel.body?.content![index];

                      return BlocBuilder<LocalCartBloc, LocalCartState>(
                        builder: (context, cartState) {
                          int newQ =
                              cartState.listProduct.contains(variationProduct)
                                  ? variationProduct?.quantity ?? 0
                                  : 0;

                          return CartTile(
                            isCart: false,
                            onIncrement: () {
                              bloc.add(LocalCartAddProductEvent(
                                  variationProduct!..quantity = newQ));
                            },
                            onDecrement: () {
                              bloc.add(
                                  LocalCartOndecrementEvent(variationProduct!));
                            },
                            name: variationProduct?.productName.toString(),
                            price: variationProduct?.standardPrice.toString(),
                            quantity: variationProduct?.quantity ?? 0,
                            image: variationProduct?.imageUrl.toString(),
                            availableQuantity:
                                variationProduct?.availableQuantity,
                          );
                        },
                      );
                    }),
                    itemCount:
                        productState.productDetailModel.body?.content?.length ??
                            0,
                    separatorBuilder: (BuildContext context, int index) {
                      return Decorations.height10;
                    },
                  ))
                ],
              );
            }
            return Container();
          },
        ),
      );
}

class AddToCartButton extends StatelessWidget {
  const AddToCartButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onAddToCart,
      child: const Icon(Icons.add_shopping_cart),
    );
  }

  void onAddToCart() {}
}
