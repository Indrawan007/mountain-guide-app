
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../components/card-mountain.dart';

class MountainPage extends StatelessWidget {
  const MountainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CardMountain(
              imageUrl: 'assets/images/image1.png',
              mountainName: 'Gunung Bawakaraeng',
              mountainMdpl: '1080 Mdpl',
            ),
            CardMountain(
              imageUrl: 'assets/images/image2.png',
              mountainName: 'Gunung Lompobattang',
              mountainMdpl: '1080 Mdpl',
            ),
          ],
        ),
        SizedBox(height: 18),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CardMountain(
              imageUrl: 'assets/images/image3.png',
              mountainName: 'Gunung Lompobattang',
              mountainMdpl: '1080 Mdpl',
            ),
            CardMountain(
              imageUrl: 'assets/images/image4.png',
              mountainName: 'Gunung Lompobattang',
              mountainMdpl: '1080 Mdpl',
            ),
          ],
        ),
        SizedBox(height: 18),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CardMountain(
              imageUrl: 'assets/images/image5.png',
              mountainName: 'Gunung Lompobattang',
              mountainMdpl: '1080 Mdpl',
            ),
            CardMountain(
              imageUrl: 'assets/images/image6.png',
              mountainName: 'Gunung Lompobattang',
              mountainMdpl: '1080 Mdpl',
            ),
          ],
        ),
        SizedBox(height: 24),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Tour Guide Avaliable',
              style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              'See All',
              style: GoogleFonts.poppins(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: Color(0xff395995),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
