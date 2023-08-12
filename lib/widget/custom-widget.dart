import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomWidget {
  CustomWidget();
  Widget textcustom(
    String text, {
    FontWeight fontWeight = FontWeight.w600,
    double size = 16,
    Color warna = Colors.black,
  }) {
    return Text(
      text,
      style: GoogleFonts.poppins(
        fontSize: size,
        fontWeight: fontWeight,
        color: warna,
      ),
    );
  }

  Widget customButton({
    double lebar = 292,
    double tinggi = 48,
    Color warna = const Color(0xffFFB173),
    String text = '',
    double radiusCircular = 2,
    double sizeText = 10,
  }) {
    return Container(
      width: lebar,
      height: tinggi,
      decoration: BoxDecoration(
        color: warna,
        borderRadius: BorderRadius.circular(radiusCircular),
      ),
      child: Center(
        child: textcustom(
          text,
          size: sizeText,
          warna: Colors.white,
        ),
      ),
    );
  }
}
