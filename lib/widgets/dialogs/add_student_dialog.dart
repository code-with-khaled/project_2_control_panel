import 'package:control_panel/constants/custom_color.dart';
import 'package:control_panel/widgets/tables/add_student_table.dart';
import 'package:flutter/material.dart';

class AddStudentDialog extends StatefulWidget {
  const AddStudentDialog({super.key});

  @override
  State<AddStudentDialog> createState() => _AddStudentDialogState();
}

class _AddStudentDialogState extends State<AddStudentDialog> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Add a Student",
              style: TextStyle(fontWeight: FontWeight.bold),
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
          children: [
            // Search Bar
            Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: SizedBox(
                width: 300,
                child: Container(
                  color: Colors.white,
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Search by name or ID",
                      prefixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ),
            ),

            // Student Table
            AddStudentTable(),

            // Add Button
            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: CustomColor.lime,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  onPressed:
                      () => Navigator.pop(
                        context,
                      ), // Close dialog on button press
                  child: Text("Add", style: TextStyle(color: Colors.black)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
