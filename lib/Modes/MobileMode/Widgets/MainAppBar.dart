import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:monstersmoke/Modes/MobileMode/MobileMode.dart';
import 'package:monstersmoke/dashboard/dashboard.dart';
import 'package:monstersmoke/features/Auth/presentation/pages/AuthActionPage.dart';
import 'package:monstersmoke/features/Customer/presentation/bloc/GetCustomerBloc/customer_bloc_bloc.dart';
import 'package:monstersmoke/features/GETAssets/presentation/bloc/SliderBloc/slider_bloc_bloc.dart';

class MainAppBar extends StatefulWidget {
  const MainAppBar({super.key});

  @override
  State<MainAppBar> createState() => _MainAppBarState();
}

class _MainAppBarState extends State<MainAppBar> {
  late SliderBloc bloc;

  @override
  void initState() {
    bloc = BlocProvider.of<SliderBloc>(context);
    bloc.add(const GetSliderEvent(sliderId: '94', buissnessId: '1'));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: false,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      centerTitle: true,
      toolbarHeight: 80,
      leading: IconButton(onPressed: onMenu, icon: const Icon(Icons.menu)),
      title: const Image(
          width: 100,
          height: 100,
          image: AssetImage('images/monsterimage.jpg')),
      // bottom: const PreferredSize(
      //     preferredSize: Size(double.infinity, 40),
      //     child: CustomInputField(labelText: 'Search', hintText: 'Search')),
      actions: [
        IconButton(
            onPressed: () => _onMoveToAuthPage(context),
            icon: const Icon(Icons.person))
      ],
    );
  }

  void onMenu() {
    globalKey.currentState?.openDrawer();
  }

  void _onMoveToAuthPage(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) {
          return BlocBuilder<CustomerBloc, CustomerBlocState>(
            builder: (context, customerState) {
              if (customerState is CustomerCompletedState) {
                return const CustomerDashboard();
              } else {
                return const AuthActionPage();
              }
            },
          );
        },
      ),
    );
  }
}
