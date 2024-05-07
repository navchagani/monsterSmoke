import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:monstersmoke/Decorations/Decorations.dart';
import 'package:monstersmoke/core/blocs/CustomBlocs.dart';
import 'package:monstersmoke/core/inject.dart';
import 'package:monstersmoke/core/widgets/ProductCard.dart';
import 'package:monstersmoke/features/Products/data/models/ProductModel.dart';
import 'package:monstersmoke/features/Products/presentation/bloc/Productbloc/product_bloc_bloc.dart';
import 'package:monstersmoke/features/Products/presentation/pages/ProductDetailPage.dart';

class CustomProductContainer extends StatefulWidget {
  final List<String>? productList;
  final String text;
  const CustomProductContainer(
      {super.key, required this.productList, required this.text});

  @override
  State<CustomProductContainer> createState() => _CustomProductContainerState();
}

class _CustomProductContainerState extends State<CustomProductContainer> {
  final ProductBloc bloc = getIt<ProductBloc>();

  @override
  void initState() {
    bloc.add(const GetProductEvent(storeIds: 56, categoryIdList: 25));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // final productList = [
    //   const ProductCardWidget(
    //       productImage:
    //           'https://d11cxue75f9a69.cloudfront.net/product-images/foger-ct10000-1-1714432227643.jpg',
    //       productName: 'Core 6000 Puffs 10Ct',
    //       productPrice: '20',
    //       productQuantity: '0'),
    //   const ProductCardWidget(
    //       productImage:
    //           'https://d11cxue75f9a69.cloudfront.net/product-images/airfuze-jet-20000-0-1-1714169588315.jpg',
    //       productName: 'Core 6000 Puffs',
    //       productPrice: '20',
    //       productQuantity: '0'),
    //   const ProductCardWidget(
    //       productImage:
    //           'https://d11cxue75f9a69.cloudfront.net/product-images/ebcreate-bc5000-disposable-vape-50mg-10ct-display-5179-900x900-0-1-1714170586934.png',
    //       productName: 'Core Puffs 10Ct',
    //       productPrice: '20',
    //       productQuantity: '0'),
    //   const ProductCardWidget(
    //       productImage:
    //           'https://d11cxue75f9a69.cloudfront.net/product-images/12-18-2023-Nicky-Jam-x-Fume-10000-Disposable-Vape-10-69409.1702919269-1-1713651135233.jpg',
    //       productName: 'Core 6000 Puffs Puffs Puffs',
    //       productPrice: '20',
    //       productQuantity: '0'),
    //   ProductCardWidget(
    //       onTap: () {},
    //       productImage:
    //           'https://d11cxue75f9a69.cloudfront.net/product-images/Fume-Eternity-20000-Disposable-Vape-Bundle-2424d559-bc44-4e45-94d1-b3eb37023c85-1-1713299802143.png',
    //       productName: 'Core Puffs 10Ct',
    //       productPrice: '20',
    //       productQuantity: '0'),
    // ];

    return SizedBox(
      width: double.infinity,
      child: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              widget.text,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            )
          ],
        ),
        BlocProvider.value(
            value: bloc,
            child: BlocBuilder(
              bloc: bloc,
              builder: (context, productState) {
                if (productState is ProductLoadingState) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (productState is ProductCompletedState) {
                  final productList = productState.listProducts;

                  return BlocBuilder<IsMobile, bool>(
                    builder: (context, isMobile) {
                      if (!isMobile) {
                        return GridView.builder(
                          shrinkWrap: true,
                          padding: const EdgeInsets.all(15.0),
                          physics: const NeverScrollableScrollPhysics(),
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
                              productPrice: product.standardPrice.toString(),
                              productQuantity:
                                  product.availableQuantity.toString(),
                              onTap: () => onProductTap(model: product),
                            );
                          }),
                          itemCount:
                              productList.length > 6 ? 5 : productList.length,
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
              },
            ))
      ]),
    );
  }

  onProductTap({required ProductModel model}) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: ((context) => ProductDetailPage(model: model))));
  }
}
