import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:monstersmoke/core/blocs/CustomBlocs.dart';
import 'package:monstersmoke/core/widgets/CustomLinkButton.dart';
import 'package:monstersmoke/features/Auth/presentation/pages/Login.dart';
import 'package:monstersmoke/features/Auth/presentation/pages/SignUp.dart';

class AuthActionPage extends StatelessWidget {
  const AuthActionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthAction, bool>(
      builder: (context, isSignUp) {
        return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              title: buildTitle(isSignUp: isSignUp),
              actions: [buildAction(isSignUp: isSignUp)],
            ),
            body: buildbody(isSignUp: isSignUp));
      },
    );
  }

  Widget buildTitle({required bool isSignUp}) => Builder(builder: (context) {
        if (isSignUp) {
          return const Text('SignUp');
        }

        return const Text('Login');
      });

  Widget buildbody({required bool isSignUp}) => Builder(builder: (context) {
        if (isSignUp) {
          return const SignUpPage();
        }

        return const LoginPage();
      });

  Widget buildAction({required bool isSignUp}) => Builder(builder: (context) {
        if (isSignUp) {
          return CustomLinkButton(
              padding: const EdgeInsets.all(15.0),
              onTap: () => onMoveToLogin(context),
              text: 'Login');
        }

        return CustomLinkButton(
            padding: const EdgeInsets.all(15.0),
            onTap: () => onMoveToSignIn(context),
            text: 'SignUp');
      });

  onMoveToSignIn(BuildContext context) {
    AuthAction bloc = BlocProvider.of<AuthAction>(context);
    bloc.add(true);
  }

  onMoveToLogin(BuildContext context) {
    AuthAction bloc = BlocProvider.of<AuthAction>(context);
    bloc.add(false);
  }
}
