import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:monstersmoke/Decorations/Decorations.dart';
import 'package:monstersmoke/core/blocs/CustomBlocs.dart';
import 'package:monstersmoke/core/widgets/CustomButton.dart';
import 'package:monstersmoke/core/widgets/CustomDialog.dart';
import 'package:monstersmoke/core/widgets/CustomIniputField.dart';
import 'package:monstersmoke/features/Auth/data/models/CreateCustomerModel.dart';
import 'package:monstersmoke/features/Auth/presentation/bloc/SignUpBloc/sign_up_bloc_bloc.dart';
import 'package:monstersmoke/features/GETAssets/data/models/CountryModel.dart';
import 'package:monstersmoke/features/GETAssets/data/models/StateModel.dart';
import 'package:monstersmoke/features/GETAssets/presentation/bloc/CountryBloc/country_bloc_bloc.dart';
import 'package:monstersmoke/features/GETAssets/presentation/bloc/StateBloc/state_bloc_bloc.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final emailController = TextEditingController();
  final buisnessNameController = TextEditingController();
  final companyController = TextEditingController();
  final taxController = TextEditingController();
  final buisnessAddressController = TextEditingController();

  final cityController = TextEditingController();
  final zipCodeController = TextEditingController();

  final phoneController = TextEditingController();
  final firstNameController = TextEditingController();

  final secondNameController = TextEditingController();

  String? selectedCountry, selectedState;

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignUpBloc, SignUpBlocState>(
      listener: (context, signUpState) {
        if (signUpState is SignUpLoadingState) {
          CustomDialog(context: context, text: 'Signing Up..')
              .showLoadingDialog();
        }

        if (signUpState is SignUpCompletedState) {
          Navigator.of(context).pop();
          CustomDialog(context: context, text: 'Signed Up Successfully..')
              .showCompletedDialog();
        }

        if (signUpState is SignUpErrorState) {
          Navigator.of(context).pop();
          CustomDialog(context: context, text: signUpState.error.message)
              .showErrorDialog();
        }
      },
      child: Material(
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
      ),
    );
  }

  AppBar appBar() => AppBar(
        surfaceTintColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        toolbarHeight: 80,
        title: const Text('Apply For Account'),
      );

  Widget body() {
    return ListView(
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
              ],
            ),
            Decorations.height10,
            CustomInputField(
              labelText: 'Tax',
              hintText: 'Tax Id',
              controller: taxController,
              onChanged: onTaxChanged,
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
              ],
            ),
            Decorations.height10,
            BlocBuilder<CountryBloc, CountryBlocState>(
              builder: (context, countryState) {
                if (countryState is CountryCompletedCountry) {
                  return DropdownButtonFormField<CountryModel>(
                      decoration: Decorations.inputDecoration(
                          hint: 'Country', context: context),
                      items: countryState.lilstContries
                          .map((e) => DropdownMenuItem(
                                value: e,
                                child: Text(e.name.toString()),
                              ))
                          .toList(),
                      onChanged: onAddressChanged);
                }

                return DropdownButtonFormField<CountryModel>(
                    decoration: Decorations.inputDecoration(
                        hint: 'Country', context: context),
                    items: [],
                    onChanged: onAddressChanged);
              },
            ),
            Decorations.height10,
            BlocBuilder<StateBloc, StateBlocState>(
              builder: (context, states) {
                if (states is StateCompletedState) {
                  return DropdownButtonFormField<StateModel>(
                      isExpanded: true,
                      decoration: Decorations.inputDecoration(
                          hint: 'State', context: context),
                      items: states.lilstContries
                          .map((e) => DropdownMenuItem(
                                value: e,
                                child: Text(e.name.toString()),
                              ))
                          .toList(),
                      onChanged: onStateChanged);
                }

                return DropdownButtonFormField<CountryModel>(
                    decoration: Decorations.inputDecoration(
                        hint: 'States', context: context),
                    items: [],
                    onChanged: onAddressChanged);
              },
            ),
            Decorations.height10,
            CustomInputField(
              labelText: 'Zip Code',
              hintText: 'Zip Code',
              controller: zipCodeController,
              onChanged: onzipCodeChanged,
            ),
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
              'Your Profile',
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
          onTap: onSignUp,
          text: 'Sign Up',
          enabled: emailController.text.isNotEmpty,
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
          onTap: onMoveToSignIn,
          isBordered: true,
          text: 'Sign In',
          enabled: true,
        )
      ],
    );
  }

  onEmailChanged(String value) => setState(() {});

  onMoveToSignIn() {
    AuthAction bloc = BlocProvider.of<AuthAction>(context);
    bloc.add(false);
  }

  onBuisnessNameChanged(String value) => setState(() {});

  onCompanyChanged(String value) => setState(() {});

  onTaxChanged(String value) => setState(() {});

  onBuisnessAddressChanged(String value) => setState(() {});

  onCityChanged(String value) => setState(() {});

  onzipCodeChanged(String value) => setState(() {});

  onPhoneChanged(String value) => setState(() {});

  onfirstNameChanged(String value) => setState(() {});

  onSecondNameChanged(String value) => setState(() {});

  onSignUp() {
    final customAddress = CustomerStoreAddressList(
        address1: buisnessAddressController.text,
        zip: zipCodeController.text,
        city: cityController.text,
        countryId: int.parse(selectedCountry.toString()),
        stateId: int.parse(selectedState.toString()));

    final customerModel = CreateCustomerModel(
        dbaName: 'Salesgent',
        primaryBusinessName: buisnessNameController.text,
        firstName: firstNameController.text,
        lastName: secondNameController.text,
        phone: phoneController.text,
        taxId: taxController.text,
        company: companyController.text,
        email: emailController.text,
        customerStoreAddressList: [customAddress]);

    SignUpBloc bloc = BlocProvider.of<SignUpBloc>(context);
    bloc.add(SignUpEvent(customerModel: customerModel));
  }

  void onAddressChanged(CountryModel? value) {
    StateBloc bloc = BlocProvider.of<StateBloc>(context);
    bloc.add(GetStateEvent(stateId: value!.id.toString()));

    setState(() {
      selectedCountry = value.id.toString();
    });
  }

  void onStateChanged(StateModel? value) {
    setState(() {
      selectedState = value?.id.toString();
    });
  }
}
