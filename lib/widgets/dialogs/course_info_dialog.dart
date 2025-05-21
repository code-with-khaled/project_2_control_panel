import 'package:control_panel/constants/custom_color.dart';
import 'package:control_panel/widgets/tables/students_info_table.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CourseInfoDialog extends StatefulWidget {
  const CourseInfoDialog({super.key});

  @override
  State<CourseInfoDialog> createState() => _CourseInfoDialogState();
}

class _CourseInfoDialogState extends State<CourseInfoDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Course Name",
            style: GoogleFonts.inter(fontSize: 32, fontWeight: FontWeight.bold),
          ),
          InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.close),
          ),
        ],
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Course Description
          Text("Here goes the description of the course."),

          SizedBox(height: 20),

          // Title and Notify Button
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Course Students",
                style: GoogleFonts.inter(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),

              SizedBox(width: 20),

              // Notifing Students
              Row(
                children: [
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      "Send notification",
                      style: TextStyle(color: CustomColor.primaryGreen),
                    ),
                  ),
                  Icon(Icons.notification_add),
                ],
              ),
            ],
          ),

          SizedBox(height: 10),

          // Students Info Table
          StudentsInfoTable(),
        ],
      ),

      // Done
      actions: [
        ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: CustomColor.lime,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
            ),
          ),
          child: Text("Done", style: TextStyle(color: Colors.black)),
        ),
      ],
    );
  }
}
