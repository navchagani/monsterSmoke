import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:monstersmoke/core/blocs/CustomBlocs.dart';
import 'package:monstersmoke/features/Dashboard/presentation/pages/changepassword.dart';
import 'package:monstersmoke/features/Dashboard/presentation/pages/dashboard.dart';
import 'package:monstersmoke/features/Dashboard/presentation/pages/dashboardDrawer.dart';
import 'package:monstersmoke/features/Dashboard/presentation/pages/statement.dart';
import 'package:monstersmoke/features/Dashboard/presentation/pages/userAddress.dart';
import 'package:monstersmoke/features/Dashboard/presentation/pages/userProfile.dart';

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
        title: BlocBuilder<DashboardPathBloc, String?>(
          builder: (context, path) {
            return Text(
              path ?? 'Dashboard',
              style: const TextStyle(
                fontSize: 17,
                color: Colors.white,
              ),
            );
          },
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
      body: BlocBuilder<DashboardPathBloc, String?>(builder: ((context, path) {
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
      })),
    );
  }
}

void changePath(BuildContext context, String path) {
  Navigator.of(context).pop();
  DashboardPathBloc bloc = BlocProvider.of(context);
  bloc.add(
    path,
  );
}
