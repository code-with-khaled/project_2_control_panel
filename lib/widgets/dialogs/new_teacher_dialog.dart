import 'package:control_panel/constants/custom_color.dart';
import 'package:control_panel/widgets/custom_widgets/custom_button.dart';
import 'package:control_panel/widgets/new_course.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class NewTeacherDialog extends StatelessWidget {
  const NewTeacherDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "New Student",
              style: GoogleFonts.inter(
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(Icons.close),
            ),
          ],
        ),
        content: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                LabelText(text: "First Name"),
                CustomTextField(),
                SizedBox(height: 12),
                LabelText(text: "Last Name"),
                CustomTextField(),
                SizedBox(height: 12),
                LabelText(text: "User Name"),
                CustomTextField(),
                SizedBox(height: 12),
                LabelText(text: "Date of Birth"),
                DateTextField(),
                SizedBox(height: 12),
                LabelText(text: "Password"),
                CustomTextField(),
                SizedBox(height: 12),
                LabelText(text: "Confirm Password"),
                CustomTextField(),
              ],
            ),
            SizedBox(width: 20),
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                LabelText(text: "Phone Number"),
                PhoneTextField(),
                SizedBox(height: 12),
                LabelText(text: "Gender"),
                GenderSelection(),
                SizedBox(height: 12),
                LabelText(text: "Personal image"),
                Container(
                  width: 132,
                  height: 132,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.black54, width: 2.0),
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: CircleAvatar(
                          radius: 30,
                          child: Icon(Icons.person),
                        ),
                      ),
                      Text(
                        "Choose file...",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text("No file chosen"),
                    ],
                  ),
                ),
                SizedBox(height: 12),
                LabelText(text: "Education"),
                Container(
                  color: Colors.grey[200],
                  width: 210,
                  child: DropdownButtonFormField(
                    decoration: InputDecoration(border: OutlineInputBorder()),
                    items: [],
                    onChanged: (value) {},
                  ),
                ),
                SizedBox(height: 12),
                LabelText(text: "Major"),
                Container(
                  color: Colors.grey[200],
                  width: 210,
                  child: DropdownButtonFormField(
                    decoration: InputDecoration(border: OutlineInputBorder()),
                    items: [],
                    onChanged: (value) {},
                  ),
                ),
              ],
            ),
          ],
        ),
        actions: [
          Center(
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: CustomColor.lime,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text("Submit", style: TextStyle(color: Colors.black)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class PhoneTextField extends StatelessWidget {
  const PhoneTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 210,
      child: TextFormField(
        // controller: controller,
        keyboardType: TextInputType.phone,
        inputFormatters: [
          FilteringTextInputFormatter.digitsOnly, // Allow only numbers
        ],
        decoration: InputDecoration(
          fillColor: Colors.grey[200],
          filled: true,
          labelText: "Phone Number",
          hintText: "0994 387 970",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
          prefixIcon: Icon(Icons.phone),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "Please enter a phone number";
          }
          if (!RegExp(r'^\+?[0-9]{7,15}$').hasMatch(value)) {
            return "Enter a valid phone number";
          }
          return null;
        },
      ),
    );
  }
}

class GenderSelection extends StatefulWidget {
  const GenderSelection({super.key});

  @override
  State<GenderSelection> createState() => _GenderSelectionState();
}

class _GenderSelectionState extends State<GenderSelection> {
  String? _selectedGender;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 210,
      height: 48,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            children: [
              Radio<String>(
                value: "Male",
                groupValue: _selectedGender,
                onChanged: (value) {
                  setState(() {
                    _selectedGender = value;
                  });
                },
              ),
              Text("Male"),
            ],
          ),
          SizedBox(width: 10),
          Row(
            children: [
              Radio<String>(
                value: "Female",
                groupValue: _selectedGender,
                onChanged: (value) {
                  setState(() {
                    _selectedGender = value;
                  });
                },
              ),
              Text("Female"),
            ],
          ),
        ],
      ),
    );
  }
}

class DateTextField extends StatefulWidget {
  const DateTextField({super.key});

  @override
  State<DateTextField> createState() => _DateTextFieldState();
}

class _DateTextFieldState extends State<DateTextField> {
  final TextEditingController _controller = TextEditingController();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );

    if (picked != null) {
      setState(() {
        _controller.text =
            "${picked.toLocal()}".split(' ')[0]; // Formats the date
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 210,
      child: TextField(
        controller: _controller,
        readOnly: true, // Prevent manual text input
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.grey[200],
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
          suffixIcon: IconButton(
            icon: Icon(Icons.calendar_today),
            onPressed: () => _selectDate(context), // Opens date picker
          ),
        ),
      ),
    );
  }
}
