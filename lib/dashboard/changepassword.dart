import 'package:flutter/material.dart';
import 'package:monstersmoke/core/widgets/CustomButton.dart';
import 'package:monstersmoke/core/widgets/CustomIniputField.dart';
import 'package:monstersmoke/dashboard/dashboard.dart';
import 'package:monstersmoke/dashboard/dashboardDrawer.dart';

class Changepassword extends StatefulWidget {
  const Changepassword({super.key});

  @override
  State<Changepassword> createState() => _ChangepasswordState();
}

class _ChangepasswordState extends State<Changepassword> {
  TextEditingController currentPassword = TextEditingController();
  TextEditingController newPassword = TextEditingController();
  TextEditingController conformPassword = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Change Password',
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
          ),
          backgroundColor: const Color(0xff202b38),
        ),
        drawer: const DashboardDrawer(),
        body: SingleChildScrollView(
            child: Column(children: [
          Container(
            decoration: const BoxDecoration(
              color: Color(0xff202b38),
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(50),
              ),
            ),
            child: Column(
              children: [
                const SizedBox(height: 50),
                ListTile(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 30),
                  title: Text(
                    'Change Your Password',
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium
                        ?.copyWith(color: Colors.white),
                  ),
                  trailing: const CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.lock,
                      size: 30,
                      color: Colors.black,
                    ),
                  ),
                ),
                const SizedBox(height: 50)
              ],
            ),
          ),
          const SizedBox(height: 50),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                CustomInputField(
                  labelText: 'Current Password',
                  hintText: "Current Password",
                  controller: currentPassword,
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomInputField(
                    labelText: 'New Password',
                    controller: newPassword,
                    hintText: "New Password"),
                const SizedBox(
                  height: 10,
                ),
                CustomInputField(
                  controller: conformPassword,
                  labelText: 'Conform Your Password',
                  hintText: "Conform Your Password",
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomButton(
                  onTap: () {},
                  text: 'Change Password',
                  backgroundColor: const Color(0xff202b38),
                  textColor: Colors.white,
                )
              ],
            ),
          ),
        ])));
  }
}
