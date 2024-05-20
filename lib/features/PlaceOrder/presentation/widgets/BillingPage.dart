import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:monstersmoke/Decorations/Decorations.dart';
import 'package:monstersmoke/core/blocs/CustomBlocs.dart';
import 'package:monstersmoke/core/widgets/CustomButton.dart';
import 'package:monstersmoke/features/Auth/data/models/CustomerModel.dart';
import 'package:monstersmoke/features/Customer/presentation/bloc/GetCustomerBloc/customer_bloc_bloc.dart';
import 'package:monstersmoke/features/Customer/presentation/pages/AddCustomerPage.dart';

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
              items: customerState.customerModel?.customerStoreAddressList!
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

    SelectedAddressBloc bloc = BlocProvider.of(context);
    bloc.add(value);

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
}
