import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:intl/intl.dart';
import 'package:monstersmoke/const/Constants.dart';
import 'package:monstersmoke/core/inject.dart';
import 'package:monstersmoke/features/Dashboard/presentation/pages/recentOrders.dart';
import 'package:monstersmoke/features/Customer/presentation/bloc/GetCustomerBloc/customer_bloc_bloc.dart';
import 'package:monstersmoke/features/Dashboard/data/models/statementModel.dart';
import 'package:monstersmoke/features/Dashboard/presentation/bloc/dashboard_bloc.dart';
import 'package:monstersmoke/features/sharedPrefsApi.dart';

class UserStatement extends StatefulWidget {
  const UserStatement({super.key});

  @override
  State<UserStatement> createState() => UserStatementState();
}

class UserStatementState extends State<UserStatement> {
  List<dynamic> data = orderData;

  DateTime? fromDate;
  DateTime? toDate;
  TextEditingController fromDateController = TextEditingController();
  TextEditingController toDateController = TextEditingController();

  final statementBloc = getIt<DashboardBloc>();

  @override
  void initState() {
    final now = DateTime.now();
    final firstDay = DateTime(now.year, now.month, 1);

    fromDateController.text = fromDate != null
        ? _dateFormat(fromDate!)
        : DateFormat('yyyy-MM-dd+hh:mm:ss').format(firstDay);
    toDateController.text = toDate != null
        ? _dateFormat(toDate!)
        : DateFormat('yyyy-MM-dd+hh:mm:ss').format(now);

    CustomerBloc bloc = BlocProvider.of<CustomerBloc>(context);

    statementBloc.add(GetStatementEvent(
        storeIds: '1,2',
        startDate: fromDateController.text,
        customerIds: bloc.state.customerModel?.id.toString(),
        endDate: toDateController.text,
        page: 0,
        size: 10));

    super.initState();
  }

  String _dateFormat(DateTime date) {
    return "${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}-${date.year}";
  }

  Future<void> _selectFromDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: fromDate ?? DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2025),
    );
    if (picked != null && picked != fromDate) {
      setState(() {
        fromDate = picked;
        fromDateController.text = _dateFormat(picked);
      });
    }
  }

  Future<void> _selectToDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: toDate ?? DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2025),
      builder: (context, child) {
        return Theme(
          data: ThemeData.light().copyWith(
            colorScheme: const ColorScheme.light(
              primary: Color(0xff202b38),
              onPrimary: Colors.white,
              surface: Colors.white,
              onSurface: Colors.black,
            ),
            dialogBackgroundColor: Colors.white,
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor: const Color(0xff202b38),
              ),
            ),
          ),
          child: child!,
        );
      },
    );

    if (picked != null && picked != toDate) {
      setState(() {
        toDate = picked;
        toDateController.text = _dateFormat(picked);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    CustomerBloc customer = BlocProvider.of<CustomerBloc>(context);
    return BlocProvider.value(
      value: statementBloc,
      child: BlocBuilder<DashboardBloc, DashboardState>(
        bloc: statementBloc,
        builder: (context, dashboardState) {
          if (dashboardState is DashboardLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (dashboardState is StatementLoadedState) {
            final model = dashboardState.statementModel;

            return SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      color: Color(0xff202b38),
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(50),
                        bottomLeft: Radius.circular(50),
                      ),
                    ),
                    child: Column(
                      children: [
                        const SizedBox(height: 30),
                        ListTile(
                          contentPadding:
                              const EdgeInsets.symmetric(horizontal: 30),
                          title: const Text(
                            'WELCOME',
                            style: TextStyle(color: Colors.white, fontSize: 25),
                          ),
                          subtitle: Text(
                              customer.state.customerModel!.name ?? "No Name  ",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium
                                  ?.copyWith(color: Colors.white)),
                          trailing: const CircleAvatar(
                            radius: 30,
                            backgroundImage: NetworkImage(
                                'https://img.freepik.com/premium-vector/anonymous-user-circle-icon-vector-illustration-flat-style-with-long-shadow_520826-1931.jpg'),
                          ),
                        ),
                        const SizedBox(height: 15),
                        Padding(
                          padding: const EdgeInsets.only(right: 40, left: 40),
                          child: Container(
                            height: 90,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(50)),
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(right: 20, left: 20),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      const Text(
                                        'Orders',
                                        style: TextStyle(
                                          color:
                                              Color.fromARGB(255, 171, 29, 48),
                                        ),
                                      ),
                                      Text(
                                        model.customerStatementSummaryDto!
                                            .openingBalance
                                            .toString(),
                                        style: const TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      const Text(
                                        'Spend',
                                        style: TextStyle(
                                          color:
                                              Color.fromARGB(255, 171, 29, 48),
                                        ),
                                      ),
                                      Text(
                                        model.customerStatementSummaryDto!
                                            .invoicedAmount
                                            .toString(),
                                        style: const TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      const Text(
                                        'Due',
                                        style: TextStyle(
                                          color:
                                              Color.fromARGB(255, 171, 29, 48),
                                        ),
                                      ),
                                      Text(
                                        model.customerStatementSummaryDto!
                                            .amountReceived
                                            .toString(),
                                        style: const TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      const Text(
                                        'Credit',
                                        style: TextStyle(
                                          color:
                                              Color.fromARGB(255, 171, 29, 48),
                                        ),
                                      ),
                                      Text(
                                        model.customerStatementSummaryDto!
                                            .totalDueBalance
                                            .toString(),
                                        style: const TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 30),
                      ],
                    ),
                  ),
                  // Container(
                  //   padding: const EdgeInsets.symmetric(
                  //       horizontal: 10, vertical: 10),
                  //   decoration: const BoxDecoration(
                  //       borderRadius:
                  //           BorderRadius.only(topLeft: Radius.circular(50))),
                  //   child: Column(
                  //     children: [
                  //       const SizedBox(height: 10),
                  //       const Text(
                  //         "Statement",
                  //         style: TextStyle(
                  //             color: Color.fromARGB(255, 171, 29, 48),
                  //             fontWeight: FontWeight.w600,
                  //             fontSize: 18),
                  //         textAlign: TextAlign.left,
                  //       ),
                  //       const SizedBox(height: 20),
                  //       GridView.count(
                  //         shrinkWrap: true,
                  //         physics: const NeverScrollableScrollPhysics(),
                  //         crossAxisCount: 2,
                  //         crossAxisSpacing: 20,
                  //         mainAxisSpacing: 20,
                  //         children: [
                  //           itemDashboard(
                  //               'Opening Balance',

                  //                   .toString(),
                  //               CupertinoIcons.cube,
                  //               const Color(0xff202b38)),
                  //           itemDashboard(
                  //               'Invoiced Amount',

                  //                   .toString(),
                  //               Icons.inventory_rounded,
                  //               const Color(0xff202b38)),
                  //           itemDashboard(
                  //               'Amount Received',

                  //                   .toString(),
                  //               Icons.attach_money_rounded,
                  //               const Color(0xff202b38)),
                  //           itemDashboard(
                  //               'Total Due Balance',

                  //                   .toString(),
                  //               Icons.store,
                  //               const Color(0xff202b38)),
                  //         ],
                  //       ),
                  //       const SizedBox(
                  //         height: 20,
                  //       ),
                  //       Align(
                  //         alignment: Alignment.centerRight,
                  //         child: CustomButton(
                  //           onTap: () async => await download(),
                  //           text: 'Print',
                  //           backgroundColor: const Color(0xff202b38),
                  //           textColor: Colors.white,
                  //           enabled: true,
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  const SizedBox(height: 20),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: 10),
                      Text(
                        "Statements",
                        style: TextStyle(
                            color: Color.fromARGB(255, 171, 29, 48),
                            fontWeight: FontWeight.w600,
                            fontSize: 18),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 15,
                    ),
                    child: Container(
                      width: MediaQuery.of(context).size.width - 40,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 1,
                            blurRadius: 6,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          const Padding(
                            padding: EdgeInsets.all(12),
                            child: Icon(Icons.calendar_today,
                                color: Color(0xff202b38)),
                          ),
                          Expanded(
                            child: TextFormField(
                              controller: fromDateController,
                              readOnly: true,
                              onTap: () => _selectFromDate(context),
                              decoration: const InputDecoration(
                                labelText: 'From Date (mm-dd-yyyy)',
                                labelStyle: TextStyle(color: Color(0xff202b38)),
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 10),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 5),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 15),
                    child: Container(
                      width: MediaQuery.of(context).size.width -
                          40, // Adjust the width as necessary
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 1,
                            blurRadius: 6,
                            offset: const Offset(
                                0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          const Padding(
                            padding: EdgeInsets.all(12),
                            child: Icon(Icons.calendar_today,
                                color: Color(0xff202b38)),
                          ),
                          Expanded(
                            child: TextFormField(
                              controller: toDateController,
                              readOnly: true,
                              onTap: () => _selectToDate(context),
                              decoration: const InputDecoration(
                                labelText: 'To Date (mm-dd-yyyy)',
                                labelStyle: TextStyle(color: Color(0xff202b38)),
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 10),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  PaginatedDataTable(
                    columns: const <DataColumn>[
                      DataColumn(
                        label: Text(
                          'Date',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          'Type',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          'Excess Amount',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          'Credit',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          'Debit',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          'Balance',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          'Order Id',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          'Description',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                    source: MyData(
                        statementModel:
                            model.customerDetailedStatementReportDtoList!),
                    header: const Center(
                        child: Text(
                      "Recent Orders",
                      style: TextStyle(
                          color: Color.fromARGB(255, 171, 29, 48),
                          fontWeight: FontWeight.w600,
                          fontSize: 18),
                    )),
                    columnSpacing: 20,
                    horizontalMargin: 20,
                    showFirstLastButtons: true,
                    rowsPerPage: model.customerDetailedStatementReportDtoList!
                                .length >=
                            5
                        ? 5
                        : model.customerDetailedStatementReportDtoList!.length,
                    onPageChanged: (index) {
                      // Handle page change
                    },
                    actions: [
                      IconButton(
                        onPressed: () {
                          CustomerBloc bloc =
                              BlocProvider.of<CustomerBloc>(context);
                          // Handle action
                          statementBloc.add(GetStatementEvent(
                              storeIds: '1,2',
                              startDate: fromDateController.text,
                              customerIds:
                                  bloc.state.customerModel?.id.toString(),
                              endDate: toDateController.text,
                              page: 0,
                              size: 10));
                        },
                        icon: const Icon(Icons.refresh),
                      ),
                      IconButton(
                        onPressed: () {
                          // Handle action
                        },
                        icon: const Icon(Icons.search),
                      ),
                    ],
                  ),
                ],
              ),
            );
          }

          return Container();
        },
      ),
    );
  }

  download() async {
    final token = await SharedPrefsApi.instance.getFromShared(key: 'login');
    CustomerBloc bloc = BlocProvider.of<CustomerBloc>(context);

    final url =
        '${Constants.baseUrl}/services/pdf/cusomter/statement?token=$token&startDate=${fromDateController.text}&endDate=${toDateController.text}&customerIds=${bloc.state.customerModel?.id}&storeIdList=1,2&defaultStoreId=2';

    log(url);

    final browser = ChromeSafariBrowser();

    await browser.open(
        url: WebUri(url),
        settings: ChromeSafariBrowserSettings(
            shareState: CustomTabsShareState.SHARE_STATE_OFF,
            barCollapsingEnabled: true));
  }

  itemDashboard(
          String title, String subTitle, IconData iconData, Color background) =>
      Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                  offset: const Offset(0, 5),
                  color: const Color(0xff202b38).withOpacity(.2),
                  spreadRadius: 2,
                  blurRadius: 5)
            ]),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: background,
                  shape: BoxShape.circle,
                ),
                child: Icon(iconData, color: Colors.white)),
            const SizedBox(height: 8),
            Text(
              title,
              style: const TextStyle(
                  fontSize: 13,
                  color: Colors.green,
                  fontWeight: FontWeight.w600),
              textAlign: TextAlign.center,
            ),
            Text(
              subTitle,
              style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w900,
                  color: Colors.black),
              textAlign: TextAlign.center,
            )
          ],
        ),
      );
}

class MyData extends DataTableSource {
  final List<CustomerDetailedStatementReportDtoList> statementModel;
  MyData({required this.statementModel});

  @override
  DataRow? getRow(int index) {
    return DataRow(cells: [
      DataCell(Text(statementModel[index].date.toString())),
      DataCell(Text(statementModel[index].type.toString())),
      DataCell(Text(statementModel[index].excessAmount.toString())),
      DataCell(Text(statementModel[index].creditAmount.toString())),
      DataCell(Text(statementModel[index].debitAmount.toString())),
      DataCell(Text(statementModel[index].balance.toString())),
      DataCell(Text(statementModel[index].id.toString())),
      DataCell(Text(statementModel[index].balance.toString())),
    ]);
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => statementModel.length;

  @override
  int get selectedRowCount => statementModel.length;
}
