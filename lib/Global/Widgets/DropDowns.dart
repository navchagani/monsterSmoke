import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:monstersmoke/Decorations/Decorations.dart';
import 'package:monstersmoke/features/GETAssets/data/models/CountryModel.dart';
import 'package:monstersmoke/features/GETAssets/data/models/StateModel.dart';
import 'package:monstersmoke/features/GETAssets/presentation/bloc/CountryBloc/country_bloc_bloc.dart';
import 'package:monstersmoke/features/GETAssets/presentation/bloc/StateBloc/state_bloc_bloc.dart';

class StateDropDown extends StatelessWidget {
  final Function(StateModel?) onStateChanged;

  const StateDropDown({super.key, required this.onStateChanged});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StateBloc, StateBlocState>(
      builder: (context, states) {
        if (states is StateCompletedState) {
          return DropdownButtonFormField<StateModel>(
              isExpanded: true,
              decoration:
                  Decorations.inputDecoration(hint: 'State', context: context),
              items: states.lilstContries
                  .map((e) => DropdownMenuItem(
                        value: e,
                        child: Text(e.name.toString(),
                            style: const TextStyle(color: Colors.black)),
                      ))
                  .toList(),
              onChanged: onStateChanged);
        }

        return DropdownButtonFormField<CountryModel>(
            decoration:
                Decorations.inputDecoration(hint: 'States', context: context),
            items: const [],
            onChanged: (value) {});
      },
    );
  }
}

class CountryDropDown extends StatefulWidget {
  final Function(CountryModel?) onCountryChanged;
  const CountryDropDown({super.key, required this.onCountryChanged});

  @override
  State<CountryDropDown> createState() => _CountryDropDownState();
}

class _CountryDropDownState extends State<CountryDropDown> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CountryBloc, CountryBlocState>(
      builder: (context, countryState) {
        if (countryState is CountryCompletedCountry) {
          return DropdownButtonFormField<CountryModel>(
              decoration: Decorations.inputDecoration(
                  hint: 'Country', context: context),
              items: countryState.lilstContries
                  .map((e) => DropdownMenuItem(
                        value: e,
                        child: Text(e.name.toString(),
                            style: const TextStyle(color: Colors.black)),
                      ))
                  .toList(),
              onChanged: widget.onCountryChanged);
        }

        return DropdownButtonFormField<CountryModel>(
            decoration:
                Decorations.inputDecoration(hint: 'Country', context: context),
            items: const [],
            onChanged: (value) {});
      },
    );
  }
}
