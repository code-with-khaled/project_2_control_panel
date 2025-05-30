import 'package:control_panel/constants/custom_color.dart';
import 'package:control_panel/widgets/custom_widgets/custom_list_tile.dart';
import 'package:flutter/material.dart';

class SideNavbar extends StatelessWidget {
  const SideNavbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Material(
            borderRadius: BorderRadius.circular(12),
            elevation: 4,
            child: Container(
              width: 220,
              decoration: BoxDecoration(
                color: CustomColor.primaryGreen,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 50),
                child: Center(
                  child: Text(
                    "LOGO",
                    style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Container(
            width: 220,
            decoration: BoxDecoration(
              color: CustomColor.primaryGreen,
              borderRadius: BorderRadius.circular(12),
            ),
            child: ListView(
              children: [
                // Statistical Dashboard Section
                CustomListTile(
                  title: "Statistical Dashboard",
                  icon: Icon(Icons.list_alt),
                ),

                // Financial Management Section
                CustomListTile(
                  title: "Financial Management",
                  icon: Icon(Icons.attach_money),
                ),

                // Manage Courses Section
                CustomListTile(
                  title: "Manage Courses",
                  icon: Icon(Icons.library_books),
                ),

                // Classifications Section
                CustomListTile(
                  title: "Classifications",
                  icon: Icon(Icons.category),
                ),

                // Manage Students Section
                CustomListTile(
                  title: "Manage Students",
                  icon: Icon(Icons.school),
                ),

                // Manage Teachers Section
                CustomListTile(
                  title: "Manage Teachers",
                  icon: Icon(Icons.group),
                ),

                // Promotions Section
                CustomListTile(title: "Promotions", icon: Icon(Icons.campaign)),

                // Financial Reciepts Section
                CustomListTile(
                  title: "Financial Reciepts",
                  icon: Icon(Icons.receipt_long),
                ),

                // Curriculums Section
                CustomListTile(
                  title: "Curriculums",
                  icon: Icon(Icons.menu_book),
                ),

                // Certificates Export Section
                CustomListTile(
                  title: "Certificates Export",
                  icon: Icon(Icons.card_membership),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
