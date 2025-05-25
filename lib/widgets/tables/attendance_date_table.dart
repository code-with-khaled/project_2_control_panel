import 'package:flutter/material.dart';
import 'package:control_panel/constants/custom_color.dart';

class AttendanceDateTable extends StatefulWidget {
  const AttendanceDateTable({super.key});

  @override
  AttendanceDateTableState createState() => AttendanceDateTableState();
}

class AttendanceDateTableState extends State<AttendanceDateTable> {
  late List<Map<String, dynamic>> _courses;

  @override
  void initState() {
    super.initState();
    _courses = List.generate(
      20,
      (index) => {'date': '5/24/2025', 'time': '09:00 AM'},
    );
  }

  @override
  Widget build(BuildContext context) {
    return DataTable(
      headingRowColor: WidgetStateProperty.all(CustomColor.textFieldBackground),
      columns: [
        DataColumn(
          label: Text('Date', style: TextStyle(fontWeight: FontWeight.w600)),
        ),
        DataColumn(
          label: Text('Time', style: TextStyle(fontWeight: FontWeight.w600)),
        ),
      ],
      rows:
          _courses
              .map(
                (course) => DataRow(
                  cells: [
                    DataCell(Text(course['date'])),
                    DataCell(Text(course['time'])),
                  ],
                ),
              )
              .toList(),
    );
  }
}
