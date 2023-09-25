import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/cupertino.dart';

import '../style/Theme.dart';

class MountainTextField extends StatelessWidget {
  String titleName;
  String initialValue;
  String? errorText;
  ValueChanged<String>? onChange;

  MountainTextField({
    required this.titleName,
    required this.initialValue,
    this.onChange,
    this.errorText
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            titleName,
            style: GoogleFonts.poppins(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 8),
          Container(
            child: TextFormField(
              onChanged: onChange,
              initialValue: initialValue,
              cursorColor: Colors.black,
              style: GoogleFonts.poppins(
                color: colorPrimaryText,
              ),
              decoration: InputDecoration(
                  errorText: errorText,
                  contentPadding: EdgeInsets.only(
                    left: 20,
                    top: 15,
                  ),
                  fillColor: Color(0xFFF2F5FB),
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                  hintStyle: GoogleFonts.poppins(
                    color: Colors.black.withOpacity(0.8),
                    fontWeight: FontWeight.w600,
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
