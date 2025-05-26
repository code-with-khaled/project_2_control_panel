import 'dart:math';

import 'package:flutter/material.dart';
import 'package:control_panel/constants/custom_color.dart';

class PaymentAndWithrawalTable extends StatefulWidget {
  const PaymentAndWithrawalTable({super.key});

  @override
  PaymentAndWithrawalTableState createState() =>
      PaymentAndWithrawalTableState();
}

class PaymentAndWithrawalTableState extends State<PaymentAndWithrawalTable> {
  late CourseDataSource _dataSource;
  final int _rowsPerPage = 5;

  @override
  void initState() {
    super.initState();
    _dataSource = CourseDataSource(context);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 800,
      child: PaginatedDataTable(
        rowsPerPage: _rowsPerPage,
        headingRowColor: WidgetStateProperty.all(
          CustomColor.textFieldBackground,
        ),
        columns: [
          DataColumn(
            label: Text(
              'Receipt',
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
          ),
          DataColumn(
            label: Text('Date', style: TextStyle(fontWeight: FontWeight.w600)),
          ),
          DataColumn(
            label: Text(
              'Amount',
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
          ),
        ],
        source: _dataSource,
      ),
    );
  }
}

/// **Custom DataSource for Pagination**
class CourseDataSource extends DataTableSource {
  final BuildContext context;
  CourseDataSource(this.context);

  final List<Map<String, dynamic>> _courses = List.generate(20, (index) {
    int receiptCode = Random().nextInt(1000) + 1000;
    int date = Random().nextInt(29);
    int amount = Random().nextInt(200);

    return {
      'receipt': 'RW$receiptCode',
      'date': '$date/${Random().nextInt(12)}/2025',
      'amount': amount.toString(),
    };
  });

  @override
  DataRow? getRow(int index) {
    if (index >= _courses.length) return null;
    final course = _courses[index];

    return DataRow(
      color: WidgetStateColor.resolveWith((states) {
        return Colors.white;
      }),
      cells: [
        DataCell(Text(course['receipt'])),
        DataCell(Text(course['date'])),
        DataCell(Text(course['amount'])),
      ],
    );
  }

  @override
  int get rowCount => _courses.length;
  @override
  bool get isRowCountApproximate => false;
  @override
  int get selectedRowCount => 0;
}
