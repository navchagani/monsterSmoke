import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:monstersmoke/dashboard/recentOrders.dart';

class CustomerDashboard extends StatefulWidget {
  const CustomerDashboard({super.key});

  @override
  State<CustomerDashboard> createState() => CustomerDashboardState();
}

class CustomerDashboardState extends State<CustomerDashboard> {
  List<dynamic> data = orderData;
  final DataTableSource recentOrder = mydata();
  DateTime? fromDate;
  DateTime? toDate;
  TextEditingController fromDateController = TextEditingController();
  TextEditingController toDateController = TextEditingController();

  @override
  void initState() {
    super.initState();
    fromDateController.text = fromDate != null ? _dateFormat(fromDate!) : '';
    toDateController.text = toDate != null ? _dateFormat(toDate!) : '';
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
                const SizedBox(height: 50),
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
                const SizedBox(height: 50)
              ],
            ),
          ),
          Container(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              decoration: const BoxDecoration(
                  borderRadius:
                      BorderRadius.only(topLeft: Radius.circular(50))),
              child: Column(
                children: [
                  const Text(
                    "Dashboard",
                    style: TextStyle(
                        color: Color.fromARGB(255, 171, 29, 48),
                        fontWeight: FontWeight.w600,
                        fontSize: 18),
                    textAlign: TextAlign.left,
                  ),
                  GridView.count(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisCount: 2,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20,
                    children: [
                      itemDashboard('Tol No of Orders', '07',
                          CupertinoIcons.cube, const Color(0xff202b38)),
                      itemDashboard('Tol Amount Spend', '\$783.47',
                          Icons.inventory_rounded, const Color(0xff202b38)),
                      itemDashboard('Due Amount', '\$783.47',
                          Icons.attach_money_rounded, const Color(0xff202b38)),
                      itemDashboard('Store Credit', '\$0.00', Icons.store,
                          const Color(0xff202b38)),
                      itemDashboard('Rma Credit', '\$0.00',
                          Icons.attach_money_rounded, const Color(0xff202b38)),
                      itemDashboard('Buy Back Credit', '\$0.00',
                          Icons.attach_money_rounded, const Color(0xff202b38)),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Recent Orders",
                style: TextStyle(
                    color: Color.fromARGB(255, 171, 29, 48),
                    fontWeight: FontWeight.w600,
                    fontSize: 18),
              ),
            ],
          ),
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
          PaginatedDataTable(
            columns: const <DataColumn>[
              DataColumn(
                label: Text(
                  '#',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              DataColumn(
                label: Text(
                  'Product Name',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              DataColumn(
                label: Text(
                  'Unit Price',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              DataColumn(
                label: Text(
                  'Sell Quantity',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              DataColumn(
                label: Text(
                  'Returned',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              DataColumn(
                label: Text(
                  'Return Quantity',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              DataColumn(
                label: Text(
                  'Return Subtotal',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
            source: recentOrder,
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
                  // Handle action
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

class mydata extends DataTableSource {
  List<dynamic> data = orderData;
  @override
  DataRow? getRow(int index) {
    return DataRow(cells: [
      DataCell(Text(data[index]['id'])),
      DataCell(Text(data[index]['Product Name'])),
      DataCell(Text(data[index]['Unit Price'])),
      DataCell(Text(data[index]['Sell Qunatity'])),
      DataCell(Text(data[index]['Returned'])),
      DataCell(Text(data[index]['Return Quantity'])),
      DataCell(Text(data[index]['Return Subtotal'])),
    ]);
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => data.length;

  @override
  int get selectedRowCount => 0;
}
