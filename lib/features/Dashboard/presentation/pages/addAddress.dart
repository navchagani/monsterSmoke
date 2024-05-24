import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:monstersmoke/Decorations/Decorations.dart';
import 'package:monstersmoke/Global/Widgets/DropDowns.dart';
import 'package:monstersmoke/core/widgets/CustomButton.dart';
import 'package:monstersmoke/core/widgets/CustomIniputField.dart';
import 'package:monstersmoke/features/GETAssets/data/models/CountryModel.dart';
import 'package:monstersmoke/features/GETAssets/data/models/StateModel.dart';
import 'package:monstersmoke/features/GETAssets/presentation/bloc/StateBloc/state_bloc_bloc.dart';

class AddAddress extends StatefulWidget {
  const AddAddress({super.key});

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              const CustomInputField(
                  labelText: 'Address 1', hintText: 'Address 1'),
              const SizedBox(
                height: 10,
              ),
              const CustomInputField(
                  labelText: 'Address 2', hintText: 'Address 2'),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Expanded(
                      child:
                          CountryDropDown(onCountryChanged: onAddressChanged)),
                  Decorations.width5,
                  Expanded(
                      child: StateDropDown(onStateChanged: onStateChanged)),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              const CustomInputField(
                  labelText: 'Address 1', hintText: 'Address 1'),
              const SizedBox(
                height: 10,
              ),
              const CustomButton(
                text: 'Add Address',
                textColor: Colors.white,
                enabled: true,
                backgroundColor: Color(0xff202b38),
              )
            ],
          ),
        ),
      ),
    );
  }

  void onAddressChanged(CountryModel? value) {
    StateBloc bloc = BlocProvider.of<StateBloc>(context);
    bloc.add(GetStateEvent(stateId: value!.id.toString()));

    setState(() {
      selectedCountry = int.parse(value.id.toString());
    });
  }

  void onStateChanged(StateModel? value) {
    setState(() {
      selectedState = int.parse(value!.id.toString());
    });
  }
}
