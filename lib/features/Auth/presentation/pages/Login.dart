import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:monstersmoke/Decorations/Decorations.dart';
import 'package:monstersmoke/core/blocs/CustomBlocs.dart';
import 'package:monstersmoke/core/widgets/CustomButton.dart';
import 'package:monstersmoke/core/widgets/CustomIniputField.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
          maxHeight: 450,
          minHeight: 100,
          maxWidth: MediaQuery.of(context).size.width * 0.7),
      child: Material(
        borderRadius: BorderRadius.circular(10.0),
        clipBehavior: Clip.hardEdge,
        child: Scaffold(
          appBar: appBar(),
          body: body(),
        ),
      ),
    );
  }

  AppBar appBar() => AppBar(
        toolbarHeight: 80,
        surfaceTintColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        title: const Text('Login'),
      );

  Widget body() => ListView(
        padding: const EdgeInsets.all(25.0),
        shrinkWrap: true,
        children: [
          CustomInputField(
            labelText: 'Email',
            hintText: 'Enter Email',
            controller: emailController,
            onChanged: onEmailChanged,
          ),
          Decorations.height15,
          CustomInputField(
              labelText: 'Password',
              hintText: 'Enter Password',
              controller: passwordController,
              onChanged: onPasswordChanged),
          const SizedBox(
            height: 30.0,
          ),
          CustomButton(
            text: 'Sign In',
            enabled: emailController.text.isNotEmpty &&
                passwordController.text.isNotEmpty,
            backgroundColor: Theme.of(context).colorScheme.primary,
            textColor: Colors.white,
          ),
          const SizedBox(
            height: 20.0,
          ),
          const Row(
            children: [
              Expanded(child: Divider()),
              SizedBox(
                width: 80,
                child: Center(child: Text('Or')),
              ),
              Expanded(child: Divider())
            ],
          ),
          const SizedBox(
            height: 20.0,
          ),
          CustomButton(
            onTap: onSignUp,
            isBordered: true,
            text: 'Sign Up',
            enabled: true,
          )
        ],
      );

  onEmailChanged(String value) => setState(() {});

  onPasswordChanged(String value) => setState(() {});

  onSignUp() {
    AuthAction bloc = BlocProvider.of<AuthAction>(context);
    bloc.add(true);
  }
}
