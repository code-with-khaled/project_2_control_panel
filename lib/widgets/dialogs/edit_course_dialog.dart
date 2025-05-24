import 'package:control_panel/constants/custom_color.dart';
import 'package:control_panel/widgets/new_course.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EditCourseDialog extends StatelessWidget {
  const EditCourseDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final fieldWidth = 400.0;
    final fieldColor = CustomColor.textFieldBackground;

    // Static values using TextEditingController (easier to update later)
    final TextEditingController nameController = TextEditingController(
      text: "Flutter Development",
    );
    final TextEditingController priceController = TextEditingController(
      text: "200 USD",
    );
    final TextEditingController descriptionController = TextEditingController(
      text: "Learn Flutter with hands-on projects.",
    );

    // Dropdown selections
    String selectedClassification = "Beginner";
    String selectedInstructor = "John Doe";

    final List<String> classificationOptions = [
      "Beginner",
      "Intermediate",
      "Advanced",
    ];
    final List<String> instructorOptions = [
      "John Doe",
      "Jane Smith",
      "Michael Lee",
    ];

    return SingleChildScrollView(
      child: AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Edit Course",
              style: GoogleFonts.inter(
                fontSize: 28,
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
        content: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                LabelText(text: "Course Name"),

                // Course Name Field
                Container(
                  color: fieldColor,
                  width: fieldWidth,
                  child: TextField(
                    controller: nameController,
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
                          color: fieldColor,
                          width: fieldWidth / 2 - 5,
                          child: DropdownButtonFormField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                            ),
                            value: selectedClassification,
                            items:
                                classificationOptions
                                    .map(
                                      (item) => DropdownMenuItem(
                                        value: item,
                                        child: Text(item),
                                      ),
                                    )
                                    .toList(),
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
                          color: fieldColor,
                          width: fieldWidth / 2 - 5,
                          child: DropdownButtonFormField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                            ),
                            value: selectedInstructor,
                            items:
                                instructorOptions
                                    .map(
                                      (item) => DropdownMenuItem(
                                        value: item,
                                        child: Text(item),
                                      ),
                                    )
                                    .toList(),
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
                  color: fieldColor,
                  width: fieldWidth,
                  child: TextField(
                    controller: priceController,
                    decoration: InputDecoration(border: OutlineInputBorder()),
                  ),
                ),

                SizedBox(height: 10),

                LabelText(text: "Description"),
                Container(
                  color: fieldColor,
                  width: fieldWidth,
                  child: TextField(
                    controller: descriptionController,
                    maxLines: 5,
                    decoration: InputDecoration(border: OutlineInputBorder()),
                  ),
                ),
              ],
            ),
          ],
        ),
        actions: [
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: CustomColor.lime,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
              ),
            ),
            child: Text("Save Changes", style: TextStyle(color: Colors.black)),
          ),
        ],
      ),
    );
  }
}
