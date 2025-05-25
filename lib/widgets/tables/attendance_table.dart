import 'dart:math';
import 'package:control_panel/constants/custom_color.dart';
import 'package:control_panel/widgets/attendance_tracker.dart';
import 'package:flutter/material.dart';

class AttendanceTable extends StatefulWidget {
  const AttendanceTable({super.key, required this.page});

  final int page;

  @override
  State<AttendanceTable> createState() => _AttendanceTableState();
}

class _AttendanceTableState extends State<AttendanceTable> {
  final List<String> stNames = [
    "St.Name...1",
    "St.Name...2",
    "St.Name...3",
    "St.Name...4",
    "St.Name...5",
    "St.Name...6",
    "St.Name...7",
    "St.Name...8",
    "St.Name...9",
    "St.Name...10",
    "St.Name...11",
    "St.Name...12",
  ];
  late List<String> names;

  List<String> getStudentsNames<String>(List<String> list, int pageNumber) {
    int startIndex = (pageNumber - 1) * 3;
    int endIndex = startIndex + 3;

    return list.sublist(startIndex, endIndex);
  }

  @override
  void initState() {
    super.initState();
    names = getStudentsNames(stNames, widget.page);
  }

  @override
  Widget build(BuildContext context) {
    List<String> states = ["Present", "Absent", "Withdrawal", "Not Registered"];

    return DataTable(
      headingRowColor: WidgetStateProperty.all(CustomColor.textFieldBackground),
      columns: [
        DataColumn(
          label: Text(names[0], style: TextStyle(fontWeight: FontWeight.w600)),
        ),
        DataColumn(
          label: Text(names[1], style: TextStyle(fontWeight: FontWeight.w600)),
        ),
        DataColumn(
          label: Text(names[2], style: TextStyle(fontWeight: FontWeight.w600)),
        ),
      ],
      rows: List.generate(
        20,
        (index) => DataRow(
          cells: [
            DataCell(
              AttendanceTracker(state: states[Random().nextInt(states.length)]),
            ),
            DataCell(
              AttendanceTracker(state: states[Random().nextInt(states.length)]),
            ),
            DataCell(
              AttendanceTracker(state: states[Random().nextInt(states.length)]),
            ),
          ],
        ),
      ),
    );
  }
}
