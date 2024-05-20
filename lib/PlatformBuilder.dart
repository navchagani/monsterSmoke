import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:monstersmoke/Decorations/Decorations.dart';
import 'package:monstersmoke/Modes/MobileMode/MobileMode.dart';
import 'package:monstersmoke/Modes/TabMode.dart';
import 'package:monstersmoke/dashboard/changepassword.dart';
import 'package:monstersmoke/dashboard/dashboard.dart';
import 'package:monstersmoke/dashboard/statement.dart';
import 'package:monstersmoke/features/Auth/presentation/pages/AuthActionPage.dart';
import 'package:monstersmoke/features/Customer/presentation/bloc/GetCustomerBloc/customer_bloc_bloc.dart';
import 'package:monstersmoke/features/Products/data/models/updateCartModel.dart';

class PlatformBuilder extends StatelessWidget {
  const PlatformBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: globalKey,
      drawer: appDrawer(context: context),
      body: LayoutBuilder(builder: (context, constraints) {
        final isMobile = constraints.maxWidth > 600 ? false : true;
        if (isMobile) {
          return const CustomerDashboard();
        }

        return const TabMode();
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

  Widget appDrawer({required BuildContext context}) {
    return Padding(
      padding:
          const EdgeInsets.only(left: 5, bottom: 15.0, top: 35, right: 100.0),
      child: Drawer(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        surfaceTintColor: Colors.transparent,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                userData(),
                Decorations.height15,
                menus(),
                const Spacer(),
                footer()
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget menus() {
    final list = [
      ListTile(
        dense: true,
        title: const Text('Account'),
        onTap: onMoveToAccount,
      ),
      ListTile(
          dense: true, title: const Text('About Us'), onTap: onMoveToAbout),
      ListTile(dense: true, title: const Text('FAQ\'S'), onTap: onMoveToFaq),
      ListTile(dense: true, title: const Text('Policy'), onTap: onMoveToPolicy),
      ListTile(dense: true, title: const Text('Policy'), onTap: onMoveToPolicy),
    ];

    return Material(
      color: Colors.white,
      elevation: 2.0,
      borderRadius: const BorderRadius.all(Radius.circular(5.0)),
      child: ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          return list[index];
        },
        separatorBuilder: (BuildContext context, int index) {
          return const Divider();
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
              color: Colors.white,
              elevation: 2.0,
              borderRadius: const BorderRadius.all(Radius.circular(5.0)),
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
                                'Email ${customerState.customerModel.email.toString()}'),
                            Text(
                                'Phone ${customerState.customerModel.phone.toString()}'),
                            Decorations.height15,
                            Text(
                                'Company ${customerState.customerModel.company.toString()}')
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

  void onMoveToAccount() {}

  void onMoveToAbout() {}

  void onMoveToPolicy() {}

  void onMoveToFaq() {}
}
