import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:monstersmoke/core/widgets/CustomIniputField.dart';
import 'package:monstersmoke/core/widgets/CustomProductContainer.dart';
import 'package:monstersmoke/core/widgets/CustomSlider.dart';
import 'package:monstersmoke/features/Auth/presentation/bloc/SignUpBloc/sign_up_bloc_bloc.dart';
import 'package:monstersmoke/features/Auth/presentation/pages/AuthActionPage.dart';
import 'package:monstersmoke/features/Auth/presentation/pages/Login.dart';

class MobileViewMode extends StatelessWidget {
  const MobileViewMode({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context: context),
      body: body(),
      floatingActionButton: floatButton(),
    );
  }

  Widget floatButton() => FloatingActionButton.small(
        onPressed: onMovetoCart,
        child: const Icon(Icons.shopping_cart),
      );

  AppBar appBar({required BuildContext context}) => AppBar(
        toolbarHeight: 80,
        leading: IconButton(onPressed: onMenu, icon: const Icon(Icons.menu)),
        title: const Image(
            width: 100,
            height: 100,
            image: AssetImage('images/monsterimage.jpg')),
        bottom: const PreferredSize(
            preferredSize: Size(double.infinity, 40),
            child: CustomInputField(labelText: 'Search', hintText: 'Search')),
        actions: [
          IconButton(
              onPressed: () => onMoveToAuthPage(context: context),
              icon: Icon(Icons.person))
        ],
        // title: Text('data'),
      );

  Widget body() {
    final images = [
      "https://via.placeholder.com/1200x600.png?text=Product+1",
      "https://via.placeholder.com/1200x600.png?text=Product+2",
      "https://via.placeholder.com/1200x600.png?text=Product+3",
      "https://via.placeholder.com/1200x600.png?text=Product+4"
    ];
    return ListView(
      children: [
        CustomSlider(images: images),
        CustomProductContainer(productList: images, text: 'Featured')
      ],
    );
  }

  void onMenu() {}

  void onMovetoCart() {}

  void onMoveToAuthPage({required BuildContext context}) {
    Navigator.of(context).push(
        MaterialPageRoute(builder: ((context) => const AuthActionPage())));
  }
}
