import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:monstersmoke/DashboardPathBuilder.dart';
import 'package:monstersmoke/Decorations/Decorations.dart';
import 'package:monstersmoke/Modes/MobileMode/MobileMode.dart';
import 'package:monstersmoke/Modes/MobileMode/Widgets/AppBars.dart';
import 'package:monstersmoke/Modes/MobileMode/Widgets/MainAppBar.dart';
import 'package:monstersmoke/cartPage.dart';
import 'package:monstersmoke/core/blocs/CartBloc.dart';
import 'package:monstersmoke/core/inject.dart';
import 'package:monstersmoke/core/widgets/CustomIniputField.dart';
import 'package:monstersmoke/core/widgets/CustomProductContainer.dart';
import 'package:monstersmoke/features/Auth/presentation/pages/AuthActionPage.dart';
import 'package:monstersmoke/features/Cart/presentation/bloc/cart_bloc.dart';
import 'package:monstersmoke/features/Customer/presentation/bloc/GetCustomerBloc/customer_bloc_bloc.dart';
import 'package:monstersmoke/features/Products/data/models/TagProductModel.dart';
import 'package:monstersmoke/features/Products/presentation/bloc/Productbloc/product_bloc_bloc.dart';
import 'package:monstersmoke/features/Search/presentation/pages/SearchPage.dart';

class TabViewMode extends StatefulWidget {
  const TabViewMode({super.key});

  @override
  State<TabViewMode> createState() => _TabViewModeState();
}

class _TabViewModeState extends State<TabViewMode> {
  GlobalKey<ScaffoldState> scaffoldState = GlobalKey<ScaffoldState>();
  bool showFilter = false;
  late ScrollController scrollController;
  bool showPrimary = false;
  final getTagsBloc = getIt<ProductBloc>();
  bool _isMenuOpened = false;

  void _toggleMenu() {
    setState(() {
      _isMenuOpened = !_isMenuOpened;
    });
  }

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
    return BlocBuilder<CustomerBloc, CustomerBlocState>(
        builder: (context, customerState) {
      return LayoutBuilder(builder: (context, constraints) {
        final mobile = constraints.maxWidth > 600 ? false : true;

        return NestedScrollView(
          controller: scrollController,
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return [
              const MainAppBar(),
              SliverAppBar(
                automaticallyImplyLeading: false,
                toolbarHeight: mobile ? 140 : 360,
                flexibleSpace: FlexibleSpaceBar(
                    background: SliverBar1(
                  axis: Axis.vertical,
                  siderId: 86,
                )),
              ),
            ];
          },
          body: Scaffold(
            backgroundColor: const Color.fromARGB(255, 241, 239, 239),
            // key: scaffoldState,
            // appBar: appBar(isSignedIn),
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
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            floatingActionButton: _isMenuOpened
                ? Container()
                : Padding(
                    padding: EdgeInsets.only(bottom: mobile ? 30 : 50),
                    child: FloatingActionButton(
                      onPressed: _toggleMenu,
                      backgroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Icon(
                        Icons.grid_view,
                        color: Colors.white,
                        size: mobile ? 30 : 40,
                      ),
                    ),
                  ),
            bottomNavigationBar: _isMenuOpened
                ? _buildStaticBottomBar()
                : const SizedBox.shrink(),
          ),
        );
      });
    });
  }

  Widget _buildStaticBottomBar() {
    final bloc = BlocProvider.of<LocalCartBloc>(context);

    return LayoutBuilder(builder: (context, constraints) {
      final mobile = constraints.maxWidth > 600 ? false : true;

      return BlocBuilder<CustomerBloc, CustomerBlocState>(
          builder: (context, customerState) {
        return BlocBuilder<LocalCartBloc, LocalCartState>(
            bloc: bloc,
            builder: (context, state) {
              return Material(
                color: Colors.transparent,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: mobile ? 30 : 80),
                  child: Container(
                    height: mobile ? 70 : 80,
                    padding:
                        EdgeInsets.symmetric(horizontal: mobile ? 20 : 100),
                    decoration: BoxDecoration(
                      color: Colors.grey[850],
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        IconButton(
                          icon: Icon(
                            Icons.home,
                            color: Colors.white,
                            size: mobile ? 20 : 30,
                          ),
                          onPressed: _toggleMenu,
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.search_rounded,
                            size: mobile ? 20 : 30,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: ((context) => const SearchPage())));
                          },
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.shopping_bag,
                            size: mobile ? 20 : 30,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            if (customerState.customerModel == null) {
                              showDialog(
                                context: context,
                                barrierDismissible: false,
                                builder: (context) => Dialog(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(30),
                                    child: Container(
                                      height: 630,
                                      width: 630,
                                      color: Colors.white,
                                      child: AuthActionPage(),
                                    ),
                                  ),
                                ),
                              );
                            } else {
                              final cartBloc = getIt<CartBloc>();
                              cartBloc.add(const GetCartEvent(storeId: '2'));
                              cartBloc.stream.listen((cartState) {
                                if (cartState is CartLoadedState) {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => const CartPage()));
                                  BlocProvider.of<LocalCartBloc>(context)
                                      .add(LocalCartClearProductEvent());
                                }
                              });
                            }
                          },
                        ),
                        IconButton(
                            icon: Icon(
                              Icons.person_2_rounded,
                              size: mobile ? 20 : 30,
                              color: Colors.white,
                            ),
                            onPressed: customerState.customerModel != null
                                ? () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const DashboardPathBuilder()))
                                : () => showDialog(
                                      context: context,
                                      barrierDismissible: false,
                                      builder: (context) => Dialog(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20.0),
                                        ),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(30),
                                          child: Container(
                                            height: 630,
                                            width: 630,
                                            color: Colors.white,
                                            child: AuthActionPage(),
                                          ),
                                        ),
                                      ),
                                    )),
                      ],
                    ),
                  ),
                ),
              );
            });
      });
    });
  }

  Widget body({required List<TagContent> products}) {
    return Column(
      children: [
        Expanded(
          child: ListView.separated(
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
            separatorBuilder: (context, index) => Decorations.height15,
            padding: const EdgeInsets.all(15.0),
          ),
        ),
      ],
    );
  }

  Widget appDrawer() => const Drawer(
        child: Column(
          children: [],
        ),
      );

  AppBar appBar(bool signedIn) => AppBar(
        surfaceTintColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        toolbarHeight: 100,
        leading: IconButton(
            onPressed: () {
              globalKey.currentState?.openDrawer();
            },
            icon: const Icon(Icons.menu)),
        title: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.0),
          child: Image(
              width: 200,
              height: 200,
              image: AssetImage('images/monsterimage.jpg')),
        ),
        actions: [
          Wrap(
            children: [
              IconButton(
                  icon: const Icon(
                    Icons.person_2_rounded,
                  ),
                  onPressed: signedIn
                      ? () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const DashboardPathBuilder()))
                      : () => showDialog(
                            context: context,
                            barrierDismissible: false,
                            builder: (context) => Dialog(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(30),
                                child: Container(
                                  height: 630,
                                  width: 630,
                                  color: Colors.white,
                                  child: AuthActionPage(),
                                ),
                              ),
                            ),
                          )),
            ],
          )
        ],
      );

  void onSignUp() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: Container(
            height: 630,
            width: 630,
            color: Colors.white,
            child: AuthActionPage(),
          ),
        ),
      ),
    );
  }

  void onCart() {
    // Implement navigation to cart page if needed
  }
}
