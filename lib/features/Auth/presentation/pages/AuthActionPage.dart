import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:monstersmoke/core/blocs/CustomBlocs.dart';
import 'package:monstersmoke/features/Auth/presentation/pages/Login.dart';
import 'package:monstersmoke/features/Auth/presentation/pages/SignUp.dart';

class AuthActionPage extends StatelessWidget {
  const AuthActionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthAction, bool>(builder: ((context, state) {
      if (!state) {
        return const LoginPage();
      }

      return const SignUpPage();
    }));
  }
}
