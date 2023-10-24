import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:mountain_guide_app/RouteStates.dart';
import 'package:mountain_guide_app/UI-Pages/Book-page/list-book.dart';
import 'package:mountain_guide_app/UI-Pages/HomePage/MountainPage.dart';
import 'package:mountain_guide_app/UI-Pages/Profil-page/profil.dart';
import 'package:mountain_guide_app/components/card-mountain.dart';
import 'package:mountain_guide_app/components/guide-card.dart';
import 'package:mountain_guide_app/style/Theme.dart';

import '../../controller/HomeController.dart';
import 'Trip-page/trip-Page.dart';

class AdminHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.find();
    homeController.getAllGuiders();
    homeController.getAllMountains();

    return Container(
      color: colorPrimary,
      padding: const EdgeInsets.all(24),
      child: Obx(
        () => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Hallo,',
                  style: GoogleFonts.poppins(
                    fontSize: 32,
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                  ),
                ),
                Image.asset(
                  'assets/images/avatar.png',
                  width: 35,
                ),
              ],
            ),
            Text(
              "${homeController.userInfo.value.nama}",
              style: GoogleFonts.poppins(
                fontSize: 32,
                fontWeight: FontWeight.w700,
                color: Colors.black,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Daftar Guider',
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: colorPrimaryText,
                  ),
                ),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(colorAccent)
                  ),
                  onPressed: () {
                    Get.toNamed(registerGuider);
                  },
                  child: Text(
                    'Tambah',
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: colorOnAccent,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 8),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  ...homeController.listGuider.map((element) {
                    return GuideCard(
                        imageGuide: "assets/images/avatar.png",
                        guideName: element.nama ?? "",
                        rangeGuide: element.email ?? "",
                        profileName: element.nomor ?? ""
                    );
                  })
                ],
              ),
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Daftar Gunung',
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: colorPrimaryText,
                  ),
                ),
                ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(colorAccent)
                  ),
                  onPressed: () {
                    Get.toNamed(registerMountain);
                  },
                  child: Text(
                    'Tambah',
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: colorOnAccent,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 8),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  ...homeController.listMountains.map((element) {
                    return CardMountain(
                      imageUrl: 'assets/images/image2.png',
                      mountainName: element.nama ?? "",
                      mountainMdpl: element.tinggi ?? "",
                    );
                  })
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
