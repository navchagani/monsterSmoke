import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:monstersmoke/Decorations/Decorations.dart';
import 'package:monstersmoke/core/inject.dart';
import 'package:monstersmoke/features/GETAssets/data/models/CountryModel.dart';
import 'package:monstersmoke/features/GETAssets/data/models/StateModel.dart';
import 'package:monstersmoke/features/GETAssets/presentation/bloc/CountryBloc/country_bloc_bloc.dart';
import 'package:monstersmoke/features/GETAssets/presentation/bloc/StateBloc/state_bloc_bloc.dart';

class StateDropDown extends StatelessWidget {
  final Function(StateModel?) onStateChanged;
  final StateBloc stateBloc;

  const StateDropDown(
      {super.key, required this.onStateChanged, required this.stateBloc});
  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: stateBloc,
      child: BlocBuilder<StateBloc, StateBlocState>(
        bloc: stateBloc,
        builder: (context, states) {
          if (states is StateCompletedState) {
            return DropdownButtonFormField<StateModel>(
                isExpanded: true,
                decoration: Decorations.inputDecoration(
                    hint: 'Please Select Country', context: context),
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
      ),
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
  final countryBloc = getIt<CountryBloc>();

  @override
  void initState() {
    countryBloc.add(const GetCountryEvent());
    super.initState();
  }

  @override
  void dispose() {
    countryBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: countryBloc,
      child: BlocBuilder<CountryBloc, CountryBlocState>(
        bloc: countryBloc,
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
              decoration: Decorations.inputDecoration(
                  hint: 'Country', context: context),
              items: const [],
              onChanged: (value) {});
        },
      ),
    );
  }
}
