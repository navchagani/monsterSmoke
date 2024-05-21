import 'package:flutter/material.dart';
import 'package:monstersmoke/core/widgets/CustomButton.dart';
import 'package:monstersmoke/dashboard/addAddress.dart';

class UserAddresses extends StatefulWidget {
  const UserAddresses({super.key});

  @override
  State<UserAddresses> createState() => _UserAddressesState();
}

class _UserAddressesState extends State<UserAddresses> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            decoration: const BoxDecoration(
              color: Color(0xff202b38),
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(50),
              ),
            ),
            child: Column(
              children: [
                const SizedBox(height: 30),
                ListTile(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 30),
                  title: Text(
                    'Address Book Management',
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium
                        ?.copyWith(color: Colors.white),
                  ),
                  trailing: const CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.location_on,
                      size: 30,
                      color: Colors.black,
                    ),
                  ),
                ),
                const SizedBox(height: 30)
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CustomButton(
                      text: 'Add Address',
                      textColor: Colors.white,
                      iconData: Icons.add,
                      iconColor: Colors.white,
                      enabled: true,
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const AddAddress())),
                      backgroundColor: const Color(0xff202b38),
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Column(
                  children: [
                    Center(
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Address List 1',
                                    style: TextStyle(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .primary,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const Icon(
                                    Icons.edit_location_alt,
                                    color: Color(0xff202b38),
                                  )
                                ],
                              ),
                              const Padding(
                                padding: EdgeInsets.only(
                                    left: 15, right: 15, top: 10),
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
                                            end: const BorderSide(
                                                color: Color.fromARGB(
                                                    255, 218, 216, 216),
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
                                  const Column(
                                    children: [
                                      Text(
                                        'This is Test Address',
                                        style: TextStyle(fontSize: 14),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                              const Row(
                                children: [
                                  Text(
                                    'City: ',
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text('Karachi')
                                ],
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              const Row(
                                children: [
                                  Text(
                                    'State: ',
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text('Sindh')
                                ],
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              const Row(
                                children: [
                                  Text(
                                    'Country: ',
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text('Pakistan')
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Row(
                                children: [
                                  Expanded(
                                      child: Column(
                                    children: [
                                      Text(
                                        "Default shipping address",
                                        style: TextStyle(
                                            fontSize: 14,
                                            color: Color.fromARGB(
                                                255, 173, 32, 22)),
                                      )
                                    ],
                                  )),
                                  Expanded(
                                      child: Column(
                                    children: [
                                      Text(
                                        "Default shipping address",
                                        style: TextStyle(
                                            fontSize: 14,
                                            color: Color.fromARGB(
                                                255, 173, 32, 22)),
                                      )
                                    ],
                                  ))
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Center(
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Address List 1',
                                    style: TextStyle(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .primary,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const Icon(
                                    Icons.edit_location_alt,
                                    color: Color(0xff202b38),
                                  )
                                ],
                              ),
                              const Padding(
                                padding: EdgeInsets.only(
                                    left: 15, right: 15, top: 10),
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
                                            end: const BorderSide(
                                                color: Color.fromARGB(
                                                    255, 218, 216, 216),
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
                                  const Column(
                                    children: [
                                      Text(
                                        'This is Test Address',
                                        style: TextStyle(fontSize: 14),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                              const Row(
                                children: [
                                  Text(
                                    'City: ',
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text('Karachi')
                                ],
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              const Row(
                                children: [
                                  Text(
                                    'State: ',
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text('Sindh')
                                ],
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              const Row(
                                children: [
                                  Text(
                                    'Country: ',
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text('Pakistan')
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Row(
                                children: [
                                  Expanded(
                                      child: Column(
                                    children: [
                                      Text(
                                        "Default shipping address",
                                        style: TextStyle(
                                            fontSize: 14,
                                            color: Color.fromARGB(
                                                255, 173, 32, 22)),
                                      )
                                    ],
                                  )),
                                  Expanded(
                                      child: Column(
                                    children: [
                                      Text(
                                        "Default shipping address",
                                        style: TextStyle(
                                            fontSize: 14,
                                            color: Color.fromARGB(
                                                255, 173, 32, 22)),
                                      )
                                    ],
                                  ))
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Center(
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Address List 1',
                                    style: TextStyle(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .primary,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const Icon(
                                    Icons.edit_location_alt,
                                    color: Color(0xff202b38),
                                  )
                                ],
                              ),
                              const Padding(
                                padding: EdgeInsets.only(
                                    left: 15, right: 15, top: 10),
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
                                            end: const BorderSide(
                                                color: Color.fromARGB(
                                                    255, 218, 216, 216),
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
                                  const Column(
                                    children: [
                                      Text(
                                        'This is Test Address',
                                        style: TextStyle(fontSize: 14),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                              const Row(
                                children: [
                                  Text(
                                    'City: ',
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text('Karachi')
                                ],
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              const Row(
                                children: [
                                  Text(
                                    'State: ',
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text('Sindh')
                                ],
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              const Row(
                                children: [
                                  Text(
                                    'Country: ',
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text('Pakistan')
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Row(
                                children: [
                                  Expanded(
                                      child: Column(
                                    children: [
                                      Text(
                                        "Default shipping address",
                                        style: TextStyle(
                                            fontSize: 14,
                                            color: Color.fromARGB(
                                                255, 173, 32, 22)),
                                      )
                                    ],
                                  )),
                                  Expanded(
                                      child: Column(
                                    children: [
                                      Text(
                                        "Default shipping address",
                                        style: TextStyle(
                                            fontSize: 14,
                                            color: Color.fromARGB(
                                                255, 173, 32, 22)),
                                      )
                                    ],
                                  ))
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
