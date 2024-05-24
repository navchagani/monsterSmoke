import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:monstersmoke/Decorations/Decorations.dart';
import 'package:monstersmoke/Global/Widgets/DropDowns.dart';
import 'package:monstersmoke/core/inject.dart';
import 'package:monstersmoke/core/widgets/CustomButton.dart';
import 'package:monstersmoke/core/widgets/CustomDialog.dart';
import 'package:monstersmoke/core/widgets/CustomIniputField.dart';
import 'package:monstersmoke/features/Auth/data/models/CustomerModel.dart';
import 'package:monstersmoke/features/Customer/presentation/bloc/AddCustomerBloc/add_customer_bloc_bloc.dart';
import 'package:monstersmoke/features/Customer/presentation/bloc/GetCustomerBloc/customer_bloc_bloc.dart';
import 'package:monstersmoke/features/Customer/presentation/bloc/UpdateCustomerAddressBloc/update_customer_address_bloc_bloc.dart';
import 'package:monstersmoke/features/GETAssets/data/models/CountryModel.dart';
import 'package:monstersmoke/features/GETAssets/data/models/StateModel.dart';
import 'package:monstersmoke/features/GETAssets/presentation/bloc/StateBloc/state_bloc_bloc.dart';

class AddAddress extends StatefulWidget {
  final bool? forUpdate;
  final CustomerStoreAddressList? addressList;
  const AddAddress({super.key, this.forUpdate, this.addressList});

  @override
  State<AddAddress> createState() => _AddAddressState();
}

class _AddAddressState extends State<AddAddress> {
  TextEditingController address1 = TextEditingController();
  TextEditingController address2 = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController zipCode = TextEditingController();
  TextEditingController phonne = TextEditingController();
  int? selectedCountry, selectedState;

  final StateBloc stateBloc = getIt<StateBloc>();

  @override
  void initState() {
    if (widget.forUpdate ?? false) {
      setState(() {
        address1.text = widget.addressList!.address1.toString();
        address2.text = widget.addressList!.address2.toString();
        city.text = widget.addressList!.city.toString();
        zipCode.text = widget.addressList!.zip.toString();
        phonne.text = widget.addressList!.phone.toString();
      });
    }
    super.initState();
  }

  @override
  void dispose() {
    stateBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AddCustomerAddressBloc, AddCustomerBlocState>(
      listener: (context, addAddressState) {
        if (addAddressState is CustomerLoadingState) {
          CustomDialog(context: context).showLoadingDialog();
        }

        if (addAddressState is AddCustomerCompletedState) {
          CustomDialog(context: context, text: 'Address Added Successfully')
              .showCompletedDialog();
        }

        if (addAddressState is AddCustomerErrorState) {
          CustomDialog(context: context, text: addAddressState.error.message)
              .showErrorDialog();
        }
      },
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                const SizedBox(
                  height: 40,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(Icons.arrow_back_rounded)),
                ),
                const SizedBox(
                  height: 40,
                ),
                const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Add Billig addresses',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff202b38)),
                    )),
                const SizedBox(
                  height: 30,
                ),
                CustomInputField(
                    controller: address1,
                    onChanged: onAddress1Changed,
                    labelText: 'Address 1',
                    hintText: 'Address 1'),
                const SizedBox(
                  height: 10,
                ),
                CustomInputField(
                    controller: address2,
                    onChanged: onAddress2Changed,
                    labelText: 'Address 2',
                    hintText: 'Address 2'),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Expanded(
                        child: CountryDropDown(
                            onCountryChanged: onAddressChanged)),
                    Decorations.width5,
                    Expanded(
                        child: StateDropDown(
                      onStateChanged: onStateChanged,
                      stateBloc: stateBloc,
                    )),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomInputField(
                    controller: city,
                    onChanged: onCityChanged,
                    labelText: 'City',
                    hintText: 'City'),
                const SizedBox(
                  height: 10,
                ),
                CustomInputField(
                    controller: zipCode,
                    onChanged: onZipCodeChanged,
                    labelText: 'Zip/Postal Code',
                    hintText: 'Zip/Postal Code'),
                const SizedBox(
                  height: 10,
                ),
                CustomInputField(
                    controller: phonne,
                    onChanged: onPhoneChanged,
                    labelText: 'Phone',
                    hintText: 'Phone'),
                const SizedBox(
                  height: 10,
                ),
                CustomButton(
                  text: 'Add Address',
                  textColor: Colors.white,
                  enabled: true,
                  backgroundColor: const Color(0xff202b38),
                  onTap: onAddAddress,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void onAddressChanged(CountryModel? value) {
    stateBloc.add(GetStateEvent(stateId: value!.id.toString()));

    setState(() {
      selectedCountry = int.parse(value.id.toString());
    });
  }

  void onStateChanged(StateModel? value) {
    setState(() {
      selectedState = int.parse(value!.id.toString());
    });
  }

  onAddAddress() {
    final addressModel = CustomerStoreAddressList(
        address1: address1.text,
        address2: address2.text,
        city: city.text,
        country: selectedCountry.toString(),
        state: selectedState.toString(),
        zip: zipCode.text,
        phone: phonne.text);
    if (widget.forUpdate ?? false) {
      UpdateCustomerAddressBlocBloc bloc =
          BlocProvider.of<UpdateCustomerAddressBlocBloc>(context);
      bloc.add(UpdateCustomerAddressEvent(addressList: addressModel));
    } else {
      AddCustomerAddressBloc bloc =
          BlocProvider.of<AddCustomerAddressBloc>(context);
      bloc.add(AddCustomerAddressEvent(addressList: addressModel));
    }
  }

  onAddress1Changed(String value) => setState(() {});

  onAddress2Changed(String value) => setState(() {});

  onCityChanged(String value) => setState(() {});

  onZipCodeChanged(String value) => setState(() {});

  onPhoneChanged(String value) => setState(() {});
}
