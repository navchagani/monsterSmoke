import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:monstersmoke/Decorations/Decorations.dart';
import 'package:monstersmoke/core/inject.dart';
import 'package:monstersmoke/core/widgets/CustomButton.dart';
import 'package:monstersmoke/core/widgets/CustomDialog.dart';
import 'package:monstersmoke/core/widgets/CustomIniputField.dart';
import 'package:monstersmoke/features/Auth/presentation/bloc/changePassBloc/change_password_bloc_bloc.dart';

class Changepassword extends StatefulWidget {
  const Changepassword({super.key});

  @override
  State<Changepassword> createState() => _ChangepasswordState();
}

class _ChangepasswordState extends State<Changepassword> {
  bool showPass = true;
  bool onSwitchFP = false;

  TextEditingController currentPassword = TextEditingController();
  TextEditingController newPassword = TextEditingController();
  TextEditingController conformPassword = TextEditingController();
  final changePasswordBloc = getIt<ChangePasswordBloc>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
        value: changePasswordBloc,
        child: BlocListener<ChangePasswordBloc, ChangePasswordBlocState>(
          listener: (context, changePasswordstate) {
            if (changePasswordstate is ChangePasswordLoadingState) {
              CustomDialog(
                context: context,
                text: 'Changing Your Password..',
              ).showLoadingDialog();
            }
            if (changePasswordstate is PasswordChangedState) {
              CustomDialog(
                  context: context,
                  text: 'Password Changed Succesfully ..',
                  defaultButton: Align(
                    alignment: Alignment.bottomRight,
                    child: InkWell(
                      onTap: () =>
                          Navigator.popUntil(context, (route) => route.isFirst),
                      child: const Text('ok'),
                    ),
                  )).showCompletedDialog();
            }
            if (changePasswordstate is ChangePasswordErrorState) {
              Navigator.of(context).pop();

              CustomDialog(context: context, text: changePasswordstate.error)
                  .showErrorDialog();
            }
          },
          child: SingleChildScrollView(
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
                  const SizedBox(height: 30),
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
                  const SizedBox(height: 30)
                ],
              ),
            ),
            const SizedBox(height: 50),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  if (!onSwitchFP) Decorations.height5,
                  if (!onSwitchFP)
                    CustomInputField(
                      icon: IconButton(
                          onPressed: onShowPass,
                          icon: !showPass
                              ? const Icon(Icons.remove_red_eye_sharp)
                              : const Icon(Icons.remove_red_eye_outlined)),
                      toHide: showPass,
                      labelText: 'Current Password',
                      hintText: "Current Password",
                      controller: currentPassword,
                      onChanged: onCurrentPasswordChanged,
                    ),
                  const SizedBox(
                    height: 10,
                  ),
                  if (!onSwitchFP) Decorations.height5,
                  if (!onSwitchFP)
                    CustomInputField(
                      icon: IconButton(
                          onPressed: onShowPass,
                          icon: !showPass
                              ? const Icon(Icons.remove_red_eye_sharp)
                              : const Icon(Icons.remove_red_eye_outlined)),
                      toHide: showPass,
                      labelText: 'New Password',
                      controller: newPassword,
                      hintText: "New Password",
                      onChanged: onNewPasswordChanged,
                    ),
                  const SizedBox(
                    height: 10,
                  ),
                  if (!onSwitchFP) Decorations.height5,
                  if (!onSwitchFP)
                    CustomInputField(
                      icon: IconButton(
                          onPressed: onShowPass,
                          icon: !showPass
                              ? const Icon(Icons.remove_red_eye_sharp)
                              : const Icon(Icons.remove_red_eye_outlined)),
                      toHide: showPass,
                      controller: conformPassword,
                      labelText: 'Conform Your Password',
                      hintText: "Conform Your Password",
                      onChanged: onConformPasswordChanged,
                    ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomButton(
                    onTap: onPasswordChanged,
                    text: 'Change Password',
                    enabled: true,
                    backgroundColor: const Color(0xff202b38),
                    textColor: Colors.white,
                  )
                ],
              ),
            ),
          ])),
        ));
  }

  onPasswordChanged() {
    changePasswordBloc.add(ChangePasswordEvent(
        oldPassword: currentPassword.text,
        password: newPassword.text,
        confirmPassword: conformPassword.text));
  }

  void onShowPass() {
    setState(() {
      showPass = !showPass;
    });
  }

  onCurrentPasswordChanged(String value) {}
  onNewPasswordChanged(String value) {}
  onConformPasswordChanged(String value) {}
}
