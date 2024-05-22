import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:monstersmoke/Modes/MobileMode/Widgets/AppBars.dart';
import 'package:monstersmoke/Modes/MobileMode/Widgets/MainAppBar.dart';
import 'package:monstersmoke/core/inject.dart';
import 'package:monstersmoke/core/widgets/CustomIniputField.dart';
import 'package:monstersmoke/core/widgets/CustomProductContainer.dart';
import 'package:monstersmoke/features/Cart/presentation/widgets/CartBottomBar.dart';
import 'package:monstersmoke/features/Cart/presentation/widgets/CartFloatingButton.dart';
import 'package:monstersmoke/features/Products/presentation/bloc/Productbloc/product_bloc_bloc.dart';
import 'package:monstersmoke/features/Search/presentation/pages/SearchPage.dart';

GlobalKey<ScaffoldState> globalKey = GlobalKey<ScaffoldState>();

class MobileViewMode extends StatefulWidget {
  const MobileViewMode({super.key});

  @override
  State<MobileViewMode> createState() => _MobileViewModeState();
}

class _MobileViewModeState extends State<MobileViewMode> {
  late ScrollController scrollController;
  bool showPrimary = false;
  final getTagsBloc = getIt<ProductBloc>();

  @override
  void initState() {
    ProductBloc bloc = BlocProvider.of(context);
    bloc.add(const GetTagsEvent());

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
            // const SliverAppBar(
            //   automaticallyImplyLeading: false,
            //   toolbarHeight: 140,
            //   flexibleSpace: FlexibleSpaceBar(
            //       background: SliverBar1(
            //     axis: Axis.vertical,
            //     siderId: 86,
            //   )),
            // ),
            SliverAppBar(
              automaticallyImplyLeading: false,
              backgroundColor: showPrimary
                  ? Theme.of(context).colorScheme.background
                  : Theme.of(context).scaffoldBackgroundColor,
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
        body: BlocBuilder<ProductBloc, ProductBlocState>(
          builder: (context, productState) {
            return Scaffold(
              body: body(),
              bottomNavigationBar: const CartBottomBar(),
              floatingActionButton: const CartFloatButton(
                fromHome: true,
              ),
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.endDocked,
            );
            // if (productState is TagsLoadedState) {
            //   for (var element in productState.tagsList) {
            //     getTagsBloc.add(GetTagProductEvents(
            //         tagId: element.id,
            //         page: 0,
            //         size: 10,
            //         storeIds: 2,
            //         buisnessTypeId: 1));
            //   }
            // }
          },
        ));
  }

  Widget body() {
    return ListView(
      padding: const EdgeInsets.all(15.0),
      children: const [
        CustomProductContainer(
          text: 'Featured',
          isScrollable: false,
          showQuantity: 6,
        ),
        SliverBar1(
          siderId: 94,
        ),
      ],
    );
  }
}
