import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mountain_guide_app/UI-Pages/Book-page/list-book.dart';
import 'package:mountain_guide_app/UI-Pages/Profil-page/profil.dart';
import 'package:mountain_guide_app/controller/MainController.dart';
import 'package:mountain_guide_app/style/Theme.dart';

import '../RouteStates.dart';
import '../components/card-mountain.dart';
import '../components/guide-card.dart';
import '../controller/HomeController.dart';
import 'HomePage/HomePage.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.find();

    homeController.setUserInfo();
    var listPage = [HomePage(), ListBook(), ProfilPage()];
    log("nilai Index + ${homeController.indexMenu.value}");

    return Scaffold(
      body:  Obx(
            () => listPage.elementAt(homeController.indexMenu.value),
      ),
      bottomNavigationBar: Obx(
          () => BottomNavigationBar(
          onTap: (value) {
            log("nilai Index + ${value}");
            homeController.indexMenu(value);
          },
          selectedLabelStyle: GoogleFonts.poppins(
            color: colorPrimaryText,
            fontSize: 10,
            fontWeight: FontWeight.w500,
          ),
          unselectedLabelStyle: GoogleFonts.poppins(
            color: colorDisableText,
            fontSize: 10,
            fontWeight: FontWeight.w500,
          ),
          selectedItemColor: colorPrimaryText,
          unselectedItemColor: colorDisableText,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          currentIndex: homeController.indexMenu.value,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: homeController.indexMenu.value == 0 ? Icon(Icons.home, color: colorPrimaryText,) : Icon(Icons.home, color: colorDisableText),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: homeController.indexMenu.value == 1 ? Icon(Icons.book, color: colorPrimaryText,) : Icon(Icons.book, color: colorDisableText),
              label: 'Booking',
            ),
            BottomNavigationBarItem(
              icon: homeController.indexMenu.value == 2 ? Icon(Icons.account_circle, color: colorPrimaryText,) : Icon(Icons.account_circle, color: colorDisableText),
              label: 'Profil',
            ),
          ],
        ),
      ),
    );
  }
}
