import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:monstersmoke/DashboardPathBuilder.dart';
import 'package:monstersmoke/core/blocs/CustomBlocs.dart';
import 'package:monstersmoke/features/Customer/presentation/bloc/GetCustomerBloc/customer_bloc_bloc.dart';

class DashboardDrawer extends StatefulWidget {
  const DashboardDrawer({super.key});

  @override
  State<DashboardDrawer> createState() => _DashboardDrawerState();
}

class _DashboardDrawerState extends State<DashboardDrawer> {
  @override
  Widget build(BuildContext context) {
    CustomerBloc customer = BlocProvider.of<CustomerBloc>(context);

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          SizedBox(
            height: 250,
            child: DrawerHeader(
              decoration: const BoxDecoration(
                color: Color(0xff202b38),
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const CircleAvatar(
                      radius: 40,
                      backgroundImage: NetworkImage(
                          'https://img.freepik.com/premium-vector/anonymous-user-circle-icon-vector-illustration-flat-style-with-long-shadow_520826-1931.jpg'),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      customer.state.customerModel!.name ?? "No Name",
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                    Text(
                      customer.state.customerModel!.email ?? "No Email",
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          BlocBuilder<DashboardPathBloc, String?>(
            builder: (context, path) {
              return Column(
                children: [
                  _buildListTile(
                      context: context,
                      title: 'Home',
                      icon: Icons.home,
                      isActive: path == 'Home',
                      onTap: () => Navigator.popUntil(
                          context, (route) => route.isFirst)),
                  _buildListTile(
                    context: context,
                    title: 'Dashboard',
                    icon: Icons.dashboard,
                    isActive: path == 'Dashboard',
                    onTap: () => changePath(context, 'Dashboard'),
                  ),
                  _buildListTile(
                    context: context,
                    title: 'Profile',
                    icon: Icons.person,
                    isActive: path == 'Profile',
                    onTap: () => changePath(context, 'Profile'),
                  ),
                  _buildListTile(
                    context: context,
                    title: 'Addresses',
                    icon: Icons.location_on,
                    isActive: path == 'Addresses',
                    onTap: () => changePath(context, 'Addresses'),
                  ),
                  _buildListTile(
                    context: context,
                    title: 'Change Password',
                    icon: Icons.lock,
                    isActive: path == 'Change Password',
                    onTap: () => changePath(context, 'Change Password'),
                  ),
                  _buildListTile(
                    context: context,
                    title: 'Statement',
                    icon: Icons.receipt,
                    isActive: path == 'Statement',
                    onTap: () => changePath(context, 'Statement'),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }

  ListTile _buildListTile({
    required BuildContext context,
    required String title,
    required IconData icon,
    required bool isActive,
    required VoidCallback onTap,
  }) {
    return ListTile(
      title: Text(
        title,
        style: TextStyle(
          fontSize: 15,
          color:
              isActive ? const Color.fromARGB(255, 171, 29, 48) : Colors.black,
        ),
      ),
      leading: Icon(
        icon,
        color: isActive ? const Color.fromARGB(255, 171, 29, 48) : Colors.black,
      ),
      onTap: onTap,
    );
  }
}
