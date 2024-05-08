import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:monstersmoke/core/inject.dart';
import 'package:monstersmoke/core/widgets/CustomIniputField.dart';
import 'package:monstersmoke/core/widgets/CustomProductContainer.dart';
import 'package:monstersmoke/core/widgets/ProductCard.dart';
import 'package:monstersmoke/features/GetCat&Brand/data/models/CategoryModel.dart';
import 'package:monstersmoke/features/GetCat&Brand/presentation/bloc/CategoryBloc/category_bloc.dart';
import 'package:monstersmoke/features/Products/data/models/ProductSearchModel.dart';
import 'package:monstersmoke/features/Products/presentation/bloc/Productbloc/product_bloc_bloc.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final searchController = TextEditingController();
  final productBloc = getIt<ProductBloc>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: searchProductWidget(),
    );
  }

  AppBar appBar() {
    return AppBar(
      toolbarHeight: 100,
      centerTitle: true,
      title: PreferredSize(
        preferredSize: const Size(double.infinity, 70),
        child: Hero(
          tag: 'search',
          child: SizedBox(
            width: 500,
            child: CustomInputField(
              controller: searchController,
              icon: const Icon(Icons.search),
              labelText: 'Search Products',
              hintText: 'Search Products',
              onChanged: onSearchChanged,
            ),
          ),
        ),
      ),
    );
  }

  Widget searchProductWidget() => Column(
        children: [
          Expanded(
            child: BlocProvider.value(
              value: productBloc,
              child: BlocBuilder<ProductBloc, ProductBlocState>(
                  bloc: productBloc,
                  builder: ((context, state) {
                    if (searchController.text.isEmpty) {
                      return body();
                    }

                    if (state is ProductLoadingState) {
                      return const Center(child: CircularProgressIndicator());
                    }

                    if (state is SearchProductCompletedState) {
                      final productList = state.searchModel.productCoreDtoList;
                      return GridView.builder(
                          shrinkWrap: true,
                          padding: const EdgeInsets.all(15.0),
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
                          itemCount: productList!.length);
                    }

                    return body();
                  })),
            ),
          ),
        ],
      );

  Widget body() {
    final list = ['Smoke', 'Vape', 'Hookah', 'Dispensary', 'AdultNovelty'];

    return SingleChildScrollView(
      child: BlocBuilder<CategoryBloc, CategoryState>(
        builder: (context, categoryState) {
          if (categoryState is CategoryLoadingCategory) {
            return const Center(child: CircularProgressIndicator());
          }

          if (categoryState is CategoryCompletedCategory) {
            return Column(
              children: categoryState.lilstContries
                  .map((e) => TreeTile(
                        list: e.subCategories!
                            .map((e) => CategoryModel.fromJson(e))
                            .toList(),
                        text: e.name.toString(),
                      ))
                  .toList(),
            );
          }

          if (categoryState is CategoryErrorCategory) {
            return Center(
              child: Text(categoryState.error.message.toString()),
            );
          }

          return Container();
        },
      ),
    );
  }

  onProductTap({required ProductCoreDtoList model}) {}

  onSearchChanged(String value) {
    if (searchController.text.isEmpty) {
      setState(() {});
      productBloc.add(ProductInitialEvent());
    } else {
      setState(() {});
      productBloc.add(SearchProductEvent(value));
    }
  }
}

class TreeTile extends StatefulWidget {
  final String text;
  final List<dynamic> list;
  const TreeTile({super.key, required this.text, required this.list});

  @override
  State<TreeTile> createState() => _TreeTileState();
}

class _TreeTileState extends State<TreeTile> {
  bool showSubCat = false;

  @override
  Widget build(BuildContext context) {
    final data = widget.list as List<CategoryModel>;

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: const BoxDecoration(
              border: Border(bottom: BorderSide(color: Colors.black12))),
          child: ListTile(
            title: Text(
              widget.text,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            onTap: () {
              setState(() {
                showSubCat = !showSubCat;
              });
            },
            dense: true,
            trailing: const Icon(Icons.keyboard_arrow_down_outlined),
          ),
        ),
        if (showSubCat)
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: ConstrainedBox(
                constraints:
                    const BoxConstraints(maxHeight: 300, minHeight: 40),
                child: SingleChildScrollView(
                  child: Wrap(
                    runSpacing: -5.0,
                    spacing: 5.0,
                    children: data
                        .map(
                          (e) => RawChip(
                            surfaceTintColor: Colors.transparent,
                            backgroundColor: Colors.white,
                            side: const BorderSide(color: Colors.black12),
                            padding: const EdgeInsets.all(2.0),
                            label: Text(
                              e.name.toString(),
                              style: const TextStyle(fontSize: 15),
                            ),
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: ((context) => ProductCategoriesPage(
                                        storeIds: 58,
                                        categoryList: e.id,
                                        heading: e.name.toString(),
                                      ))));
                            },
                            // dense: true,
                          ),
                        )
                        .toList(),
                  ),
                )

                // ListView(
                //   shrinkWrap: true,
                //   children: widget.list
                //       .map(
                //         (e) => ListTile(
                //           title: Text(
                //             e,
                //             style: const TextStyle(fontSize: 20),
                //           ),
                //           onTap: () {},
                //           dense: true,
                //         ),
                //       )
                //       .toList(),
                // ),
                ),
          )
      ],
    );
  }
}

class ProductCategoriesPage extends StatelessWidget {
  final int? storeIds, categoryList;
  final String heading;
  const ProductCategoriesPage(
      {super.key, this.storeIds, this.categoryList, required this.heading});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(heading.toString()),
      ),
      body: CustomProductContainer(
        categoryList: categoryList,
        storeIds: storeIds,
        isScrollable: true,
      ),
    );
  }
}
