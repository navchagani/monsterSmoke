import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:monstersmoke/Decorations/Decorations.dart';
import 'package:monstersmoke/Modes/MobileMode/Widgets/AppBars.dart';
import 'package:monstersmoke/Modes/MobileMode/Widgets/MainAppBar.dart';
import 'package:monstersmoke/cartPage.dart';
import 'package:monstersmoke/core/widgets/CustomIniputField.dart';
import 'package:monstersmoke/core/widgets/CustomProductContainer.dart';
import 'package:monstersmoke/features/Search/presentation/pages/SearchPage.dart';

GlobalKey<ScaffoldState> globalKey = GlobalKey<ScaffoldState>();

class MobileViewMode extends StatelessWidget {
  const MobileViewMode({super.key});

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
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
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            shadowColor: Colors.black,
            elevation: 50.0,
            pinned: true,
            primary: false,
            titleSpacing: 0.0,
            toolbarHeight: 50.0,
            title: Padding(
              padding:
                  const EdgeInsets.only(left: 15.0, right: 15.0, bottom: 5.0),
              child: CustomInputField(
                elevation: 1.0,
                enabled: true,
                inputType: TextInputType.none,
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: ((context) => const SearchPage())));
                },
                icon: const Icon(Icons.search),
                labelText: 'Search Products',
                hintText: 'Search Products',
              ),
            ),
          )
        ];
      },
      body: Scaffold(
        backgroundColor: Colors.white,
        // appBar: appBar(context: context),
        body: body(),
        bottomNavigationBar: floatButton(context: context),
      ),
    );
  }

  Widget floatButton({required BuildContext context}) => FloatingActionButton(
        onPressed: () => onMovetoCart(context: context),
        isExtended: true,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.shopping_cart,
              color: Theme.of(context).colorScheme.background,
            ),
            Decorations.width10,
            Text(
              'Your Cart',
              style: TextStyle(
                  color: Theme.of(context).colorScheme.background,
                  fontSize: 20),
            )
          ],
        ),
      );

  Widget body() {
    return ListView(
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

  void onMovetoCart({required BuildContext context}) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: ((context) => const CartPage())));
  }
}
