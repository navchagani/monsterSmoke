import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:monstersmoke/Decorations/Decorations.dart';
import 'package:monstersmoke/Modes/MobileMode/Widgets/AppBars.dart';
import 'package:monstersmoke/Modes/MobileMode/Widgets/MainAppBar.dart';
import 'package:monstersmoke/core/inject.dart';
import 'package:monstersmoke/core/widgets/CustomIniputField.dart';
import 'package:monstersmoke/core/widgets/CustomProductContainer.dart';
import 'package:monstersmoke/features/Cart/presentation/widgets/CartBottomBar.dart';
import 'package:monstersmoke/features/Cart/presentation/widgets/CartFloatingButton.dart';
import 'package:monstersmoke/features/Products/data/models/TagProductModel.dart';
import 'package:monstersmoke/features/Products/presentation/bloc/Productbloc/product_bloc_bloc.dart';
import 'package:monstersmoke/features/Search/presentation/pages/SearchPage.dart';

GlobalKey<ScaffoldState> globalKey = GlobalKey<ScaffoldState>();

class MobileViewMode extends StatefulWidget {
  const MobileViewMode({super.key});

  @override
  State<MobileViewMode> createState() => _MobileViewModeState();
}

class _MobileViewModeState extends State<MobileViewMode> {
  bool _isMenuOpened = false;

  void _toggleMenu() {
    setState(() {
      _isMenuOpened = !_isMenuOpened;
    });
  }

  late ScrollController scrollController;
  bool showPrimary = false;
  final getTagsBloc = getIt<ProductBloc>();

  @override
  void initState() {
    getTagsBloc.add(const GetTagsEvent());

    scrollController = ScrollController();
    scrollController.addListener(() {
      if (scrollController.offset > 0) {
        setState(() {
          showPrimary = true;
        });
      } else {
        setState(() {
          showPrimary = false;
        });
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    getTagsBloc.close();
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
        controller: scrollController,
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            const MainAppBar(),
            const SliverAppBar(
              automaticallyImplyLeading: false,
              toolbarHeight: 140,
              flexibleSpace: FlexibleSpaceBar(
                  background: SliverBar1(
                axis: Axis.vertical,
                siderId: 86,
              )),
            ),
            SliverAppBar(
              automaticallyImplyLeading: false,
              backgroundColor: const Color.fromARGB(255, 241, 239, 239),
              shadowColor: Colors.black,
              pinned: true,
              primary: showPrimary,
              titleSpacing: 0.0,
              toolbarHeight: showPrimary ? 50.0 : 50.0,
              title: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: showPrimary ? 0.0 : 15.0,
                  vertical: showPrimary ? 0.0 : 0.0,
                ),
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: ((context) => const SearchPage())));
                  },
                  child: const CustomInputField(
                    elevation: 0.0,
                    enabled: false,
                    inputType: TextInputType.none,
                    icon: Icon(Icons.search),
                    labelText: 'Search Products',
                    hintText: 'Search Products',
                  ),
                ),
              ),
            )
          ];
        },
        body: Scaffold(
          backgroundColor: const Color.fromARGB(255, 241, 239, 239),
          body: BlocProvider.value(
            value: getTagsBloc,
            child: BlocBuilder<ProductBloc, ProductBlocState>(
              bloc: getTagsBloc,
              builder: (context, productState) {
                if (productState is ProductLoadingState) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }

                if (productState is TagsLoadedState) {
                  return body(products: productState.tagsList);
                }

                return Container();
              },
            ),
          ),
          // bottomNavigationBar: const CartBottomBar(),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          floatingActionButton: _isMenuOpened
              ? Container()
              : Padding(
                  padding: const EdgeInsets.only(bottom: 30.0),
                  child: FloatingActionButton(
                    onPressed: _toggleMenu,
                    backgroundColor: Colors.black,
                    child: Icon(
                      Icons.grid_view, // Update this to match the design
                      color: Colors.white,
                      size: 30,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
          bottomNavigationBar:
              _isMenuOpened ? _buildStaticBottomBar() : SizedBox.shrink(),
        ));
  }

  Widget _buildStaticBottomBar() {
    return Material(
      color: Colors.transparent,
      // shape: CircularNotchedRectangle(),
      // surfaceTintColor: Colors.transparent,
      // notchMargin: 6.0,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: Container(
          height: 70,
          padding: EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
            color: Colors.grey[850],
            borderRadius: BorderRadius.circular(30),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.grid_view, color: Colors.white),
                onPressed: _toggleMenu,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.home, color: Colors.white),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: Icon(Icons.shopping_bag, color: Colors.white),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: Icon(Icons.favorite, color: Colors.white),
                    onPressed: () {},
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget body({required List<TagContent> products}) {
  return ListView.separated(
    itemBuilder: (context, index) {
      final tag = products[index];

      return CustomProductContainer(
        fromTags: true,
        text: tag.name.toString(),
        isScrollable: false,
        showQuantity: 6,
        tagId: tag.id,
        storeIds: 2,
        categoryList: 1,
      );
    },
    itemCount: products.length,
    separatorBuilder: ((context, index) => Decorations.height15),
    padding: const EdgeInsets.all(15.0),
    // children: const [
    //   CustomProductContainer(
    //     text: 'Featured',
    //     isScrollable: false,
    //     showQuantity: 6,
    //   ),
    //   SliverBar1(
    //     siderId: 94,
    //   ),
    // ],
  );
}
