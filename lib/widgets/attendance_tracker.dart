import 'package:flutter/material.dart';

class AttendanceTracker extends StatelessWidget {
  const AttendanceTracker({super.key, required this.state});

  final String state;

  Color circleColor(String state) {
    if (state == "Present") {
      return Colors.green;
    } else if (state == "Absent") {
      return Colors.red;
    } else {
      return Colors.blue;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        state != "Not Registered"
            ? Icon(Icons.circle, size: 14, color: circleColor(state))
            : Icon(Icons.circle_outlined, size: 14),
        SizedBox(width: 6),
        Text(state),
      ],
    );
  }
}
