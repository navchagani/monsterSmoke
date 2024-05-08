import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:monstersmoke/core/widgets/ProductCard.dart';
import 'package:monstersmoke/features/GetCat&Brand/presentation/bloc/BrandBloc/brand_bloc.dart';

class BrandsPage extends StatefulWidget {
  final String storeIds, brandIdList, title;
  const BrandsPage(
      {super.key,
      required this.storeIds,
      required this.brandIdList,
      required this.title});

  @override
  State<BrandsPage> createState() => _BrandsPageState();
}

class _BrandsPageState extends State<BrandsPage> {
  @override
  void initState() {
    BrandBloc bloc = BlocProvider.of<BrandBloc>(context);
    bloc.add(GetBrandEvent(widget.storeIds, widget.brandIdList));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Column(
          children: [
            Expanded(
              child: BlocBuilder(builder: ((context, state) {
                if (state is BrandLoadingBrand) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }

                if (state is BrandCompletedBrand) {
                  return GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2),
                      itemBuilder: ((context, index) {
                        final product = state.lilstContries[index];

                        return ProductCardWidget(
                            productImage: product.imageUrl.toString(),
                            productName: product.productName.toString(),
                            productPrice: product.costPrice.toString(),
                            productQuantity:
                                product.availableQuantity.toString());
                      }));
                }

                return Container();
              })),
            ),
          ],
        ));
  }
}
