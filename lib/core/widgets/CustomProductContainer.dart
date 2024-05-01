import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:monstersmoke/Decorations/Decorations.dart';
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
              'https://farm2.staticflickr.com/1449/24800673529_64272a66ec_z_d.jpg',
          productName: 'Core 6000 Puffs 10Ct',
          productPrice: '20',
          productQuantity: '0'),
      const ProductCardWidget(
          productImage:
              'https://farm8.staticflickr.com/7377/9359257263_81b080a039_z_d.jpg',
          productName: 'Core 6000 Puffs',
          productPrice: '20',
          productQuantity: '0'),
      const ProductCardWidget(
          productImage:
              'https://farm9.staticflickr.com/8295/8007075227_dc958c1fe6_z_d.jpg',
          productName: 'Core Puffs 10Ct',
          productPrice: '20',
          productQuantity: '0'),
      const ProductCardWidget(
          productImage:
              'https://farm8.staticflickr.com/7377/9359257263_81b080a039_z_d.jpg',
          productName: 'Core 6000 Puffs',
          productPrice: '20',
          productQuantity: '0'),
      const ProductCardWidget(
          productImage:
              'https://farm9.staticflickr.com/8295/8007075227_dc958c1fe6_z_d.jpg',
          productName: 'Core Puffs 10Ct',
          productPrice: '20',
          productQuantity: '0'),
    ];

    return SizedBox(
      height: 340,
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
          SizedBox(
            height: 280,
            width: double.infinity,
            child: ListView.separated(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.all(10.0),
                itemBuilder: ((context, index) {
                  return productList[index];
                }),
                separatorBuilder: ((context, index) => Decorations.width10),
                itemCount: productList.length),
          )
        ],
      ),
    );
  }
}
