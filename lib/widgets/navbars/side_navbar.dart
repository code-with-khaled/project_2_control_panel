import 'package:control_panel/constants/custom_color.dart';
import 'package:control_panel/widgets/custom_widgets/custom_list_tile.dart';
import 'package:flutter/material.dart';

class SideNavbar extends StatelessWidget {
  final Function(int) onItemTapped;

  const SideNavbar({super.key, required this.onItemTapped});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 220,
      decoration: BoxDecoration(
        color: CustomColor.primaryGreen,
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              color: CustomColor.background,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              elevation: 4,
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
          SizedBox(height: 10),
          // Statistical Dashboard Section
          CustomListTile(
            title: "Statistical Dashboard",
            icon: Icon(Icons.list_alt),
            onTapped: () => onItemTapped(0),
          ),

          // Financial Management Section
          CustomListTile(
            title: "Financial Management",
            icon: Icon(Icons.attach_money),
            onTapped: () => onItemTapped(1),
          ),

          // Manage Courses Section
          CustomListTile(
            title: "Manage Courses",
            icon: Icon(Icons.library_books),
            onTapped: () => onItemTapped(2),
          ),

          // Classifications Section
          CustomListTile(
            title: "Classifications",
            icon: Icon(Icons.category),
            onTapped: () => onItemTapped(3),
          ),

          // Manage Students Section
          CustomListTile(
            title: "Manage Students",
            icon: Icon(Icons.school),
            onTapped: () => onItemTapped(4),
          ),

          // Manage Teachers Section
          CustomListTile(
            title: "Manage Teachers",
            icon: Icon(Icons.group),
            onTapped: () => onItemTapped(5),
          ),

          // Promotions Section
          CustomListTile(
            title: "Promotions",
            icon: Icon(Icons.campaign),
            onTapped: () => onItemTapped(6),
          ),

          // Financial Reciepts Section
          CustomListTile(
            title: "Financial Reciepts",
            icon: Icon(Icons.receipt_long),
            onTapped: () => onItemTapped(7),
          ),

          // Curriculums Section
          CustomListTile(
            title: "Curriculums",
            icon: Icon(Icons.menu_book),
            onTapped: () => onItemTapped(8),
          ),

          // Certificates Export Section
          CustomListTile(
            title: "Certificates Export",
            icon: Icon(Icons.card_membership),
            onTapped: () => onItemTapped(9),
          ),
        ],
      ),
    );
  }
}
