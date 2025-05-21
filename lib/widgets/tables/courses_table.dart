import 'package:control_panel/constants/custom_color.dart';
import 'package:control_panel/widgets/dialogs/course_info_dialog.dart';
import 'package:flutter/material.dart';

class CoursesTable extends StatelessWidget {
  const CoursesTable({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: CustomColor.tableBorder),
          borderRadius: BorderRadius.circular(8),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(7),
          child: DataTable(
            border: TableBorder.all(color: CustomColor.tableBorder),
            columnSpacing: screenWidth / 40,
            headingRowColor: WidgetStateProperty.all(
              CustomColor.textFieldBackground,
            ),

            // Table Columns
            columns: [
              DataColumn(
                label: Text(
                  'Course Name',
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
              ),
              DataColumn(
                label: Text(
                  'Classification',
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
              ),
              DataColumn(
                label: Text(
                  'ID',
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
              ),
              DataColumn(
                label: Text(
                  'Instructor',
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
              ),
              DataColumn(
                label: Text(
                  'Actions',
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
              ), // Action buttons
            ],

            // Table Rows
            rows: List.generate(6, (index) {
              return DataRow(
                cells: [
                  DataCell(Text('Course Name...${index + 1}')),
                  DataCell(Text('Class_${index + 1}')),
                  DataCell(Text('${index + 1}')),
                  DataCell(Text('Teacher Name...${index + 1}')),
                  DataCell(
                    Row(
                      children: [
                        IconButton(
                          icon: Icon(Icons.visibility),
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (context) => CourseInfoDialog(),
                            );
                          },
                        ),
                        IconButton(icon: Icon(Icons.edit), onPressed: () {}),
                        IconButton(icon: Icon(Icons.delete), onPressed: () {}),
                        IconButton(icon: Icon(Icons.upload), onPressed: () {}),
                        IconButton(
                          icon: Icon(Icons.group_add),
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ),
                ],
              );
            }),
          ),
        ),
      ),
    );
  }
}
