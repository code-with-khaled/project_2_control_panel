import 'package:control_panel/constants/custom_color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ViewTeacherDialog extends StatelessWidget {
  const ViewTeacherDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Teacher Profile",
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
        children: [
          CircleAvatar(radius: 70, child: Icon(Icons.person)),
          Text("Teacher's full name"),
          Text("Teacher's Username"),
          Text("mobile phone: 0994387970"),
          Text("Profesion"),
          Text(
            "Decription... this is an example of a description for a teacher.",
          ),
        ],
      ),
      actions: [
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.all(15),
            backgroundColor: CustomColor.lime,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.edit),
              SizedBox(width: 10),
              Text("edit profile", style: TextStyle(color: Colors.black)),
            ],
          ),
        ),
      ],
    );
  }
}
