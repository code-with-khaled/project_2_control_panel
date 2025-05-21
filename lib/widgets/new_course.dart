import 'package:control_panel/constants/custom_color.dart';
import 'package:control_panel/widgets/tables/test_table.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NewCourse extends StatelessWidget {
  const NewCourse({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    final screenWidth = MediaQuery.of(context).size.width;
    final fieldWidth = 360.0;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Text(
              "New Course",
              style: GoogleFonts.inter(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          LabelText(text: "Course Name"),

          // Course Name Field
          Container(
            color: CustomColor.textFieldBackground,
            width: fieldWidth,
            child: TextField(
              decoration: InputDecoration(border: OutlineInputBorder()),
            ),
          ),

          SizedBox(height: 10),

          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  LabelText(text: "Classification"),
                  Container(
                    color: CustomColor.textFieldBackground,
                    width: fieldWidth / 2 - 5,
                    child: DropdownButtonFormField(
                      decoration: InputDecoration(border: OutlineInputBorder()),
                      items: [],
                      onChanged: (value) {},
                    ),
                  ),
                ],
              ),
              SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  LabelText(text: "Instructor"),
                  Container(
                    color: const Color.fromARGB(255, 225, 225, 225),
                    width: fieldWidth / 2 - 5,
                    child: DropdownButtonFormField(
                      decoration: InputDecoration(border: OutlineInputBorder()),
                      items: [],
                      onChanged: (value) {},
                    ),
                  ),
                ],
              ),
            ],
          ),

          SizedBox(height: 10),

          LabelText(text: "Registeration Price"),
          Container(
            color: CustomColor.textFieldBackground,
            width: fieldWidth,
            child: TextField(
              decoration: InputDecoration(border: OutlineInputBorder()),
            ),
          ),

          SizedBox(height: 10),

          LabelText(text: "Description"),
          Container(
            color: CustomColor.textFieldBackground,
            width: fieldWidth,
            child: TextField(
              maxLines: 5,
              decoration: InputDecoration(border: OutlineInputBorder()),
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(width: fieldWidth - 120),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: ElevatedButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(content: TestTable()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: CustomColor.lime,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  child: Text(
                    "Add Course",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class LabelText extends StatelessWidget {
  const LabelText({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: Text(text, style: TextStyle(fontWeight: FontWeight.w600)),
    );
  }
}
