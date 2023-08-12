import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/cupertino.dart';

class FieldName extends StatelessWidget {
  String TittleName;
  String name;
  TextEditingController controller;

  FieldName({
    required this.TittleName,
    required this.name,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          TittleName,
          style: GoogleFonts.poppins(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
        SizedBox(height: 8),
        Container(
          width: 320,
          height: 42,
          child: TextFormField(
            cursorColor: Colors.black,
            style: GoogleFonts.poppins(
              color: Color(0xFF000000),
            ),
            decoration: InputDecoration(
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
                hintText: name,
                hintStyle: GoogleFonts.poppins(
                  color: Colors.black.withOpacity(0.8),
                  fontWeight: FontWeight.w600,
                )),
          ),
        ),
      ],
    );
  }
}
