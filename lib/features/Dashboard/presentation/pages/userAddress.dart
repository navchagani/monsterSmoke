import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:monstersmoke/core/inject.dart';
import 'package:monstersmoke/core/widgets/CustomButton.dart';
import 'package:monstersmoke/features/Auth/data/models/CustomerModel.dart';
import 'package:monstersmoke/features/Customer/presentation/bloc/AddCustomerBloc/add_customer_bloc_bloc.dart';
import 'package:monstersmoke/features/Customer/presentation/bloc/GetCustomerBloc/customer_bloc_bloc.dart';
import 'package:monstersmoke/features/Dashboard/presentation/pages/addAddress.dart';

class UserAddresses extends StatefulWidget {
  const UserAddresses({super.key});

  @override
  State<UserAddresses> createState() => _UserAddressesState();
}

class _UserAddressesState extends State<UserAddresses> {
  final addCustomerBloc = getIt<AddCustomerAddressBloc>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Address Book Management',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff202b38)),
                textAlign: TextAlign.start,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CustomButton(
                  onTap: onMoveToAddAddress,
                  text: 'Add Address',
                  enabled: true,
                  textColor: Colors.white,
                  iconData: Icons.add,
                  iconColor: Colors.white,
                  backgroundColor: const Color(0xff202b38),
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            BlocBuilder<CustomerBloc, CustomerBlocState>(
              builder: (context, customerState) {
                final list =
                    customerState.customerModel?.customerStoreAddressList;

                return Column(
                  children: list!.map((e) => AddressCard(model: e)).toList(),
                );
              },
            )
          ],
        ),
      ),
    );
  }

  onMoveToAddAddress() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const AddAddress()));
  }
}

class AddressCard extends StatelessWidget {
  final CustomerStoreAddressList model;
  const AddressCard({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    log(model.defaultBillingAddress.toString());
    log(model.defaultShippingAddress.toString());

    return Center(
      child: Card(
        elevation: 8,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(15.00),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      model.address1.toString(),
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          overflow: TextOverflow.ellipsis),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.edit_location_alt),
                    onPressed: () => onEditAddress(context, model),
                    color: const Color(0xff202b38),
                  )
                ],
              ),
              const Padding(
                padding: EdgeInsets.only(left: 15, right: 15, top: 10),
                child: Divider(
                  height: 1,
                  color: Color.fromARGB(255, 218, 216, 216),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  Container(
                    decoration: const BoxDecoration(
                        border: BorderDirectional(
                            end: BorderSide(
                                color: Color.fromARGB(255, 218, 216, 216),
                                width: 1))),
                    child: const Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Icon(
                            Icons.home_rounded,
                            size: 40,
                            color: Color(0xff202b38),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Text(model.address1.toString(),
                        style: const TextStyle(fontSize: 14),
                        overflow: TextOverflow.ellipsis),
                  ),
                ],
              ),
              Row(
                children: [
                  const Text(
                    'City: ',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                  Text(model.city.toString())
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  const Text(
                    'State: ',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                  Text(model.state.toString())
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  const Text(
                    'Country: ',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                  Text(model.country.toString())
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  if (model.defaultShippingAddress ?? false)
                    const Expanded(
                        child: Text(
                      "Default shipping address",
                      style: TextStyle(
                          fontSize: 14,
                          color: Color.fromARGB(255, 173, 32, 22)),
                    )),
                  if (model.defaultBillingAddress ?? false)
                    const Expanded(
                        child: Text(
                      "Default billing address",
                      style: TextStyle(
                          fontSize: 14,
                          color: Color.fromARGB(255, 173, 32, 22)),
                    ))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void onEditAddress(
      BuildContext context, CustomerStoreAddressList addressList) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => AddAddress(
              forUpdate: true,
              addressList: addressList,
            )));
  }
}
