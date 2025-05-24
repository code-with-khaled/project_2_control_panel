import 'package:control_panel/widgets/dialogs/add_student_dialog.dart';
import 'package:control_panel/widgets/dialogs/course_info_dialog.dart';
import 'package:control_panel/widgets/dialogs/edit_course_dialog.dart';
import 'package:flutter/material.dart';
import 'package:control_panel/constants/custom_color.dart';

class TestTable extends StatefulWidget {
  const TestTable({super.key});

  @override
  TestTableState createState() => TestTableState();
}

class TestTableState extends State<TestTable> {
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
      width: 740,
      child: PaginatedDataTable(
        rowsPerPage: _rowsPerPage,
        headingRowColor: WidgetStateProperty.all(
          CustomColor.textFieldBackground,
        ),
        columns: [
          DataColumn(
            label: Text(
              'Course Name',
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
          ),
          DataColumn(
            label: Text(
              'Classification',
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
          ),
          DataColumn(
            label: Text('ID', style: TextStyle(fontWeight: FontWeight.w600)),
          ),
          DataColumn(
            label: Text(
              'Instructor',
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
          ),
          DataColumn(
            label: Text(
              'Actions',
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

  final List<Map<String, dynamic>> _courses = List.generate(
    20,
    (index) => {
      'name': 'Course ${index + 1}',
      'classification': 'Class_${index + 1}',
      'id': '${index + 1}',
      'instructor': 'Instructor ${index + 1}',
    },
  );

  @override
  DataRow? getRow(int index) {
    if (index >= _courses.length) return null;
    final course = _courses[index];

    return DataRow(
      cells: [
        DataCell(Text(course['name'])),
        DataCell(Text(course['classification'])),
        DataCell(Text(course['id'])),
        DataCell(Text(course['instructor'])),
        DataCell(
          Row(
            children: [
              IconButton(
                icon: Icon(Icons.visibility),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => CourseInfoDialog(),
                  );
                },
              ),
              IconButton(
                icon: Icon(Icons.edit, color: Colors.black),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => EditCourseDialog(),
                  );
                },
              ),
              IconButton(
                icon: Icon(Icons.delete, color: Colors.red),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(Icons.upload, color: Colors.green),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(Icons.group_add, color: Colors.blue),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => AddStudentDialog(),
                  );
                },
              ),
            ],
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
