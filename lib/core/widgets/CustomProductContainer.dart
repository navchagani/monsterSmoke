import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:monstersmoke/Decorations/Decorations.dart';
import 'package:monstersmoke/core/blocs/CustomBlocs.dart';
import 'package:monstersmoke/core/inject.dart';
import 'package:monstersmoke/core/widgets/CustomToggleButton.dart';
import 'package:monstersmoke/core/widgets/ProductCard.dart';
import 'package:monstersmoke/features/Cart/presentation/bloc/cart_bloc.dart';
import 'package:monstersmoke/features/Products/data/models/ProductModel.dart';
import 'package:monstersmoke/features/Products/presentation/bloc/Productbloc/product_bloc_bloc.dart';
import 'package:monstersmoke/features/Products/presentation/pages/ProductDetailPage.dart';

class CustomProductContainer extends StatefulWidget {
  final String? text;
  final int? tagId, storeIds, categoryList, showQuantity;
  final bool? isScrollable, fromTags;

  const CustomProductContainer(
      {super.key,
      this.text,
      this.storeIds,
      this.categoryList,
      this.showQuantity,
      this.isScrollable,
      this.tagId,
      this.fromTags});

  @override
  State<CustomProductContainer> createState() => _CustomProductContainerState();
}

class _CustomProductContainerState extends State<CustomProductContainer> {
  final ProductBloc bloc = getIt<ProductBloc>();
  final currentIndex = 0;

  @override
  void initState() {
    if (widget.fromTags ?? false) {
      bloc.add(GetTagProductEvents(
          tagId: widget.tagId ?? 6,
          size: 10,
          page: 0,
          storeIds: widget.storeIds ?? 2,
          buisnessTypeId: widget.categoryList ?? 1));
    } else {
      bloc.add(GetProductEvent(
          sort: 'date',
          sortDirection: 'DESC',
          size: 20,
          page: 0,
          storeIds: widget.storeIds ?? 2,
          categoryIdList: widget.categoryList ?? 1));
    }
    super.initState();
  }

  @override
  void dispose() {
    // bloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      final mobile = constraints.maxWidth > 600 ? false : true;

      return BlocProvider.value(
          value: bloc,
          child: BlocBuilder(
              bloc: bloc,
              builder: (context, productState) {
                if (productState is ProductCompletedState) {
                  if (productState.productModel.content!.isEmpty) {
                    return Container();
                  }

                  return buildProductListView(
                      productState,
                      productState.productModel.content ?? [],
                      mobile,
                      productState.productModel.totalPages ?? 0,
                      productState.productModel.number ?? 0);
                }

                return Container();
              }));
    });
  }

  Widget buildProductListView(Object productState, List<Content> listProduct,
          bool mobile, int totalPage, int currentPage) =>
      SizedBox(
          height: widget.isScrollable ?? true
              ? MediaQuery.of(context).size.height
              : mobile
                  ? 780
                  : 600,
          width: MediaQuery.of(context).size.width,
          child: Scaffold(
            backgroundColor: const Color.fromARGB(255, 241, 239, 239),
            appBar: AppBar(
              primary: false,
              automaticallyImplyLeading: false,
              toolbarHeight: widget.fromTags ?? false
                  ? mobile
                      ? 30.0
                      : 100.0
                  : 30.0,
              title: widget.fromTags ?? false
                  ? Text(widget.text.toString())
                  : CustomToggleButton(
                      pages: totalPage,
                      onCountPressed: onCountPressed,
                      currentIndex: currentPage),
            ),
            body: Center(
              child: SizedBox(child: Builder(builder: (context) {
                if (productState is ProductLoadingState &&
                        widget.fromTags == false ||
                    productState is ProductLoadingState &&
                        widget.fromTags == null) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (productState is ProductCompletedState) {
                  if (productState.productModel.content!.isEmpty) {
                    return Container();
                  }

                  final productList = listProduct;
                  final showQuantity = productList.length > 6
                      ? widget.showQuantity ?? 6
                      : productList.length;

                  return BlocBuilder<IsMobile, bool>(
                    builder: (context, isMobile) {
                      if (!isMobile) {
                        return GridView.builder(
                          shrinkWrap: true,
                          physics: widget.isScrollable ?? true
                              ? const AlwaysScrollableScrollPhysics()
                              : const NeverScrollableScrollPhysics(),
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  mainAxisExtent: 230,
                                  crossAxisCount: mobile ? 2 : 3,
                                  mainAxisSpacing: 8.0,
                                  crossAxisSpacing: 6.0),
                          itemBuilder: ((context, index) {
                            final product = productList[index];

                            return ProductCardWidget(
                              productImage: product.imageUrl.toString(),
                              productName: product.productName.toString(),
                              productPrice: product.standardPrice.toString(),
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
                                  productName: product.productName.toString(),
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
              })),
            ),
          ));

  onProductTap({required Content model}) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: ((context) => ProductDetailPage(model: model))));
  }

  addProductToCart(Content product) {
    CartBloc bloc = BlocProvider.of(context);
    bloc.add(AddToCartEvent(storeId: 2.toString(), list: [product]));
  }

  onCountPressed(int pageIndex) {
    bloc.add(GetProductEvent(
        sort: 'date',
        sortDirection: 'DESC',
        size: 20,
        page: pageIndex,
        storeIds: widget.storeIds ?? 2,
        categoryIdList: widget.categoryList ?? 1));
  }
}
