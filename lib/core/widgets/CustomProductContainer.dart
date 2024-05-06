import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:monstersmoke/Decorations/Decorations.dart';
import 'package:monstersmoke/core/blocs/CustomBlocs.dart';
import 'package:monstersmoke/core/widgets/ProductCard.dart';

class CustomProductContainer extends StatelessWidget {
  final List<String>? productList;
  final String text;
  const CustomProductContainer(
      {super.key, required this.productList, required this.text});

  @override
  Widget build(BuildContext context) {
    final productList = [
      const ProductCardWidget(
          productImage:
              'https://d11cxue75f9a69.cloudfront.net/product-images/foger-ct10000-1-1714432227643.jpg',
          productName: 'Core 6000 Puffs 10Ct',
          productPrice: '20',
          productQuantity: '0'),
      const ProductCardWidget(
          productImage:
              'https://d11cxue75f9a69.cloudfront.net/product-images/airfuze-jet-20000-0-1-1714169588315.jpg',
          productName: 'Core 6000 Puffs',
          productPrice: '20',
          productQuantity: '0'),
      const ProductCardWidget(
          productImage:
              'https://d11cxue75f9a69.cloudfront.net/product-images/ebcreate-bc5000-disposable-vape-50mg-10ct-display-5179-900x900-0-1-1714170586934.png',
          productName: 'Core Puffs 10Ct',
          productPrice: '20',
          productQuantity: '0'),
      const ProductCardWidget(
          productImage:
              'https://d11cxue75f9a69.cloudfront.net/product-images/12-18-2023-Nicky-Jam-x-Fume-10000-Disposable-Vape-10-69409.1702919269-1-1713651135233.jpg',
          productName: 'Core 6000 Puffs Puffs Puffs',
          productPrice: '20',
          productQuantity: '0'),
      ProductCardWidget(
          onTap: () {},
          productImage:
              'https://d11cxue75f9a69.cloudfront.net/product-images/Fume-Eternity-20000-Disposable-Vape-Bundle-2424d559-bc44-4e45-94d1-b3eb37023c85-1-1713299802143.png',
          productName: 'Core Puffs 10Ct',
          productPrice: '20',
          productQuantity: '0'),
    ];

    return SizedBox(
      height: 1000,
      width: double.infinity,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                text,
                style:
                    const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              )
            ],
          ),
          BlocBuilder<IsMobile, bool>(
            builder: (context, isMobile) {
              if (!isMobile) {
                return GridView.builder(
                  shrinkWrap: true,
                  padding: const EdgeInsets.all(10.0),
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisExtent: 260,
                      crossAxisCount: 2,
                      mainAxisSpacing: 8.0,
                      crossAxisSpacing: 8.0),
                  itemBuilder: ((context, index) {
                    return productList[index];
                  }),
                  itemCount: productList.length,
                );
              }

              return SizedBox(
                height: 220,
                width: double.infinity,
                child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.all(15.0),
                    itemBuilder: ((context, index) {
                      return productList[index];
                    }),
                    separatorBuilder: ((context, index) => Decorations.width10),
                    itemCount: productList.length),
              );
            },
          )
        ],
      ),
    );
  }
}
