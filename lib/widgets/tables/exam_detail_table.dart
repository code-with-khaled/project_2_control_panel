import 'dart:math';

import 'package:flutter/material.dart';
import 'package:control_panel/constants/custom_color.dart';

class ExamDetailTable extends StatefulWidget {
  const ExamDetailTable({super.key});

  @override
  ExamDetailTableState createState() => ExamDetailTableState();
}

class ExamDetailTableState extends State<ExamDetailTable> {
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
              'St.Name',
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
          ),
          DataColumn(
            label: Text(
              'MidTerm',
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
          ),
          DataColumn(
            label: Text('Final', style: TextStyle(fontWeight: FontWeight.w600)),
          ),
          DataColumn(
            label: Text("Total", style: TextStyle(fontWeight: FontWeight.w600)),
          ),
          DataColumn(label: Icon(Icons.arrow_upward)),
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
    int midterm = Random().nextInt(100);
    int finalExam = Random().nextInt(100);
    int total = midterm + finalExam;
    int ranking = index + 1;

    return {
      'name': 'Name...${index + 1}',
      'midterm': midterm.toString(),
      'final': finalExam.toString(),
      'total': total.toString(),
      'ranking': ranking.toString(),
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
        DataCell(Text(course['name'])),
        DataCell(Text(course['midterm'])),
        DataCell(Text(course['final'])),
        DataCell(Text(course['total'])),
        DataCell(
          Padding(
            padding: const EdgeInsets.only(left: 8),
            child: Text(course['ranking']),
          ),
        ),
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
