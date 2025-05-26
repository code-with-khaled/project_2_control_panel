import 'package:control_panel/widgets/tables/payment_and_withrawal_table.dart';
import 'package:control_panel/widgets/custom_widgets/evaluation_bar.dart';
import 'package:control_panel/widgets/custom_widgets/rating_stars.dart';
import 'package:control_panel/widgets/tables/exam_detail_table.dart';
import 'package:control_panel/widgets/tables/attendance_date_table.dart';
import 'package:control_panel/widgets/tables/attendance_table.dart';
import 'package:control_panel/widgets/new_course.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CourseInfoPage extends StatefulWidget {
  const CourseInfoPage({super.key});

  @override
  State<CourseInfoPage> createState() => _CourseInfoPageState();
}

class _CourseInfoPageState extends State<CourseInfoPage> {
  late ScrollController _scrollController1;
  late ScrollController _scrollController2;

  @override
  void initState() {
    super.initState();
    _scrollController1 = ScrollController();
    _scrollController2 = ScrollController();
    _scrollController1.addListener(() {
      _scrollController2.jumpTo(_scrollController1.offset);
    });
    _scrollController2.addListener(() {
      _scrollController1.jumpTo(_scrollController2.offset);
    });
  }

  @override
  void dispose() {
    _scrollController1.dispose();
    _scrollController2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> students = [
      {"id": 1, "name": "Alice", "status": "Present"},
      {"id": 2, "name": "Bob", "status": "Absent"},
      {"id": 3, "name": "Charlie", "status": "Late"},
      {"id": 4, "name": "David", "status": "Present"},
    ];

    List<Map<String, dynamic>> courseDays = [
      {"date": "2025-05-01", "time": "10:00 AM"},
      {"date": "2025-05-02", "time": "2:00 PM"},
      {"date": "2025-05-03", "time": "1:00 PM"},
    ];

    return Expanded(
      child: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              child: ConstrainedBox(
                constraints: BoxConstraints(maxWidth: 832),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Course Name",
                      style: GoogleFonts.inter(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    SizedBox(height: 20),

                    // Attendance table
                    LabelText(text: "Attendance and Absence"),
                    SizedBox(height: 6),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey.shade300),
                          ),
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                // Date and Time
                                SizedBox(
                                  width: 250,
                                  height: 248,
                                  child: ScrollConfiguration(
                                    behavior: ScrollBehavior().copyWith(
                                      scrollbars: false,
                                    ),
                                    child: SingleChildScrollView(
                                      controller: _scrollController1,
                                      child: AttendanceDateTable(),
                                    ),
                                  ),
                                ),
                                // Attendance
                                SizedBox(
                                  width: 540,
                                  height: 248,
                                  child: SingleChildScrollView(
                                    controller: _scrollController2,
                                    child: AttendanceTable(page: 1),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(Icons.chevron_left),
                              Text("1-3"),
                              Icon(Icons.chevron_right),
                            ],
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 12),

                    // Exam Details Table
                    LabelText(text: "Exam Details"),
                    SizedBox(height: 6),
                    ExamDetailTable(),

                    SizedBox(height: 20),

                    // Payment and Withrawal Table
                    LabelText(text: "Payment and Withdrawal Reciepts"),
                    SizedBox(height: 6),
                    PaymentAndWithrawalTable(),

                    SizedBox(height: 20),

                    // Survey Results
                    LabelText(text: "Survey Results"),
                    SizedBox(height: 12),
                    RatingStars(),
                    SizedBox(height: 10),
                    EvaluationBar(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
