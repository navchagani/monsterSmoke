import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:monstersmoke/Decorations/Decorations.dart';
import 'package:monstersmoke/Global/Widgets/DropDowns.dart';
import 'package:monstersmoke/core/blocs/CustomBlocs.dart';
import 'package:monstersmoke/core/inject.dart';
import 'package:monstersmoke/core/widgets/CustomButton.dart';
import 'package:monstersmoke/core/widgets/CustomIniputField.dart';
import 'package:monstersmoke/features/GETAssets/data/models/CountryModel.dart';
import 'package:monstersmoke/features/GETAssets/data/models/PaymentsModel.dart';
import 'package:monstersmoke/features/GETAssets/data/models/StateModel.dart';
import 'package:monstersmoke/features/GETAssets/presentation/bloc/PaymentBloc/payment_bloc_bloc.dart';
import 'package:monstersmoke/features/GETAssets/presentation/bloc/StateBloc/state_bloc_bloc.dart';
import 'package:monstersmoke/features/PlaceOrder/data/models/placeOrderModel.dart';

class PaymentPage extends StatefulWidget {
  final Function(int index)? moveToNext;
  const PaymentPage({super.key, this.moveToNext});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  PaymentsModel? model;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PaymentBloc, PaymentBlocState>(
      builder: (context, state) {
        if (state is PaymentBlocInitial) {
          return Container(
            height: 40,
            color: Colors.amber,
          );
        }
        if (state is PaymentCompletedPayment) {
          final list = state.lilstContries
              .where((element) => element.ecommerce == true)
              .toList();
          return Wrap(
            runSpacing: -3.0,
            spacing: 6.0,
            children: List.generate(list.length, (index) {
              final data = list[index];
              final selected = data.id == model?.id;

              return RawChip(
                  elevation: 4.0,
                  shadowColor: Colors.black54,
                  selectedColor: Theme.of(context).colorScheme.primary,
                  selected: selected,
                  labelStyle: TextStyle(
                      color: selected ? Colors.white : Colors.black45),
                  onPressed: () => onChipTap(data),
                  backgroundColor: Theme.of(context).colorScheme.surface,
                  shape: RoundedRectangleBorder(
                      side: BorderSide(
                          color: Theme.of(context).colorScheme.onSurface),
                      borderRadius: BorderRadius.circular(10.0)),
                  label: Text(data.name.toString()));
            }),
          );
        }

        return Container();
      },
    );
  }

  onChipTap(PaymentsModel data) {
    setState(() {
      model = data;
    });

    SelectedPaymentBloc bloc = BlocProvider.of(context);
    bloc.add(model);

    if (data.id == 2) {
      showBottomSheet(
          context: context,
          builder: ((context) => AddNewPaymentPage(
                moveToNext: (index) => widget.moveToNext!(3),
              )));
    } else {
      if (model?.id != null) {
        Future.delayed(const Duration(milliseconds: 700)).whenComplete(() {
          setState(() {
            widget.moveToNext!(3);
          });
        });
      }
    }
  }
}

class AddNewPaymentPage extends StatefulWidget {
  final Function(int index)? moveToNext;
  const AddNewPaymentPage({super.key, this.moveToNext});

  @override
  State<AddNewPaymentPage> createState() => _AddNewCustomerAddressPageState();
}

class _AddNewCustomerAddressPageState extends State<AddNewPaymentPage> {
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final cardNumberController = TextEditingController();
  final expiryMonthController = TextEditingController();
  final expiryYearController = TextEditingController();

  final cvcController = TextEditingController();
  final addressController = TextEditingController();
  final cityController = TextEditingController();
  final zipCodeController = TextEditingController();

  String? selectedContry, selectedCity;

  final stateBloc = getIt<StateBloc>();

  @override
  void dispose() {
    stateBloc.close();
    super.dispose();
  }

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
            const ListTile(
                contentPadding: EdgeInsets.all(0.0),
                title: Text(
                  'Add Payment Info',
                  style: TextStyle(fontSize: 20, color: Colors.black),
                )),
            Decorations.height5,
            CustomInputField(
                labelText: 'Enter First Name',
                hintText: 'Enter First Name',
                controller: firstNameController,
                inputType: TextInputType.text,
                onChanged: firstNameChanged),
            Decorations.height5,
            CustomInputField(
                labelText: 'Enter Second Name',
                hintText: 'Enter Second Name',
                controller: lastNameController,
                inputType: TextInputType.text,
                onChanged: lastNameChanged),
            Decorations.height5,
            CustomInputField(
                labelText: 'Enter Card Number',
                hintText: 'Enter Card Number',
                controller: cardNumberController,
                inputType: TextInputType.number,
                onChanged: onCardNumberChanged),
            Decorations.height5,
            Row(
              children: [
                Expanded(
                  child: CustomInputField(
                      labelText: 'Expiration Month MM',
                      hintText: 'Expiration Month MM',
                      controller: expiryMonthController,
                      inputType: TextInputType.number,
                      onChanged: onMonthExpiryChanged),
                ),
                Decorations.width5,
                Expanded(
                  child: CustomInputField(
                    labelText: 'Expiration Year YY',
                    hintText: 'Expiration Year YY',
                    controller: expiryYearController,
                    inputType: TextInputType.number,
                    onChanged: onYearExpiryChanged,
                  ),
                ),
              ],
            ),
            Decorations.height5,
            Row(
              children: [
                Expanded(
                  child: CustomInputField(
                      labelText: 'Enter CVV2',
                      hintText: 'Enter CVV2',
                      controller: cvcController,
                      inputType: TextInputType.number,
                      onChanged: onCVVChanged),
                ),
                Decorations.width5,
                Expanded(
                  child: CustomInputField(
                    labelText: 'Address',
                    hintText: 'Address',
                    controller: addressController,
                    inputType: TextInputType.text,
                    onChanged: onAddressChanged,
                  ),
                ),
              ],
            ),
            Decorations.height5,
            CountryDropDown(onCountryChanged: onCountryChanged),
            Decorations.height5,
            StateDropDown(
              onStateChanged: onStateChanged,
              stateBloc: stateBloc,
            ),
            Decorations.height5,
            Row(
              children: [
                Expanded(
                  child: CustomInputField(
                      labelText: 'City',
                      hintText: 'City',
                      controller: cityController,
                      inputType: TextInputType.text,
                      onChanged: onCityChanged),
                ),
                Decorations.width5,
                Expanded(
                  child: CustomInputField(
                    labelText: 'Zip Code',
                    hintText: 'Zip Code',
                    controller: zipCodeController,
                    inputType: TextInputType.number,
                    onChanged: onzipCodeChanged,
                  ),
                ),
              ],
            ),
            Decorations.height30,
            CustomButton(
              text: 'Add New Method',
              onTap: onAddNewMethod,
            )
          ],
        ),
      );

  firstNameChanged(String value) => setState(() {});

  onPhoneChanged(String value) => setState(() {});

  onzipCodeChanged(String value) => setState(() {});

  onCityChanged(String value) => setState(() {});

  lastNameChanged(String value) => setState(() {});

  onCountryChanged(CountryModel? p1) {
    stateBloc.add(GetStateEvent(stateId: p1!.id.toString()));

    setState(() {
      selectedContry = p1.name.toString();
    });
  }

  onStateChanged(StateModel? p1) {
    setState(() {
      selectedCity = p1?.name.toString();
    });
  }

  onCardNumberChanged(String value) => setState(() {});

  onMonthExpiryChanged(String value) => setState(() {});

  onYearExpiryChanged(String value) => setState(() {});

  onCVVChanged(String value) => setState(() {});

  onAddressChanged(String value) => setState(() {});

  onAddNewMethod() {
    final addNewMethod = CustomerOrderCard(
        firstName: firstNameController.text,
        lastName: lastNameController.text,
        cardNumber: cardNumberController.text,
        expirationMonth: expiryMonthController.text,
        expirationYear: expiryYearController.text,
        countryId: int.parse(selectedContry.toString()),
        stateId: int.parse(selectedCity.toString()),
        city: cityController.text,
        zipcode: zipCodeController.toString());

    CustomerCardBloc bloc = BlocProvider.of<CustomerCardBloc>(context);
    bloc.add(addNewMethod);

    Navigator.of(context).pop();
    Future.delayed(const Duration(milliseconds: 200))
        .whenComplete(() => widget.moveToNext!(3));
  }
}
