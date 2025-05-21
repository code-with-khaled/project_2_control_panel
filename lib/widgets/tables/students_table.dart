import 'dart:math';

import 'package:control_panel/constants/custom_color.dart';
import 'package:flutter/material.dart';

class StudentsTable extends StatefulWidget {
  const StudentsTable({super.key});

  @override
  State<StudentsTable> createState() => _StudentsTableState();
}

class _StudentsTableState extends State<StudentsTable> {
  late DataTableSource _dataSource;
  final int _rowsPerPage = 5;

  @override
  void initState() {
    super.initState();

    _dataSource = StudentsDataSource();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 800,
      // height: 400,
      child: PaginatedDataTable(
        rowsPerPage: _rowsPerPage,
        headingRowColor: WidgetStateProperty.all(
          CustomColor.textFieldBackground,
        ),
        columns: [
          DataColumn(
            label: Text("Name", style: TextStyle(fontWeight: FontWeight.w600)),
          ),
          DataColumn(
            label: Text("ID", style: TextStyle(fontWeight: FontWeight.w600)),
          ),
          DataColumn(
            label: Text("Age", style: TextStyle(fontWeight: FontWeight.w600)),
          ),
          DataColumn(
            label: Text(
              "Gender",
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
          ),
          DataColumn(
            label: Text("Study", style: TextStyle(fontWeight: FontWeight.w600)),
          ),
          DataColumn(
            label: Text(
              "Actions",
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
          ),
        ],
        source: _dataSource,
      ),
    );
  }
}

class StudentsDataSource extends DataTableSource {
  final List<String> studies = [
    "Computer Science",
    "Biomedical Engineering",
    "Environmental Science",
    "Psychology",
    "Philosophy",
    "Political Science",
    "Media Studies",
    "Electrical Engineering",
    "Medicine",
    "Economics",
  ];

  late List<Map<String, dynamic>> _students;

  StudentsDataSource() {
    _students = List.generate(
      20,
      (index) => {
        'name': 'Student name...${index + 1}',
        'id': '${index + 1}',
        'age': '${18 + (index % 5)}',
        'gender': index % 2 == 0 ? 'male' : 'female',
        'study': studies[Random().nextInt(studies.length)],
      },
    );
  }

  @override
  DataRow? getRow(int index) {
    final student = _students[index];

    return DataRow(
      cells: [
        DataCell(Text(student['name'])),
        DataCell(Text(student['id'])),
        DataCell(Text(student['age'])),
        DataCell(Text(student['gender'])),
        DataCell(Text(student['study'])),
        DataCell(
          Row(
            children: [
              IconButton(
                icon: Icon(Icons.note_add, color: CustomColor.primaryGreen),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(Icons.notification_add, color: Colors.red),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(Icons.delete, color: Colors.black),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => _students.length;

  @override
  int get selectedRowCount => 0;
}
