import 'package:control_panel/constants/custom_color.dart';
import 'package:flutter/material.dart';

class AddStudentTable extends StatefulWidget {
  const AddStudentTable({super.key});

  @override
  State<AddStudentTable> createState() => _AddStudentTableState();
}

class _AddStudentTableState extends State<AddStudentTable> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      height: 360,
      child: PaginatedDataTable(
        rowsPerPage: 5,
        columnSpacing: 20,
        headingRowColor: WidgetStateProperty.all(
          CustomColor.textFieldBackground,
        ),
        columns: [
          DataColumn(
            label: Text('Name', style: TextStyle(fontWeight: FontWeight.w600)),
          ),
          DataColumn(
            label: Text('ID', style: TextStyle(fontWeight: FontWeight.w600)),
          ),
          DataColumn(
            label: Text(
              'Select',
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
          ),
        ],
        source: StudentDataSource(),
      ),
    );
  }
}

class StudentDataSource extends DataTableSource {
  final List<Map<String, dynamic>> _students = List.generate(
    20,
    (index) => {
      'name': 'Student name...${index + 1}',
      'id': '${index + 1}',
      'selected': false,
    },
  );

  @override
  DataRow? getRow(int index) {
    if (index >= _students.length) return null;
    final student = _students[index];

    return DataRow(
      cells: [
        DataCell(Text(student['name'])),
        DataCell(Text(student['id'])),
        DataCell(
          Checkbox(
            value: student['selected'],
            onChanged: (value) {
              student['selected'] = value ?? false;
            },
          ),
        ),
      ],
    );
  }

  @override
  int get rowCount => _students.length;
  @override
  bool get isRowCountApproximate => false;
  @override
  int get selectedRowCount =>
      _students.where((s) => s['selected'] == true).length;
}
