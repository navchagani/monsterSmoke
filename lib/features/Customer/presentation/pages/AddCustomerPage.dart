import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:monstersmoke/Decorations/Decorations.dart';
import 'package:monstersmoke/Global/Widgets/DropDowns.dart';
import 'package:monstersmoke/const/Constants.dart';
import 'package:monstersmoke/core/widgets/CustomButton.dart';
import 'package:monstersmoke/core/widgets/CustomDialog.dart';
import 'package:monstersmoke/core/widgets/CustomIniputField.dart';
import 'package:monstersmoke/features/Auth/data/models/CreateCustomerModel.dart';
import 'package:monstersmoke/features/Auth/data/models/CustomerModel.dart';
import 'package:monstersmoke/features/Customer/presentation/bloc/AddCustomerBloc/add_customer_bloc_bloc.dart';
import 'package:monstersmoke/features/Customer/presentation/bloc/GetCustomerBloc/customer_bloc_bloc.dart';
import 'package:monstersmoke/features/GETAssets/data/models/CountryModel.dart';
import 'package:monstersmoke/features/GETAssets/data/models/StateModel.dart';

class AddNewCustomerAddressPage extends StatefulWidget {
  const AddNewCustomerAddressPage({super.key});

  @override
  State<AddNewCustomerAddressPage> createState() =>
      _AddNewCustomerAddressPageState();
}

class _AddNewCustomerAddressPageState extends State<AddNewCustomerAddressPage> {
  final address1Controller = TextEditingController();
  final address2Controller = TextEditingController();
  final cityController = TextEditingController();
  final zipCodeController = TextEditingController();
  final phoneController = TextEditingController();

  String? selectedCountry, selectedState;

  @override
  Widget build(BuildContext context) {
    return addNewAddress();
  }

  Widget addNewAddress() =>
      BlocListener<AddCustomerAddressBloc, AddCustomerBlocState>(
          listener: (context, addCustomerAddressBloc) {
            if (addCustomerAddressBloc is AddCustomerLoadingState) {
              CustomDialog(context: context, text: 'Adding Your Address')
                  .showLoadingDialog();
            }

            if (addCustomerAddressBloc is AddCustomerCompletedState) {
              Navigator.of(context).pop();
              CustomDialog(context: context, text: 'Address Added Successfully')
                  .showCompletedDialog();

              CustomerBloc bloc = BlocProvider.of<CustomerBloc>(context);
              bloc.add(GetCustomerEvent(token: addCustomerAddressBloc.token));
            }

            if (addCustomerAddressBloc is AddCustomerErrorState) {
              Navigator.of(context).pop();
              CustomDialog(
                      context: context,
                      text: addCustomerAddressBloc.error.message)
                  .showErrorDialog();
            }
          },
          child: Material(
            child: ListView(
              padding: const EdgeInsets.all(15.0),
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        icon: const Icon(Icons.arrow_drop_down_circle_outlined))
                  ],
                ),
                CustomInputField(
                    labelText: 'Address line 1',
                    hintText: 'Address line 1',
                    controller: address1Controller,
                    onChanged: address1Changed),
                Decorations.height5,
                CustomInputField(
                    labelText: 'Address Line 2',
                    hintText: 'Address Line 2',
                    controller: address2Controller,
                    onChanged: address2Changed),
                Decorations.height5,
                CountryDropDown(onCountryChanged: onCountryChanged),
                Decorations.height5,
                StateDropDown(onStateChanged: onStateChanged),
                Decorations.height5,
                Row(
                  children: [
                    Expanded(
                      child: CustomInputField(
                          labelText: 'City',
                          hintText: 'City',
                          controller: cityController,
                          onChanged: onCityChanged),
                    ),
                    Decorations.width5,
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
                Decorations.height5,
                CustomInputField(
                    labelText: 'Phone',
                    hintText: 'Phone',
                    controller: phoneController,
                    onChanged: onPhoneChanged),
                Decorations.height30,
                CustomButton(
                  text: 'Add Address',
                  onTap: onAddCustomerAddress,
                )
              ],
            ),
          ));

  address1Changed(String value) => setState(() {});

  onPhoneChanged(String value) => setState(() {});

  onzipCodeChanged(String value) => setState(() {});

  onCityChanged(String value) => setState(() {});

  address2Changed(String value) => setState(() {});

  onCountryChanged(CountryModel? p1) {
    setState(() {
      selectedCountry = p1?.name;
    });
  }

  onStateChanged(StateModel? p1) {
    setState(() {
      selectedState = p1?.name;
    });
  }

  onAddCustomerAddress() {
    final addressList = CustomerStoreAddressList(
      address1: address1Controller.text,
      address2: address2Controller.text,
      countryId: int.parse(selectedCountry.toString()),
      stateId: int.parse(selectedState.toString()),
      city: cityController.text,
      zip: zipCodeController.text,
    );

    final addCustomerAddress = BlocProvider.of<AddCustomerAddressBloc>(context);
    addCustomerAddress.add(AddCustomerAddressEvent(addressList: addressList));
  }
}