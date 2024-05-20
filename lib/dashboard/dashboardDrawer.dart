import 'package:flutter/material.dart';
import 'package:monstersmoke/dashboard/changepassword.dart';
import 'package:monstersmoke/dashboard/dashboard.dart';
import 'package:monstersmoke/dashboard/statement.dart';
import 'package:monstersmoke/dashboard/userAddress.dart';
import 'package:monstersmoke/dashboard/userProfile.dart';

class DashboardDrawer extends StatefulWidget {
  const DashboardDrawer({super.key});

  @override
  State<DashboardDrawer> createState() => _DashboardDrawerState();
}

class _DashboardDrawerState extends State<DashboardDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const SizedBox(
            height: 250,
            child: DrawerHeader(
              decoration: BoxDecoration(
                color: Color(0xff202b38),
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 40,
                      backgroundImage: NetworkImage(
                          'https://img.freepik.com/premium-vector/anonymous-user-circle-icon-vector-illustration-flat-style-with-long-shadow_520826-1931.jpg'),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'User Name',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                    Text(
                      'user@example.com',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          ListTile(
            title: const Text(
              'Dashboard',
              style: TextStyle(fontSize: 15),
            ),
            leading: const Icon(Icons.dashboard),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const CustomerDashboard()));
            },
          ),
          ListTile(
            title: const Text(
              'Profile',
              style: TextStyle(fontSize: 15),
            ),
            leading: const Icon(Icons.person),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const UserProfile()));
            },
          ),
          ListTile(
            title: const Text(
              'Address List',
              style: TextStyle(fontSize: 15),
            ),
            leading: const Icon(Icons.location_on),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const UserAddresses()));
            },
          ),
          ListTile(
            title: const Text(
              'Change Password',
              style: TextStyle(fontSize: 15),
            ),
            leading: const Icon(Icons.lock),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const Changepassword()));
            },
          ),
          ListTile(
            title: const Text(
              'Statement',
              style: TextStyle(fontSize: 15),
            ),
            leading: const Icon(Icons.receipt),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const UserStatement()));
            },
          ),
        ],
      ),
    );
  }
}
