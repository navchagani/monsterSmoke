import 'package:flutter/material.dart';
import 'package:monstersmoke/Decorations/Decorations.dart';
import 'package:monstersmoke/cartPage.dart';
import 'package:monstersmoke/core/widgets/CustomIniputField.dart';
import 'package:monstersmoke/core/widgets/CustomProductContainer.dart';
import 'package:monstersmoke/features/Auth/presentation/pages/AuthActionPage.dart';
import 'package:monstersmoke/features/Search/presentation/pages/SearchPage.dart';

class TabMode extends StatefulWidget {
  const TabMode({super.key});

  @override
  State<TabMode> createState() => _TabModeState();
}

class _TabModeState extends State<TabMode> {
  GlobalKey<ScaffoldState> scaffoldState = GlobalKey<ScaffoldState>();
  bool showFilter = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldState,
      drawer: appDrawer(),
      appBar: appBar(),
      body: body(),
    );
  }

  final list = [
    "https://via.placeholder.com/1200x600.png?text=Product+1",
    "https://via.placeholder.com/1200x600.png?text=Product+2",
    "https://via.placeholder.com/1200x600.png?text=Product+3",
    "https://via.placeholder.com/1200x600.png?text=Product+4"
  ];

  Widget body() => Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                Column(
                  children: [
                    const SizedBox(
                      height: 100,
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: ListView(
                              shrinkWrap: true,
                              children: const [
                                // CustomSlider(images: list),
                                SizedBox(
                                  height: 25.0,
                                ),
                                CustomProductContainer(text: 'Whats New'),
                                CustomProductContainer(
                                    text: 'Featured Product'),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Decorations.height15,
                PreferredSize(
                  preferredSize: const Size(double.infinity, 70),
                  child: Hero(
                    tag: 'search',
                    child: SizedBox(
                      width: 500,
                      child: CustomInputField(
                        elevation: 10.0,
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
                  ),
                ),
                // Row(
                //   children: [
                //     Material(
                //       color: !showFilter ? Colors.grey.shade200 : null,
                //       elevation: showFilter ? 30.0 : 0.0,
                //       child: InkWell(
                //         onTap: () {
                //           setState(() {
                //             showFilter = !showFilter;
                //           });
                //         },
                //         child: Padding(
                //           padding: const EdgeInsets.all(10.0),
                //           child: AnimatedContainer(
                //             duration: const Duration(seconds: 1),
                //             child: Center(
                //               child: Icon(showFilter
                //                   ? Icons.keyboard_arrow_left
                //                   : Icons.keyboard_arrow_right),
                //             ),
                //           ),
                //         ),
                //       ),
                //     ),
                //     // if (showFilter)
                //     //   SizedBox(
                //     //     width: 250,
                //     //     child: Material(
                //     //       elevation: 20.0,
                //     //       child: Column(
                //     //         children: [
                //     //           ListTile(
                //     //             onTap: () {
                //     //               setState(() {
                //     //                 showFilter = false;
                //     //               });
                //     //             },
                //     //             title: const Text('Vapour'),
                //     //           )
                //     //         ],
                //     //       ),
                //     //     ),
                //     //   ),
                //     // if (showFilter)
                //     //   SizedBox(
                //     //     width: 250,
                //     //     child: Material(
                //     //       elevation: 20.0,
                //     //       child: Column(
                //     //         children: [
                //     //           ListTile(
                //     //             onTap: () {
                //     //               setState(() {
                //     //                 showFilter = false;
                //     //               });
                //     //             },
                //     //             title: const Text('Vapour'),
                //     //           )
                //     //         ],
                //     //       ),
                //     //     ),
                //     //   )
                //   ],
                // )
              ],
            ),
          ),
        ],
      );

  Widget appDrawer() => const Drawer(
        child: Column(
          children: [],
        ),
      );

  AppBar appBar() => AppBar(
        surfaceTintColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        toolbarHeight: 100,
        leading: IconButton(
            onPressed: () {
              scaffoldState.currentState?.openDrawer();
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
                  onPressed: onCart, icon: const Icon(Icons.shopping_cart)),
              IconButton(
                  onPressed: onSignUp,
                  icon: const Icon(Icons.person_3_rounded)),
            ],
          )
        ],
      );

  void onSignUp() {
    showDialog(
        context: context,
        builder: ((context) => const Dialog(child: AuthActionPage())));
  }

  void onCart() {
    // Navigator.of(context).push(MaterialPageRoute(
    //     builder: ((context) => const CartPage(
    //           model: null,
    //         ))));
  }
}
