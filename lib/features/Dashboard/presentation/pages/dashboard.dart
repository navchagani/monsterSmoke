import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:monstersmoke/core/inject.dart';
import 'package:monstersmoke/features/Dashboard/presentation/pages/recentOrders.dart';
import 'package:monstersmoke/features/Customer/presentation/bloc/GetCustomerBloc/customer_bloc_bloc.dart';
import 'package:monstersmoke/features/PlaceOrder/data/models/CustomerOrderModel.dart';
import 'package:monstersmoke/features/PlaceOrder/presentation/bloc/placeorder_bloc.dart';

import '../bloc/dashboard_bloc.dart';

class CustomerDashboard extends StatefulWidget {
  const CustomerDashboard({super.key});

  @override
  State<CustomerDashboard> createState() => CustomerDashboardState();
}

class CustomerDashboardState extends State<CustomerDashboard> {
  List<dynamic> data = orderData;
  DateTime? fromDate;
  DateTime? toDate;
  TextEditingController fromDateController = TextEditingController();
  TextEditingController toDateController = TextEditingController();

  final dashboardBloc = getIt<DashboardBloc>();
  final customerOrderBloc = getIt<PlaceorderBloc>();

  @override
  void initState() {
    dashboardBloc.add(GetDashboardEvent());
    customerOrderBloc.add(const GetCustomerOrderEvent(page: 0, size: 10));
    fromDateController.text = fromDate != null ? _dateFormat(fromDate!) : '';
    toDateController.text = toDate != null ? _dateFormat(toDate!) : '';
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
                  title: const Text(
                    'Monster Smoke ',
                    style: TextStyle(color: Colors.white),
                  ),
                  subtitle: Text('Good Morning',
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
                const SizedBox(height: 30)
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(50))),
            child: Column(
              children: [
                const SizedBox(height: 10),
                const Text(
                  "Dashboard",
                  style: TextStyle(
                      color: Color.fromARGB(255, 171, 29, 48),
                      fontWeight: FontWeight.w600,
                      fontSize: 18),
                  textAlign: TextAlign.left,
                ),
                const SizedBox(height: 20),
                BlocProvider.value(
                  value: dashboardBloc,
                  child: BlocBuilder<DashboardBloc, DashboardState>(
                    bloc: dashboardBloc,
                    builder: (context, dashboardState) {
                      if (dashboardState is DashboardLoadingState) {
                        return Container();
                      }

                      if (dashboardState is DashboardLoadedState) {
                        return GridView.count(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          crossAxisCount: 2,
                          crossAxisSpacing: 20,
                          mainAxisSpacing: 20,
                          children: [
                            itemDashboard(
                                'Total No of Orders',
                                dashboardState
                                    .dashboardModel.totalNumberOfOrders
                                    .toString(),
                                CupertinoIcons.cube,
                                const Color(0xff202b38),
                                false),
                            itemDashboard(
                                'Tol Amount Spend',
                                dashboardState.dashboardModel.totalAmountSpend
                                    .toString(),
                                Icons.inventory_rounded,
                                const Color(0xff202b38),
                                false),
                            itemDashboard(
                                'Due Amount',
                                dashboardState.dashboardModel.dueAmount
                                    .toString(),
                                Icons.attach_money_rounded,
                                const Color(0xff202b38),
                                false),
                            itemDashboard(
                                'Store Credit',
                                dashboardState.dashboardModel.storeCredit
                                    .toString(),
                                Icons.store,
                                const Color(0xff202b38),
                                false),
                            // itemDashboard(
                            //     'Rma Credit',
                            //     '\$0.00',
                            //     Icons.attach_money_rounded,
                            //     const Color(0xff202b38),
                            //     false),
                            // itemDashboard(
                            //     'Buy Back Credit',
                            //     '\$0.00',
                            //     Icons.attach_money_rounded,
                            //     const Color(0xff202b38),
                            //     false),
                          ],
                        );
                      }
                      return Container();
                    },
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 10),
              Text(
                "Recent Orders",
                style: TextStyle(
                    color: Color.fromARGB(255, 171, 29, 48),
                    fontWeight: FontWeight.w600,
                    fontSize: 18),
              ),
              SizedBox(height: 10),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
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
                    child: Icon(Icons.calendar_today, color: Color(0xff202b38)),
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
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 5),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
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
                    offset: const Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(12),
                    child: Icon(Icons.calendar_today, color: Color(0xff202b38)),
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
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          BlocProvider.value(
            value: customerOrderBloc,
            child: BlocBuilder<PlaceorderBloc, PlaceorderState>(
              bloc: customerOrderBloc,
              builder: (context, placeOrderState) {
                if (placeOrderState is PlaceOrderLoadingState) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (placeOrderState is CustomerOrderCompletedState) {
                  return PaginatedDataTable(
                    columns: const <DataColumn>[
                      DataColumn(
                        label: Text(
                          'Order No',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
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
                          'Ship To',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          'Total Amount',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          'Total Due',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          'Status',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          'Tracking No',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          'Actions',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                    source: MyData(placeOrderState.listCustomerModel),
                    header: const Center(
                      child: Text(
                        "Recent Orders",
                        style: TextStyle(
                            color: Color.fromARGB(255, 171, 29, 48),
                            fontWeight: FontWeight.w600,
                            fontSize: 18),
                      ),
                    ),
                    columnSpacing: 20,
                    horizontalMargin: 20,
                    showFirstLastButtons: true,
                    rowsPerPage: 5,
                    onPageChanged: (index) {
                      // Handle page change
                    },
                    actions: [
                      IconButton(
                        onPressed: () {
                          customerOrderBloc.add(
                              const GetCustomerOrderEvent(page: 0, size: 10));
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
                  );
                }
                return Container();
              },
            ),
          ),
        ],
      ),
    );
  }

  itemDashboard(String title, String subTitle, IconData iconData,
          Color background, bool isLoading) =>
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
  final List<CustomerOrderModel> data;

  MyData(this.data);

  @override
  DataRow? getRow(int index) {
    return DataRow(cells: [
      DataCell(Text(data[index].orderId.toString())),
      DataCell(Text(data[index].insertedTimestamp.toString())),
      const DataCell(Text('')),
      DataCell(Text(data[index].totalAmount.toString())),
      DataCell(Text(data[index].dueBalance.toString())),
      DataCell(Text(data[index].status.toString())),
      DataCell(Text(data[index].trackingNumber.toString())),
      DataCell(Row(
        children: [
          IconButton(onPressed: onDownload, icon: const Icon(Icons.download))
        ],
      )),
    ]);
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => data.length;

  @override
  int get selectedRowCount => 0;

  void onEyePressed() {}

  void onDownload() {}
}
