import 'package:flutter/material.dart';
import 'package:monstersmoke/features/Products/data/models/ProductModel.dart';

class ProductDetailPage extends StatelessWidget {
  final ProductModel model;
  const ProductDetailPage({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: body(),
    );
  }

  AppBar appBar() => AppBar(
        title: Text(
          model.productName.toString(),
          overflow: TextOverflow.ellipsis,
        ),
      );

  Widget body() => const Column(
        children: [],
      );
}
