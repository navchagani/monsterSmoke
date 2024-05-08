import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:monstersmoke/Decorations/Decorations.dart';
import 'package:monstersmoke/core/blocs/CustomBlocs.dart';
import 'package:monstersmoke/core/inject.dart';
import 'package:monstersmoke/core/widgets/ProductCard.dart';
import 'package:monstersmoke/features/Cart/presentation/bloc/cart_bloc.dart';
import 'package:monstersmoke/features/Products/data/models/ProductModel.dart';
import 'package:monstersmoke/features/Products/presentation/bloc/Productbloc/product_bloc_bloc.dart';
import 'package:monstersmoke/features/Products/presentation/pages/ProductDetailPage.dart';

class CustomProductContainer extends StatefulWidget {
  final String? text;
  final int? storeIds, categoryList, showQuantity;
  final bool? isScrollable;

  const CustomProductContainer(
      {super.key,
      this.text,
      this.storeIds,
      this.categoryList,
      this.showQuantity,
      this.isScrollable});

  @override
  State<CustomProductContainer> createState() => _CustomProductContainerState();
}

class _CustomProductContainerState extends State<CustomProductContainer> {
  final ProductBloc bloc = getIt<ProductBloc>();

  @override
  void initState() {
    bloc.add(GetProductEvent(
        sort: 'date',
        sortDirection: 'DESC',
        storeIds: widget.storeIds ?? 2,
        categoryIdList: widget.categoryList ?? 25));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(children: [
        if (widget.text != null)
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                widget.text.toString(),
                style:
                    const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              )
            ],
          ),
        Expanded(
          flex: widget.isScrollable ?? true ? 1 : 0,
          child: SizedBox(
            height: widget.isScrollable ?? true
                ? MediaQuery.of(context).size.height
                : 850,
            width: MediaQuery.of(context).size.width,
            child: BlocProvider.value(
                value: bloc,
                child: BlocBuilder(
                  bloc: bloc,
                  builder: (context, productState) {
                    if (productState is ProductLoadingState) {
                      return const Center(child: CircularProgressIndicator());
                    }

                    if (productState is ProductCompletedState) {
                      final productList = productState.listProducts;
                      final showQuantity = widget.showQuantity ?? 6;

                      return BlocBuilder<IsMobile, bool>(
                        builder: (context, isMobile) {
                          if (!isMobile) {
                            return GridView.builder(
                              shrinkWrap: true,
                              padding: const EdgeInsets.all(15.0),
                              physics: widget.isScrollable ?? true
                                  ? const AlwaysScrollableScrollPhysics()
                                  : const NeverScrollableScrollPhysics(),
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                      mainAxisExtent: 260,
                                      crossAxisCount: 2,
                                      mainAxisSpacing: 12.0,
                                      crossAxisSpacing: 12.0),
                              itemBuilder: ((context, index) {
                                final product = productList[index];

                                return ProductCardWidget(
                                  productImage: product.imageUrl.toString(),
                                  productName: product.productName.toString(),
                                  productPrice:
                                      product.standardPrice.toString(),
                                  productQuantity:
                                      product.availableQuantity.toString(),
                                  onTap: () => onProductTap(model: product),
                                  onAddToCart: () => addProductToCart(product),
                                );
                              }),
                              itemCount: widget.isScrollable ?? true
                                  ? productList.length
                                  : showQuantity,
                            );
                          }

                          return SizedBox(
                            height: 220,
                            width: double.infinity,
                            child: ListView.separated(
                                scrollDirection: Axis.horizontal,
                                padding: const EdgeInsets.all(15.0),
                                itemBuilder: ((context, index) {
                                  final product = productList[index];

                                  return ProductCardWidget(
                                      productImage: product.imageUrl.toString(),
                                      productName:
                                          product.productName.toString(),
                                      productPrice: product.costPrice,
                                      productQuantity:
                                          product.availableQuantity.toString());
                                }),
                                separatorBuilder: ((context, index) =>
                                    Decorations.width10),
                                itemCount: productList.length),
                          );
                        },
                      );
                    }

                    return Container();
                  },
                )),
          ),
        )
      ]),
    );
  }

  onProductTap({required ProductModel model}) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: ((context) => ProductDetailPage(model: model))));
  }

  addProductToCart(ProductModel product) {
    CartBloc bloc = getIt<CartBloc>();
    bloc.add(AddToCartEvent(storeId: 2.toString(), list: [product]));
  }
}
