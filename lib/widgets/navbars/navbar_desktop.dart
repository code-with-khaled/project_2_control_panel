import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NavbarDesktop extends StatelessWidget {
  const NavbarDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 8, right: 8, top: 5),
      height: 80,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Row(
          //   children: [
          //     Padding(
          //       padding: const EdgeInsets.symmetric(horizontal: 20),
          //       child: Icon(Icons.library_books),
          //     ),
          //     Text(
          //       "Manage - All - Courses",
          //       style: TextStyle(
          //         fontSize: 28,
          //         fontWeight: FontWeight.w700,
          //         fontStyle: FontStyle.italic,
          //       ),
          //     ),
          //   ],
          // ),
          Row(
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
                child: CircleAvatar(radius: 25, backgroundColor: Colors.grey),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
