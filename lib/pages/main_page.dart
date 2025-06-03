// ignore_for_file: unused_import

import 'package:control_panel/pages/course_info_page.dart';
import 'package:control_panel/pages/courses_management_page.dart';
import 'package:control_panel/pages/students_management_page.dart';
import 'package:control_panel/pages/teachers_management_page.dart';
import 'package:control_panel/widgets/navbars/navbar_desktop.dart';
import 'package:control_panel/widgets/navbars/side_navbar.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int selectedIndex = 0;

  final List<Widget> pages = [
    CoursesManagementPage(),
    StudentsManagementPage(),
    TeachersManagementPage(),
  ];

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

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
            SideNavbar(onItemTapped: onItemTapped),

            // Rest Part
            Expanded(
              child: Column(
                children: [
                  // Top Nav Bar
                  NavbarDesktop(),

                  pages[selectedIndex],

                  // CoursesManagementPage(),
                  // StudentsManagementPage(),
                  // CourseInfoPage(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
