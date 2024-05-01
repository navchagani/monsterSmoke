import 'package:flutter/material.dart';
import 'package:monstersmoke/Decorations/Decorations.dart';

class ProductCardWidget extends StatelessWidget {
  final String productImage, productName, productPrice, productQuantity;

  const ProductCardWidget(
      {super.key,
      required this.productImage,
      required this.productName,
      required this.productPrice,
      required this.productQuantity});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 140,
      width: 200,
      child: Material(
        color: Colors.white,
        elevation: 4.0,
        shape: RoundedRectangleBorder(
          side: BorderSide(color: Colors.black26),
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 140,
                // width: 120,
                child: Material(
                  borderRadius: BorderRadius.circular(10.0),
                  clipBehavior: Clip.hardEdge,
                  child: Image(
                    image: NetworkImage(productImage.toString()),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Decorations.height10,
              Row(
                children: [
                  Expanded(
                    child: Text(
                      productName,
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
                  Expanded(child: Text('price: \$$productPrice')),
                ],
              ),
              Decorations.height10,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('In Stock: $productQuantity'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
