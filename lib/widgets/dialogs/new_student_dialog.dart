import 'package:control_panel/constants/custom_color.dart';
import 'package:control_panel/widgets/custom_widgets/custom_button.dart';
import 'package:control_panel/widgets/new_course.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NewStudentDialog extends StatelessWidget {
  const NewStudentDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "New Student",
              style: GoogleFonts.inter(
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(Icons.close),
            ),
          ],
        ),
        content: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                LabelText(text: "First Name"),
                CustomTextField(),
                SizedBox(height: 12),
                LabelText(text: "Last Name"),
                CustomTextField(),
                SizedBox(height: 12),
                LabelText(text: "User Name"),
                CustomTextField(),
                SizedBox(height: 12),
                LabelText(text: "Date of Birth"),
                CustomTextField(),
                SizedBox(height: 12),
                LabelText(text: "Password"),
                CustomTextField(),
                SizedBox(height: 12),
                LabelText(text: "Confirm Password"),
                CustomTextField(),
              ],
            ),
            SizedBox(width: 20),
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                LabelText(text: "Last Name"),
                CustomTextField(),
                SizedBox(height: 12),
                LabelText(text: "Gender"),
                CustomTextField(),
                SizedBox(height: 12),
                LabelText(text: "Personal image"),
                Container(
                  width: 132,
                  height: 132,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.black54, width: 2.0),
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: CircleAvatar(
                          radius: 30,
                          child: Icon(Icons.person),
                        ),
                      ),
                      Text(
                        "Choose file...",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text("No file chosen"),
                    ],
                  ),
                ),
                SizedBox(height: 12),
                LabelText(text: "Education"),
                CustomTextField(),
                SizedBox(height: 12),
                LabelText(text: "Major"),
                CustomTextField(),
              ],
            ),
          ],
        ),
        actions: [
          Center(
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: CustomColor.lime,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text("Submit", style: TextStyle(color: Colors.black)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
