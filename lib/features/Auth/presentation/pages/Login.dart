import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:monstersmoke/Decorations/Decorations.dart';
import 'package:monstersmoke/core/blocs/CustomBlocs.dart';
import 'package:monstersmoke/core/inject.dart';
import 'package:monstersmoke/core/widgets/CustomButton.dart';
import 'package:monstersmoke/core/widgets/CustomDialog.dart';
import 'package:monstersmoke/core/widgets/CustomIniputField.dart';
import 'package:monstersmoke/core/widgets/CustomLinkButton.dart';
import 'package:monstersmoke/features/Auth/presentation/bloc/SignInBloc/sign_in_bloc_bloc.dart';
import 'package:monstersmoke/features/Auth/presentation/bloc/changePassBloc/change_password_bloc_bloc.dart';
import 'package:monstersmoke/features/Customer/presentation/bloc/GetCustomerBloc/customer_bloc_bloc.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final bloc = getIt<ChangePasswordBloc>();

  bool showPass = true;
  bool onSwitchFP = false;

  @override
  void dispose() {
    bloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: bloc,
      child: BlocListener<ChangePasswordBloc, ChangePasswordBlocState>(
        bloc: bloc,
        listener: (context, state) {
          if (state is ChangePasswordLoadingState) {
            CustomDialog(context: context, text: 'Send Reset Password Link..')
                .showLoadingDialog();
          }

          if (state is PasswordChangedState) {
            Navigator.of(context).pop();
            setState(() {
              onSwitchFP = false;
            });
            bloc.add(ChangePasswordBlocInitialEvent());
            CustomDialog(context: context, text: 'Link Sent Successfully')
                .showCompletedDialog();
          }

          if (state is ChangePasswordErrorState) {
            Navigator.of(context).pop();
            CustomDialog(context: context, text: state.error).showErrorDialog();
          }
        },
        child: BlocListener<SignInBloc, SignInBlocState>(
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
                CustomDialog(
                        context: context, text: customerState.error.message)
                    .showErrorDialog();
              }
            },
            child: Material(
              borderRadius: BorderRadius.circular(10.0),
              clipBehavior: Clip.hardEdge,
              child: Scaffold(
                // appBar: appBar(),
                body: body(),
              ),
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
          if (!onSwitchFP) Decorations.height5,
          if (!onSwitchFP)
            CustomInputField(
                icon: IconButton(
                    onPressed: onShowPass,
                    icon: !showPass
                        ? const Icon(Icons.remove_red_eye_sharp)
                        : const Icon(Icons.remove_red_eye_outlined)),
                toHide: showPass,
                labelText: 'Password',
                hintText: 'Enter Password',
                controller: passwordController,
                onChanged: onPasswordChanged),
          Builder(builder: (context) {
            if (onSwitchFP) {
              return CustomLinkButton(
                  padding: const EdgeInsets.all(12.0),
                  onTap: onForgotPassword,
                  text: 'Back Signing In!');
            }

            return CustomLinkButton(
                padding: const EdgeInsets.all(12.0),
                onTap: onForgotPassword,
                text: 'Forgot Password?');
          }),
          if (!onSwitchFP) Decorations.height10,
          Builder(builder: (context) {
            if (onSwitchFP) {
              return CustomButton(
                onTap: onSendPassResetLink,
                text: 'Send Link',
                enabled: emailController.text.isNotEmpty,
                backgroundColor: Theme.of(context).colorScheme.primary,
                textColor: Colors.white,
              );
            }

            return CustomButton(
              onTap: onSignIn,
              text: 'Sign In',
              enabled: emailController.text.isNotEmpty &&
                  passwordController.text.isNotEmpty,
              backgroundColor: Theme.of(context).colorScheme.primary,
              textColor: Colors.white,
            );
          }),
          Decorations.height10,
          Row(
            children: [
              const Text('Don\'t Have An Account?'),
              CustomLinkButton(
                onTap: onMoveToSignUp,
                text: 'SignUp',
                textColor: Theme.of(context).colorScheme.secondary,
              )
            ],
          ),
          const SizedBox(
            height: 30.0,
          ),
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

  onForgotPassword() {
    setState(() {
      onSwitchFP = !onSwitchFP;
    });
  }

  void onShowPass() {
    setState(() {
      showPass = !showPass;
    });
  }

  onSendPassResetLink() {
    bloc.add(ForgotPasswordEvent(email: emailController.text));
  }
}
