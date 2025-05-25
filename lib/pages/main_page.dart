// ignore_for_file: unused_import

import 'package:control_panel/pages/course_info_page.dart';
import 'package:control_panel/pages/courses_management_page.dart';
import 'package:control_panel/pages/students_management_page.dart';
import 'package:control_panel/widgets/navbars/navbar_desktop.dart';
import 'package:control_panel/widgets/navbars/side_navbar.dart';
import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
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
            SideNavbar(),

            // Rest Part
            Expanded(
              child: Column(
                children: [
                  // Top Nav Bar
                  NavbarDesktop(),

                  Divider(),

                  // CoursesManagementPage(),
                  // StudentsManagementPage(),
                  CourseInfoPage(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
