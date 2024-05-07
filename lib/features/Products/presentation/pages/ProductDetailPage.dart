import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:monstersmoke/core/inject.dart';
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
              return Padding(
                padding: const EdgeInsets.all(25.0),
                child: Column(
                  children: [
                    Material(
                      elevation: 5.0,
                      borderRadius: BorderRadius.circular(10.0),
                      clipBehavior: Clip.hardEdge,
                      child: Image(
                          height: 150,
                          width: 150,
                          image: NetworkImage(productState
                              .productDetailModel.productImageList!.first
                              .toString())),
                    )
                  ],
                ),
              );
            }
            return Container();
          },
        ),
      );
}
