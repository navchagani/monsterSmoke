import 'package:flutter/material.dart';
import 'package:monstersmoke/Modes/MobileMode/Widgets/AppBars.dart';
import 'package:monstersmoke/Modes/MobileMode/Widgets/MainAppBar.dart';
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
          // const SliverBar1(
          //   siderId: 86,
          // ),
          const SliverBar1(
            axis: Axis.vertical,
            siderId: 86,
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
            title: CustomInputField(
              inputType: TextInputType.none,
              labelText: 'Search',
              hintText: 'Search',
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: ((context) => const SearchPage())));
              },
            ),
          )
        ];
      },
      body: Scaffold(
        backgroundColor: Colors.grey.shade200,
        // appBar: appBar(context: context),
        body: body(),
        floatingActionButton: floatButton(),
      ),
    );
  }

  Widget floatButton() => FloatingActionButton(
        onPressed: onMovetoCart,
        child: const Icon(Icons.shopping_cart),
      );

  Widget body() {
    final images = [
      "https://via.placeholder.com/1200x600.png?text=Product+1",
      "https://via.placeholder.com/1200x600.png?text=Product+2",
      "https://via.placeholder.com/1200x600.png?text=Product+3",
      "https://via.placeholder.com/1200x600.png?text=Product+4"
    ];
    return ListView(
      children: [CustomProductContainer(productList: images, text: 'Featured')],
    );
  }

  void onMovetoCart() {}
}
