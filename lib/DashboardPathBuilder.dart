import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:monstersmoke/core/blocs/CustomBlocs.dart';
import 'package:monstersmoke/dashboard/changepassword.dart';
import 'package:monstersmoke/dashboard/dashboard.dart';
import 'package:monstersmoke/dashboard/dashboardDrawer.dart';
import 'package:monstersmoke/dashboard/statement.dart';
import 'package:monstersmoke/dashboard/userAddress.dart';
import 'package:monstersmoke/dashboard/userProfile.dart';

GlobalKey<ScaffoldState> globalDashboardKey = GlobalKey<ScaffoldState>();

class DashboardPathBuilder extends StatelessWidget {
  const DashboardPathBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DashboardPathBloc, String?>(builder: ((context, path) {
      return Scaffold(
        key: globalDashboardKey,
        drawer: const DashboardDrawer(),
        appBar: AppBar(
          backgroundColor: const Color(0xff202b38),
          title: Text(
            path ?? "",
            style: const TextStyle(
              fontSize: 17,
              color: Colors.white,
            ),
          ),
          leading: IconButton(
            icon: const Icon(
              Icons.menu,
              color: Colors.white,
            ),
            onPressed: () {
              globalDashboardKey.currentState?.openDrawer();
            },
          ),
        ),
        body: Builder(builder: (context) {
          if (path == 'Dashboard') {
            return const CustomerDashboard();
          }

          if (path == 'Profile') {
            return const UserProfile();
          }

          if (path == 'Addresses') {
            return const UserAddresses();
          }

          if (path == 'Change Password') {
            return const Changepassword();
          }
          if (path == 'Statement') {
            return const UserStatement();
          }

          return Container();
        }),
        // floatingActionButton: FloatingActionButton(
        //   backgroundColor: const Color(0xff202b38),
        //   foregroundColor: Colors.white,
        //   onPressed: () {},
        //   child: const Icon(
        //     Icons.menu_open_rounded,
        //     size: 35,
        //   ),
        // ),
      );
    }));
  }
}

void changePath(BuildContext context, String path) {
  Navigator.of(context).pop();
  DashboardPathBloc bloc = BlocProvider.of(context);
  bloc.add(path);
}
