import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:mountain_guide_app/UI-Pages/Book-page/list-book.dart';
import 'package:mountain_guide_app/UI-Pages/Profil-page/profil.dart';
import 'package:mountain_guide_app/components/card-mountain.dart';
import 'package:mountain_guide_app/components/guide-card.dart';


class TripPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CardMountain(
              imageUrl: 'assets/images/image3.png',
              mountainName: 'Gunung Bawakaraeng',
              mountainMdpl: '10 Nov - 13 Nov',
            ),
            CardMountain(
              imageUrl: 'assets/images/image4.png',
              mountainName: 'Gunung Lompobattang',
              mountainMdpl: '10 Nov - 13 Nov',
            ),
          ],
        )
      ],
    );
  }
}
