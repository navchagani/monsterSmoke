import 'package:flutter/material.dart';
import 'package:monstersmoke/core/widgets/CustomIniputField.dart';
import 'package:monstersmoke/core/widgets/CustomSlider.dart';

class MobileViewMode extends StatelessWidget {
  const MobileViewMode({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: body(),
      floatingActionButton: floatButton(),
    );
  }

  Widget floatButton() => FloatingActionButton(
        onPressed: onMovetoCart,
        child: const Icon(Icons.shopping_cart),
      );

  AppBar appBar() => AppBar(
        toolbarHeight: 80,
        leading: IconButton(onPressed: onMenu, icon: const Icon(Icons.menu)),
        title: const Image(
            width: 100,
            height: 100,
            image: AssetImage('images/monsterimage.jpg')),
        bottom: const PreferredSize(
            preferredSize: Size(double.infinity, 40),
            child: CustomInputField(labelText: 'Search', hintText: 'Search')),
        // title: Text('data'),
      );

  Widget body() {
    final images = [
      "https://via.placeholder.com/1200x600.png?text=Product+1",
      "https://via.placeholder.com/1200x600.png?text=Product+2",
      "https://via.placeholder.com/1200x600.png?text=Product+3",
      "https://via.placeholder.com/1200x600.png?text=Product+4"
    ];
    return Column(
      children: [CustomSlider(images: images)],
    );
  }

  void onMenu() {}

  void onMovetoCart() {}
}
