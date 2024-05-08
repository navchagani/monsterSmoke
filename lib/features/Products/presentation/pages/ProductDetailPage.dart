import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:monstersmoke/Decorations/Decorations.dart';
import 'package:monstersmoke/cartPage.dart';
import 'package:monstersmoke/core/inject.dart';
import 'package:monstersmoke/features/Cart/presentation/widgets/CartBottomBar.dart';
import 'package:monstersmoke/features/Cart/presentation/widgets/CartFloatingButton.dart';
import 'package:monstersmoke/features/Products/data/models/ProductModel.dart';
import 'package:monstersmoke/features/Products/presentation/bloc/Productbloc/product_bloc_bloc.dart';

class ProductDetailPage extends StatefulWidget {
  final ProductModel model;
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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: body(),
      bottomNavigationBar: const CartBottomBar(),
      floatingActionButton: const CartFloatButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
    );
  }

  AppBar appBar() => AppBar(
        title: Text(
          widget.model.productName.toString(),
          overflow: TextOverflow.ellipsis,
        ),
      );

  Widget body() => BlocProvider.value(
        value: bloc,
        child: BlocBuilder<ProductBloc, ProductBlocState>(
          bloc: bloc,
          builder: (context, productState) {
            if (productState is ProductDetailCompletedState) {
              final product =
                  productState.productDetailModel.masterProductDetails;

              return Column(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        children: [
                          CartTile(
                            name: product?.productName.toString(),
                            subSku: 'SubSku: ${product?.sku.toString()}',
                            image: productState
                                .productDetailModel.productImageList!.first
                                .toString(),
                            price: product?.standardPrice.toString(),
                            quantity: '2',
                          ),
                          Decorations.height15,
                          Expanded(
                              child: Column(
                            children: [
                              const Row(
                                children: [
                                  Expanded(
                                      child: Text(
                                    'Product Variations: ',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  ))
                                ],
                              ),
                              Expanded(
                                  child: ListView.separated(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 15.0),
                                itemBuilder: ((context, index) {
                                  final variationProduct = productState
                                      .productDetailModel.body?.content![index];

                                  return CartTile(
                                    name: variationProduct?.productName
                                        .toString(),
                                    price: variationProduct?.standardPrice
                                        .toString(),
                                    quantity: '2',
                                    image:
                                        variationProduct?.imageUrl.toString(),
                                  );
                                }),
                                itemCount: productState.productDetailModel.body
                                        ?.content?.length ??
                                    0,
                                separatorBuilder:
                                    (BuildContext context, int index) {
                                  return Decorations.height10;
                                },
                              ))
                            ],
                          ))
                        ],
                      ),
                    ),
                  )
                ],
              );
            }
            return Container();
          },
        ),
      );
}
