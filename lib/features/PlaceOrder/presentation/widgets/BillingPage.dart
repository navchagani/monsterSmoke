import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:monstersmoke/Decorations/Decorations.dart';
import 'package:monstersmoke/Global/Widgets/DropDowns.dart';
import 'package:monstersmoke/core/widgets/CustomButton.dart';
import 'package:monstersmoke/core/widgets/CustomIniputField.dart';
import 'package:monstersmoke/features/Auth/data/models/CustomerModel.dart';
import 'package:monstersmoke/features/Auth/presentation/bloc/CustomerBloc/customer_bloc_bloc.dart';
import 'package:monstersmoke/features/GETAssets/data/models/CountryModel.dart';
import 'package:monstersmoke/features/GETAssets/data/models/StateModel.dart';

class BillingPage extends StatefulWidget {
  final Function(int index)? moveToNext;
  const BillingPage({
    super.key,
    this.moveToNext,
  });

  @override
  State<BillingPage> createState() => _BillingPageState();
}

class _BillingPageState extends State<BillingPage> {
  bool currentAddress = true;
  String? selectedAddress;

  @override
  void initState() {
    CustomerBloc bloc = BlocProvider.of<CustomerBloc>(context);

    CustomerStoreAddressList? defaultAddress = bloc
        .state.customerModel?.customerStoreAddressList
        ?.firstWhere((element) => element.defaultBillingAddress == true,
            orElse: () => const CustomerStoreAddressList());

    if (defaultAddress != null) {
      setState(() {
        selectedAddress = defaultAddress.address1;
      });
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CustomerBloc, CustomerBlocState>(
      builder: (context, customerState) {
        return Column(
          children: [
            DropdownButtonFormField(
              items: customerState.customerModel!.customerStoreAddressList!
                  .map((e) => DropdownMenuItem<CustomerStoreAddressList>(
                        value: e,
                        child: Text(e.address1.toString()),
                      ))
                  .toList(),
              hint: const Text('Select Your Address'),
              isExpanded: true,
              onChanged: onAddressChanged,
              decoration: Decorations.inputDecoration(
                  hint: 'Select Your Address', context: context),
            ),
            Decorations.height10,
            CustomButton(
              text: 'Add New Address',
              onTap: onDifferentAddressChanged,
              isBordered: false,
            ),
            Decorations.height10,
          ],
        );
      },
    );
  }

  // Widget selection() {
  //   return Row(
  //     children: [
  //       Expanded(
  //         child: CheckboxListTile(
  //             contentPadding: const EdgeInsets.all(0.0),
  //             title: const Text('Current Address'),
  //             value: currentAddress,
  //             onChanged: onCurrentAddressChanged),
  //       ),
  //       Expanded(
  //         child: CheckboxListTile(
  //             contentPadding: const EdgeInsets.all(0.0),
  //             title: const Text('Different Address'),
  //             value: !currentAddress,
  //             onChanged: onDifferentAddressChanged),
  //       )
  //     ],
  //   );
  // }

  void onAddressChanged(CustomerStoreAddressList? value) {
    setState(() {
      selectedAddress = value?.address1;
    });

    if (selectedAddress != null) {
      Future.delayed(const Duration(milliseconds: 700)).whenComplete(() {
        setState(() {
          widget.moveToNext!(1);
        });
      });
    }
  }

  void onDifferentAddressChanged() {
    showBottomSheet(
        context: context,
        builder: ((context) {
          return const AddNewCustomerAddressPage();
        }));
  }

  void onCurrentAddressChanged(bool? value) {
    setState(() {
      currentAddress = true;
    });
  }
}

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

  @override
  Widget build(BuildContext context) {
    return addNewAddress();
  }

  Widget addNewAddress() => Material(
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
            const CustomButton(
              text: 'Add Address',
              // isBordered: false,
              // enabled: true,
            )
          ],
        ),
      );

  address1Changed(String value) => setState(() {});

  onPhoneChanged(String value) => setState(() {});

  onzipCodeChanged(String value) => setState(() {});

  onCityChanged(String value) => setState(() {});

  address2Changed(String value) => setState(() {});

  onCountryChanged(CountryModel? p1) {}

  onStateChanged(StateModel? p1) {}
}
