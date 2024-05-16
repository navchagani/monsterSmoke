import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:monstersmoke/core/blocs/CustomBlocs.dart';
import 'package:monstersmoke/features/GETAssets/data/models/ShippingAddressModel.dart';
import 'package:monstersmoke/features/GETAssets/presentation/bloc/ShippingBloc/shipping_bloc_bloc.dart';

class ShippingPage extends StatefulWidget {
  final Function(int index)? moveToNext;
  const ShippingPage({super.key, this.moveToNext});

  @override
  State<ShippingPage> createState() => _ShippingPageState();
}

class _ShippingPageState extends State<ShippingPage> {
  ShippingAddressModel? model;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ShippingBloc, ShippingBlocState>(
        builder: (context, state) {
      if (state is ShippingBlocInitial) {
        return Container(
          height: 40,
          color: Colors.amber,
        );
      }
      if (state is ShippingCompletedShipping) {
        return Wrap(
          runSpacing: 6.0,
          spacing: 6.0,
          children: List.generate(state.lilstContries.length, (index) {
            final data = state.lilstContries[index];
            final selected = data.id == model?.id;

            return RawChip(
                // elevation: 4.0,
                // shadowColor: Colors.black54,
                selectedColor: Theme.of(context).colorScheme.primary,
                selected: selected,
                labelStyle:
                    TextStyle(color: selected ? Colors.white : Colors.black45),
                onPressed: () => onChipTap(data),
                backgroundColor: Colors.transparent,
                shape: RoundedRectangleBorder(
                    side: BorderSide(
                        color: Theme.of(context).colorScheme.onBackground),
                    borderRadius: BorderRadius.circular(10.0)),
                avatar: Text(
                  '\$${data.amount.toString()}',
                  style: const TextStyle(color: Colors.deepOrange),
                ),
                label: Text(data.name.toString()));
          }),
        );
      }

      return Container();
    });
  }

  onChipTap(ShippingAddressModel e) {
    setState(() {
      model = e;
    });

    SelectedShipmentBloc bloc = BlocProvider.of(context);
    bloc.add(model);

    if (model != null) {
      Future.delayed(const Duration(milliseconds: 700)).whenComplete(() {
        setState(() {
          widget.moveToNext!(2);
        });
      });
    }
  }
}
