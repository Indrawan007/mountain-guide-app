import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';

class CardName extends StatelessWidget {
  String TittleName;
  String name;

  CardName({
    required this.TittleName,
    required this.name,
  });
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Color(0xFFF2F5FB),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 10, left: 20),
          child: Text(
            name,
            style: GoogleFonts.poppins(
              color: Colors.black.withOpacity(0.8),
              fontWeight: FontWeight.w600,
              fontSize: 14,
            ),
          ),
        ),
      ),
    ]);
  }
}
