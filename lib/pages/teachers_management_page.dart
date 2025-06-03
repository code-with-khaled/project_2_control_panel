import 'package:control_panel/constants/custom_color.dart';
import 'package:control_panel/widgets/dialogs/new_teacher_dialog.dart';
import 'package:control_panel/widgets/tables/teachers_table.dart';
import 'package:flutter/material.dart';

class TeachersManagementPage extends StatelessWidget {
  const TeachersManagementPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 860),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Top title & Add student button
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Teachers",
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return NewTeacherDialog();
                              },
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.all(15),
                            backgroundColor: CustomColor.lime,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6),
                            ),
                          ),
                          child: Row(
                            children: [
                              Icon(Icons.add),
                              SizedBox(width: 5),
                              Text(
                                "Add Teacher",
                                style: TextStyle(color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 10),

                    // Search and Filters
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: SizedBox(
                            height: 42,
                            child: TextField(
                              decoration: InputDecoration(
                                prefixIcon: Icon(Icons.search),
                                hintText: "Search students",
                                filled: true,
                                fillColor: Colors.grey[200],
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: BorderSide.none,
                                ),
                              ),
                            ),
                          ),
                        ),

                        // SizedBox(width: 10),

                        // Sort A-Z
                        // ElevatedButton(
                        //   onPressed: () {},
                        //   style: ElevatedButton.styleFrom(
                        //     padding: EdgeInsets.symmetric(
                        //       vertical: 17,
                        //       horizontal: 20,
                        //     ),
                        //     backgroundColor: Colors.grey[200],
                        //     shape: RoundedRectangleBorder(
                        //       borderRadius: BorderRadius.circular(4),
                        //     ),
                        //   ),
                        //   child: Text(
                        //     "Sort A-Z",
                        //     style: TextStyle(color: Colors.black),
                        //   ),
                        // ),

                        // SizedBox(width: 10),

                        // // Sort Recent
                        // ElevatedButton(
                        //   onPressed: () {},

                        //   style: ElevatedButton.styleFrom(
                        //     padding: EdgeInsets.symmetric(
                        //       vertical: 17,
                        //       horizontal: 20,
                        //     ),
                        //     backgroundColor: Colors.grey[200],
                        //     shape: RoundedRectangleBorder(
                        //       borderRadius: BorderRadius.circular(4),
                        //     ),
                        //   ),
                        //   child: Text(
                        //     "Sort Recent",
                        //     style: TextStyle(color: Colors.black),
                        //   ),
                        // ),
                        // SizedBox(width: 10),
                        // DropdownButton<String>(
                        //   items:
                        //       ["All", "Active", "Pending", "Inactive"]
                        //           .map(
                        //             (status) => DropdownMenuItem(
                        //               value: status,
                        //               child: Text(status),
                        //             ),
                        //           )
                        //           .toList(),
                        //   onChanged: (value) {},
                        // ),
                      ],
                    ),

                    SizedBox(height: 10),

                    TeachersTable(),
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
