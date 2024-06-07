import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:monstersmoke/DashboardPathBuilder.dart';
import 'package:monstersmoke/Modes/MobileMode/MobileMode.dart';
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
    return BlocBuilder<CustomerBloc, CustomerBlocState>(
        builder: (context, customerState) {
      return SliverAppBar(
        pinned: false,
        backgroundColor: Color.fromARGB(255, 241, 239, 239),
        centerTitle: true,
        toolbarHeight: 80,
        leading: IconButton(onPressed: onMenu, icon: const Icon(Icons.menu)),
        title: const Image(
            width: 100,
            height: 100,
            image: AssetImage('images/monsterimage.jpg')),
        actions: [
          IconButton(
              icon: const Icon(Icons.person),
              onPressed: customerState.customerModel != null
                  ? () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const DashboardPathBuilder()))
                  : () => showDialog(
                        context: context,
                        barrierDismissible: false,
                        builder: (context) => Dialog(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: const SizedBox(
                            height: 600,
                            width: 600,
                            child: Card(child: AuthActionPage()),
                          ),
                        ),
                      )),
        ],
      );
    });
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
                return const DashboardPathBuilder();
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
