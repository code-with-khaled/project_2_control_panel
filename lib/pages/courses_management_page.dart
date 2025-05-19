import 'package:control_panel/widgets/courses_table.dart';
import 'package:control_panel/widgets/new_course.dart';
import 'package:control_panel/widgets/side_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CoursesManagementPage extends StatelessWidget {
  const CoursesManagementPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [Colors.white, Color.fromARGB(255, 195, 234, 204)],
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
          ),
        ),
        child: Row(
          children: [
            // Side Nav Bar
            SideBar(),

            // Rest Part
            Expanded(
              child: Column(
                children: [
                  // Top Nav Bar
                  SizedBox(
                    height: 70,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // Greetings
                        Text(
                          "Hello, Admin",
                          style: GoogleFonts.lilyScriptOne(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                        ),

                        SizedBox(width: 10),

                        // Admin Avatar
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: CircleAvatar(
                            radius: 30,
                            backgroundColor: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),

                  Divider(),

                  // Full Size Layout (Horizontal)
                  screenWidth >= 1410
                      ? Padding(
                        padding: const EdgeInsets.only(left: 40, top: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 20,
                                      ),
                                      child: Text(
                                        "Course Managemant",
                                        style: GoogleFonts.inter(
                                          fontSize: 32,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    CoursesTable(),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(width: 40),

                            // New Course Addition
                            NewCourse(),
                          ],
                        ),
                      )
                      // Smaller Size Layout (Vertical)
                      : Expanded(
                        child: SingleChildScrollView(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 40, top: 10),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 20,
                                      ),
                                      child: Text(
                                        "Course Managemant",
                                        style: GoogleFonts.inter(
                                          fontSize: 32,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),

                                    // Courses Main Table
                                    CoursesTable(),
                                  ],
                                ),

                                SizedBox(height: 10),

                                // New Course Addition
                                NewCourse(),
                              ],
                            ),
                          ),
                        ),
                      ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
