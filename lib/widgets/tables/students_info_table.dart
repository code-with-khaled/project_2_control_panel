import 'package:flutter/material.dart';
import 'package:control_panel/constants/custom_color.dart';

class StudentsInfoTable extends StatefulWidget {
  const StudentsInfoTable({super.key});

  @override
  StudentsInfoTableState createState() => StudentsInfoTableState();
}

class StudentsInfoTableState extends State<StudentsInfoTable> {
  late StudentsDataSource _dataSource;
  final int _rowsPerPage = 5;

  @override
  void initState() {
    super.initState();
    _dataSource = StudentsDataSource();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 500,
      height: 360,
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
            label: Text(
              "Status",
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
          ),
        ],
        source: _dataSource,
      ),
    );
  }
}

/// **Custom Data Source for Paginated Table**
class StudentsDataSource extends DataTableSource {
  final List<Map<String, dynamic>> _students = List.generate(
    20,
    (index) => {
      'name': 'Student name...${index + 1}',
      'id': '${index + 1}',
      'status': 'Registration',
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
        DataCell(StatusDropdown(student)), // Use the dropdown component
      ],
    );
  }

  @override
  int get rowCount => _students.length;
  @override
  bool get isRowCountApproximate => false;
  @override
  int get selectedRowCount => 0;
}

/// **Dropdown Widget for Student Status**
class StatusDropdown extends StatefulWidget {
  final Map<String, dynamic> student;
  const StatusDropdown(this.student, {super.key});

  @override
  StatusDropdownState createState() => StatusDropdownState();
}

class StatusDropdownState extends State<StatusDropdown> {
  late String selectedValue;

  @override
  void initState() {
    super.initState();
    selectedValue = widget.student['status'];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey, width: 1),
        borderRadius: BorderRadius.circular(6),
      ),
      child: SizedBox(
        width: 150,
        height: 30,
        child: DropdownButton(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          value: selectedValue,
          items: [
            DropdownMenuItem(
              value: "Registration",
              child: Text("Registration"),
            ),
            DropdownMenuItem(
              value: "Confirmation",
              child: Text("Confirmation"),
            ),
            DropdownMenuItem(value: "Withdrawal", child: Text("Withdrawal")),
          ],
          onChanged: (value) {
            setState(() {
              selectedValue = value!;
              widget.student['status'] = value;
            });
          },
        ),
      ),
    );
  }
}
