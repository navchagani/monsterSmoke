import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:monstersmoke/core/inject.dart';
import 'package:monstersmoke/core/widgets/CustomButton.dart';
import 'package:monstersmoke/core/widgets/CustomDialog.dart';
import 'package:monstersmoke/core/widgets/CustomIniputField.dart';
import 'package:monstersmoke/features/Customer/presentation/bloc/GetCustomerBloc/customer_bloc_bloc.dart';
import 'package:monstersmoke/features/Dashboard/presentation/bloc/dashboard_bloc.dart';

import '../../../Customer/presentation/bloc/UpdateCustomerBloc/update_customer_bloc_bloc.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({super.key});

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController companyName = TextEditingController();
  TextEditingController taxId = TextEditingController();

  // final customer = getIt<CustomerBloc>();

  @override
  void initState() {
    CustomerBloc customer = BlocProvider.of<CustomerBloc>(context);
    setState(() {
      firstName.text = customer.state.customerModel!.firstName.toString();
      lastName.text = customer.state.customerModel!.lastName.toString();
      email.text = customer.state.customerModel!.email.toString();
      phone.text = customer.state.customerModel!.phone.toString();
      taxId.text = customer.state.customerModel!.taxId.toString();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<UpdateCustomerBlocBloc, UpdateCustomerBlocState>(
        listener: (context, updateCustomer) {
      if (updateCustomer is UpdateCustomerLoadingState) {
        CustomDialog(context: context, text: 'Customer Updating..')
            .showLoadingDialog();
      }
      if (updateCustomer is UpdateCustomerCompletedState) {
        Navigator.of(context).pop();
        CustomDialog(context: context, text: 'Customer Update Successfully..')
            .showCompletedDialog();
      }
      if (updateCustomer is UpdateCustomerErrorState) {
        log('In Error State');
        Navigator.of(context).pop();
        CustomDialog(context: context, text: updateCustomer.error.message)
            .showErrorDialog();
      }
    }, child: BlocBuilder<CustomerBloc, CustomerBlocState>(
            builder: ((context, customerState) {
      return SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Column(children: [
              const Stack(
                alignment: Alignment.center,
                children: [
                  CircleAvatar(
                    radius: 70,
                    backgroundImage: NetworkImage(
                        'https://img.freepik.com/premium-vector/anonymous-user-circle-icon-vector-illustration-flat-style-with-long-shadow_520826-1931.jpg'),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.email,
                    color: Color(0xff202b38),
                  ),
                  Text('${customerState.customerModel?.email}')
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.phone,
                    color: Color(0xff202b38),
                  ),
                  Text('${customerState.customerModel?.phone}')
                ],
              ),
            ]),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                children: [
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.only(left: 8.0),
                      child: Text(
                        'First Name',
                        textAlign: TextAlign.start,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  CustomInputField(
                    labelText: "First name",
                    hintText: "First Name",
                    controller: firstName,
                    onChanged: onFirstNameChanged,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.only(left: 8.0),
                      child: Text(
                        'Last Name',
                        textAlign: TextAlign.start,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  CustomInputField(
                    labelText: "Last name",
                    hintText: "Last Name",
                    controller: lastName,
                    onChanged: onLastNameChanged,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.only(left: 8),
                      child: Text(
                        'Email Addresss',
                        textAlign: TextAlign.start,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  CustomInputField(
                    labelText: "Email Addresss",
                    hintText: "Email Addresss",
                    controller: email,
                    onChanged: onEmailChanged,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.only(left: 8.0),
                      child: Text(
                        'Phone No',
                        textAlign: TextAlign.start,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  CustomInputField(
                    labelText: "Phone No",
                    hintText: "Phone No",
                    controller: phone,
                    onChanged: onPhoneChanged,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.only(left: 8.0),
                      child: Text(
                        'Tax Id',
                        textAlign: TextAlign.start,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  CustomInputField(
                    labelText: "Tax Id",
                    hintText: "Tax Id",
                    controller: taxId,
                    onChanged: onTaxIdChanged,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomButton(
                    onTap: onUpdateCustomer,
                    text: 'Update',
                    enabled: true,
                    backgroundColor: const Color(0xff202b38),
                    textColor: Colors.white,
                  ),
                ],
              ),
            )
          ],
        ),
      );
    })));
  }

  onFirstNameChanged(String value) => setState(() {});

  onLastNameChanged(String value) => setState(() {});

  onEmailChanged(String value) => setState(() {});

  onPhoneChanged(String value) => setState(() {});

  onTaxIdChanged(String value) => setState(() {});

  onUpdateCustomer() {
    CustomerBloc customer = BlocProvider.of<CustomerBloc>(context);
    final customerModel = customer.state.customerModel!
      ..firstName = firstName.text
      ..lastName = lastName.text
      ..email = email.text
      ..phone = phone.text
      ..taxId = taxId.text;

    UpdateCustomerBlocBloc bloc =
        BlocProvider.of<UpdateCustomerBlocBloc>(context);
    bloc.add(UpdateCustomerEvent(customerModel: customerModel));
  }
}
