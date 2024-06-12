import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:monstersmoke/Decorations/Decorations.dart';
import 'package:monstersmoke/Modes/MobileMode/MobileMode.dart';
import 'package:monstersmoke/Modes/TabMode.dart';
import 'package:monstersmoke/core/widgets/CustomHtmlViewer.dart';
import 'package:monstersmoke/core/widgets/CustomLinkButton.dart';
import 'package:monstersmoke/features/Auth/presentation/pages/AuthActionPage.dart';
import 'package:monstersmoke/features/Customer/presentation/bloc/GetCustomerBloc/customer_bloc_bloc.dart';
import 'package:monstersmoke/features/Products/data/models/updateCartModel.dart';
import 'package:monstersmoke/features/sharedPrefsApi.dart';

class PlatformBuilder extends StatelessWidget {
  const PlatformBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      key: globalKey,
      drawer: appDrawer(context: context),
      body: LayoutBuilder(builder: (context, constraints) {
        final isMobile = constraints.maxWidth > 600 ? false : true;
        if (isMobile) {
          return const MobileViewMode();
        }

        return const TabViewMode();
      }),
    );
  }

  Widget bottomBar(
          {required BuildContext context,
          required UpdateCartModel updateCartModel}) =>
      BottomAppBar(
        height: 50,
        color: Theme.of(context).colorScheme.primary,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.shopping_cart,
              color: Theme.of(context).colorScheme.surface,
            ),
            Decorations.width10,
            Text(
              'Your Cart',
              style: TextStyle(
                  color: Theme.of(context).colorScheme.surface,
                  fontSize: 20),
            )
          ],
        ),
      );

  Widget appDrawer({required BuildContext context}) {
    return Padding(
      padding:
          const EdgeInsets.only(left: 5, bottom: 20.0, top: 20.0, right: 60.0),
      child: Drawer(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        surfaceTintColor: Colors.transparent,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              children: [
                userData(),
                Decorations.height10,
                menus(context),
                Decorations.height10,
                logoutButton(context),
                const Spacer(),
                footer(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget logoutButton(BuildContext context) {
    return Row(
      children: [
        CustomLinkButton(
          onTap: () => onLogout(context),
          text: 'Log Out',
          textColor: Colors.deepOrange,
        ),
        // Decorations.width5,
        const Icon(
          Icons.arrow_circle_right_outlined,
          color: Colors.deepOrange,
        )
      ],
    );
  }

  Widget menus(BuildContext context) {
    final list = [
      ListTile(
          dense: true,
          title: const Text('About Us'),
          onTap: () => onMoveToAbout(context)),
      ListTile(
          dense: true,
          title: const Text('Contact Us'),
          onTap: () => onMoveToCosntact(context)),
      ListTile(
          dense: true,
          title: const Text('FAQ\'S'),
          onTap: () => onMoveToFaq(context)),
      ListTile(
          dense: true,
          title: const Text('Policy'),
          onTap: () => onMoveToPolicy(context)),
    ];

    return Material(
      color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
      borderRadius: const BorderRadius.all(Radius.circular(10.0)),
      clipBehavior: Clip.hardEdge,
      child: ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          return list[index];
        },
        separatorBuilder: (BuildContext context, int index) {
          return const Divider(
            height: 0.0,
          );
        },
        itemCount: list.length,
      ),
    );
  }

  Widget footer() => const Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Copyright © Monster Smoke, Inc.',
            style: TextStyle(color: Colors.black),
          ),
          Text('All rights reserved.', style: TextStyle(color: Colors.black54)),
          Text(
              'FDA Disclaimer: These statements have not been evaluated by the Food and Drug Administration. These products are not intended to diagnose, treat, cure or prevent any disease.',
              style: TextStyle(color: Colors.black26))
        ],
      );

  Widget userData() => BlocBuilder<CustomerBloc, CustomerBlocState>(
          builder: ((context, customerState) {
        if (customerState is CustomerCompletedState) {
          return Material(
              color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
              // elevation: 5.0,
              borderRadius: const BorderRadius.all(Radius.circular(10.0)),
              clipBehavior: Clip.hardEdge,
              child: InkWell(
                onTap: () {},
                child: Padding(
                  padding: const EdgeInsets.all(13.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Row(
                              children: [Icon(Icons.person)],
                            ),
                            Decorations.height10,
                            Text(
                              'Name: ${customerState.customerModel.name.toString()}',
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                            Text(
                                'Email: ${customerState.customerModel.email.toString()}'),
                            Text(
                                'Phone: ${customerState.customerModel.phone.toString()}'),
                            Decorations.height15,
                            Text(
                                'Company: ${customerState.customerModel.company.toString()}')
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ));
        }

        return ListTile(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: ((context) => const AuthActionPage())));
          },
          title: const Text(
            'Sign In',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          trailing: const Icon(Icons.person),
        );
      }));

  void onMoveToAccount(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: ((context) => const HTMLViewer(
              title: 'contact-us',
            ))));
  }

  void onMoveToCosntact(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: ((context) => const HTMLViewer(
              title: 'contact-us',
            ))));
  }

  void onMoveToAbout(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: ((context) => const HTMLViewer(
              title: 'about-us',
            ))));
  }

  void onMoveToPolicy(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: ((context) => const HTMLViewer(
              title: 'return-policy',
            ))));
  }

  void onMoveToFaq(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: ((context) => const HTMLViewer(
              title: 'faqs',
            ))));
  }

  onLogout(BuildContext context) async {
    CustomerBloc bloc = BlocProvider.of(context);
    bloc.add(CustomerInitialEvent());

    final shared = SharedPrefsApi();
    await shared.removeFromShared(key: 'login');

    Navigator.of(context).pop();
  }
}
