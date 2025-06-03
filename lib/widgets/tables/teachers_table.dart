import 'dart:math';

import 'package:control_panel/constants/custom_color.dart';
import 'package:control_panel/widgets/dialogs/view_teacher_dialog.dart';
import 'package:flutter/material.dart';

class TeachersTable extends StatefulWidget {
  const TeachersTable({super.key});

  @override
  State<TeachersTable> createState() => _TeachersTableState();
}

class _TeachersTableState extends State<TeachersTable> {
  late DataTableSource _dataSource;
  final int _rowsPerPage = 5;

  @override
  void initState() {
    super.initState();

    _dataSource = StudentsDataSource(context);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 820,
      child: PaginatedDataTable(
        rowsPerPage: _rowsPerPage,
        headingRowColor: WidgetStateProperty.all(
          CustomColor.textFieldBackground,
        ),
        dataRowMaxHeight: double.infinity,
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
  final BuildContext context;

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

  StudentsDataSource(this.context) {
    _students = List.generate(
      20,
      (index) => {
        'f_name': 'T. f_name...${index + 1}',
        'l_name': 'T. l_name...${index + 1}',
        'id': '${index + 1}',
        'age': '${18 + (index % 5)}',
        'study': studies[Random().nextInt(studies.length)],
      },
    );
  }

  @override
  DataRow? getRow(int index) {
    final student = _students[index];

    return DataRow(
      cells: [
        DataCell(
          TeacherName(fName: student['f_name'], lName: student['l_name']),
        ),
        DataCell(Text(student['id'])),
        DataCell(Text(student['age'])),
        DataCell(Text(student['study'])),
        DataCell(
          Row(
            children: [
              IconButton(
                icon: Icon(
                  Icons.remove_red_eye,
                  color: CustomColor.primaryGreen,
                ),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => ViewTeacherDialog(),
                  );
                },
              ),
              IconButton(
                icon: Icon(Icons.edit, color: Colors.blue),
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

class TeacherName extends StatelessWidget {
  final String fName, lName;

  const TeacherName({super.key, required this.fName, required this.lName});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: CircleAvatar(radius: 30, child: Icon(Icons.person)),
        ),
        SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(fName),
            Text(
              lName,
              style: TextStyle(fontSize: 13, fontWeight: FontWeight.w200),
            ),
          ],
        ),
      ],
    );
  }
}
