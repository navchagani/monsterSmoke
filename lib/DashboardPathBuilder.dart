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
    return Scaffold(
      key: globalDashboardKey,
      drawer: const DashboardDrawer(),
      appBar: AppBar(
          backgroundColor: const Color(0xff202b38),
          title: const Text(
            'Dashboard',
            style: TextStyle(
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
          )),
      body: BlocBuilder<DashboardPathBloc, String?>(builder: ((context, path) {
        if (path == 'dashboard') {
          return const CustomerDashboard();
        }

        if (path == 'profile') {
          return const UserProfile();
        }

        if (path == 'address') {
          return const UserAddresses();
        }

        if (path == 'password') {
          return const Changepassword();
        }

        if (path == 'statement') {
          return const UserStatement();
        }

        return Container();
      })),
    );
  }
}

void changePath(BuildContext context, String path) {
  Navigator.of(context).pop();
  DashboardPathBloc bloc = BlocProvider.of(context);
  bloc.add(path);
}
