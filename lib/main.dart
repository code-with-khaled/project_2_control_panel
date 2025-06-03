import 'package:control_panel/pages/courses_management_page.dart';
import 'package:control_panel/pages/main_page.dart';
import 'package:control_panel/pages/students_management_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/courses': (context) => CoursesManagementPage(),
        '/students': (context) => StudentsManagementPage(),
      },
      title: 'Control Panel',
      home: const MainPage(),
    );
  }
}
