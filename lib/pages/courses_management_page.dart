import 'package:control_panel/constants/custom_color.dart';
import 'package:control_panel/widgets/new_course.dart';
import 'package:control_panel/widgets/tables/test_table.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CoursesManagementPage extends StatelessWidget {
  const CoursesManagementPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    if (screenWidth >= 1400) {
      return Expanded(
        child: SingleChildScrollView(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 40),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Text(
                        "Course Managemant",
                        style: GoogleFonts.inter(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    TestTable(),
                  ],
                ),
              ),
              SizedBox(width: 20),

              // New Course Addition
              Container(
                color: Colors.white,
                child: NewCourse(
                  fieldWidth: 280.0,
                  fieldColor: CustomColor.textFieldBackground,
                ),
              ),
            ],
          ),
        ),
      );
    } else {
      return Expanded(
        child: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child: Text(
                          "Course Management",
                          style: GoogleFonts.inter(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),

                      // Courses Main Table
                      TestTable(),
                    ],
                  ),

                  SizedBox(height: 20),

                  // New Course Addition
                  NewCourse(fieldWidth: 380.0, fieldColor: Colors.white),
                ],
              ),
            ),
          ),
        ),
      );
    }
  }
}
