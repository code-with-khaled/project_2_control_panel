import 'package:control_panel/constants/custom_color.dart';
import 'package:flutter/material.dart';

class StudentsInfoTable extends StatefulWidget {
  const StudentsInfoTable({super.key});

  @override
  State<StudentsInfoTable> createState() => _StudentsInfoTableState();
}

class _StudentsInfoTableState extends State<StudentsInfoTable> {
  @override
  Widget build(BuildContext context) {
    String? selectedValue = "Registration";

    return ClipRRect(
      borderRadius: BorderRadius.circular(7),
      child: DataTable(
        headingRowColor: WidgetStateProperty.all(
          CustomColor.textFieldBackground,
        ),
        columns: [
          DataColumn(
            label: Text("Name", style: TextStyle(fontWeight: FontWeight.w600)),
          ),
          DataColumn(
            label: Text("ID", style: TextStyle(fontWeight: FontWeight.w600)),
          ),
          DataColumn(
            label: Text(
              "Status",
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
          ),
        ],
        rows: List.generate(
          6,
          (index) => DataRow(
            cells: [
              DataCell(Text("Student name...${index + 1}")),
              DataCell(Text("${index + 1}")),
              DataCell(
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 1),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: SizedBox(
                    width: 150,
                    height: 30,
                    child: DropdownButton(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      value: selectedValue,
                      items: [
                        DropdownMenuItem(
                          value: "Registration",
                          child: Text("Registration"),
                        ),
                        DropdownMenuItem(
                          value: "Confirmation",
                          child: Text("Confirmation"),
                        ),
                        DropdownMenuItem(
                          value: "Withdrawal",
                          child: Text("Withdrawal"),
                        ),
                      ],
                      onChanged: (value) {
                        setState(() {
                          selectedValue = value;
                        });
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
