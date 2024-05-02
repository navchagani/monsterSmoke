import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:monstersmoke/Decorations/Decorations.dart';
import 'package:monstersmoke/core/blocs/CustomBlocs.dart';
import 'package:monstersmoke/core/widgets/CustomButton.dart';
import 'package:monstersmoke/core/widgets/CustomIniputField.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final buisnessNameController = TextEditingController();
  final companyController = TextEditingController();
  final taxController = TextEditingController();
  final buisnessAddressController = TextEditingController();

  final cityController = TextEditingController();
  final zipCodeController = TextEditingController();

  final phoneController = TextEditingController();
  final firstNameController = TextEditingController();

  final secondNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(10.0),
      clipBehavior: Clip.hardEdge,
      child: ConstrainedBox(
        constraints: BoxConstraints(
            maxHeight: 800,
            minHeight: 100,
            maxWidth: MediaQuery.of(context).size.width * 0.7),
        child: Scaffold(
          appBar: appBar(),
          body: body(),
        ),
      ),
    );
  }

  AppBar appBar() => AppBar(
        toolbarHeight: 100,
        title: const Text('Apply For Account'),
      );

  Widget body() => ListView(
        padding: const EdgeInsets.all(25.0),
        shrinkWrap: true,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Your Buisness',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
              ),
              Decorations.height10,
              Row(
                children: [
                  Expanded(
                    child: CustomInputField(
                      labelText: 'Buisness Name',
                      hintText: 'Buisness Name',
                      controller: buisnessNameController,
                      onChanged: onBuisnessNameChanged,
                    ),
                  ),
                  Decorations.width10,
                  Expanded(
                    child: CustomInputField(
                        labelText: 'Company',
                        hintText: 'Company Name',
                        controller: companyController,
                        onChanged: onCompanyChanged),
                  ),
                  Decorations.width10,
                  Expanded(
                    child: CustomInputField(
                      labelText: 'Tax',
                      hintText: 'Tax Id',
                      controller: taxController,
                      onChanged: onTaxChanged,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 40.0,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Buisness Address',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
              ),
              Decorations.height10,
              Row(
                children: [
                  Expanded(
                    child: CustomInputField(
                      labelText: 'StoreFront Buisness Address',
                      hintText: 'Buisness Address',
                      controller: buisnessAddressController,
                      onChanged: onBuisnessAddressChanged,
                    ),
                  ),
                  Decorations.width10,
                  Expanded(
                    child: CustomInputField(
                        labelText: 'City',
                        hintText: 'City',
                        controller: cityController,
                        onChanged: onCityChanged),
                  ),
                  Decorations.width10,
                  Expanded(
                    child: CustomInputField(
                      labelText: 'Zip Code',
                      hintText: 'Zip Code',
                      controller: zipCodeController,
                      onChanged: onzipCodeChanged,
                    ),
                  ),
                ],
              ),
              Decorations.height10,
              const Row(
                children: [],
              ),
            ],
          ),
          const SizedBox(
            height: 40.0,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Buisness Address',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
              ),
              Decorations.height10,
              Row(
                children: [
                  Expanded(
                    child: CustomInputField(
                      labelText: 'First Name',
                      hintText: 'First Name',
                      controller: firstNameController,
                      onChanged: onfirstNameChanged,
                    ),
                  ),
                  Decorations.width10,
                  Expanded(
                    child: CustomInputField(
                      labelText: 'Second Name',
                      hintText: 'Second Name',
                      controller: secondNameController,
                      onChanged: onSecondNameChanged,
                    ),
                  ),
                ],
              ),
              Decorations.height10,
              Row(
                children: [
                  Expanded(
                    child: CustomInputField(
                      labelText: 'Email',
                      hintText: 'Enter Email',
                      controller: emailController,
                      onChanged: onEmailChanged,
                    ),
                  ),
                  Decorations.width10,
                  Expanded(
                    child: CustomInputField(
                        labelText: 'Phone',
                        hintText: 'Phone',
                        controller: phoneController,
                        onChanged: onPhoneChanged),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 40.0,
          ),
          CustomButton(
            text: 'Sign Up',
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
            onTap: onSignIn,
            isBordered: true,
            text: 'Sign In',
            enabled: true,
          )
        ],
      );

  onPasswordChanged(String value) {}

  onEmailChanged(String value) {}

  onSignIn() {
    AuthAction bloc = BlocProvider.of<AuthAction>(context);
    bloc.add(false);
  }

  onBuisnessNameChanged(String value) {}

  onCompanyChanged(String value) {}

  onTaxChanged(String value) {}

  onBuisnessAddressChanged(String value) {}

  onCityChanged(String value) {}

  onzipCodeChanged(String value) {}

  onPhoneChanged(String value) {}

  onfirstNameChanged(String value) {}

  onSecondNameChanged(String value) {}
}
