import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:monstersmoke/Decorations/Decorations.dart';
import 'package:monstersmoke/core/blocs/CustomBlocs.dart';
import 'package:monstersmoke/core/widgets/CustomButton.dart';
import 'package:monstersmoke/core/widgets/CustomDialog.dart';
import 'package:monstersmoke/core/widgets/CustomIniputField.dart';
import 'package:monstersmoke/features/Auth/presentation/bloc/CustomerBloc/customer_bloc_bloc.dart';
import 'package:monstersmoke/features/Auth/presentation/bloc/SignInBloc/sign_in_bloc_bloc.dart';

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
    return BlocListener<SignInBloc, SignInBlocState>(
      listener: (context, signInState) {
        if (signInState is SignInLoadingState) {
          CustomDialog(context: context, text: 'Signing In..')
              .showLoadingDialog();
        }

        if (signInState is SignInCompletedState) {
          Navigator.of(context).pop();
          CustomerBloc bloc = BlocProvider.of(context);
          bloc.add(GetCustomerEvent(token: signInState.token));
        }

        if (signInState is SignInErrorState) {
          Navigator.of(context).pop();
          CustomDialog(context: context, text: signInState.error.message)
              .showErrorDialog();
        }
      },
      child: BlocListener<CustomerBloc, CustomerBlocState>(
        listener: (context, customerState) {
          if (customerState is CustomerLoadingState) {
            CustomDialog(context: context, text: 'Getting Customer')
                .showLoadingDialog();
          }

          if (customerState is CustomerCompletedState) {
            Navigator.of(context).popUntil((route) => route.isFirst);
          }

          if (customerState is CustomerErrorState) {
            Navigator.of(context).pop();
            CustomDialog(context: context, text: customerState.error.message)
                .showErrorDialog();
          }
        },
        child: ConstrainedBox(
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
          Decorations.height10,
          CustomInputField(
              labelText: 'Password',
              hintText: 'Enter Password',
              controller: passwordController,
              onChanged: onPasswordChanged),
          const SizedBox(
            height: 30.0,
          ),
          CustomButton(
            onTap: onSignIn,
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
            onTap: onMoveToSignUp,
            isBordered: true,
            text: 'Sign Up',
            enabled: true,
          )
        ],
      );

  onEmailChanged(String value) => setState(() {});

  onPasswordChanged(String value) => setState(() {});

  onMoveToSignUp() {
    AuthAction bloc = BlocProvider.of<AuthAction>(context);
    bloc.add(true);
  }

  onSignIn() {
    SignInBloc bloc = BlocProvider.of<SignInBloc>(context);
    bloc.add(SignInEvent(
        email: emailController.text, password: passwordController.text));
  }
}
