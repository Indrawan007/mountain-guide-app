
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mountain_guide_app/UI-Pages/HomePage/AdminHomePage.dart';
import 'package:mountain_guide_app/UI-Pages/Profil-page/profil.dart';
import 'package:mountain_guide_app/UI-Pages/admin-guide/ProfileAdmin.dart';
import 'package:mountain_guide_app/controller/HomeController.dart';

import '../style/Theme.dart';

class AdminMainPage extends StatelessWidget {
  const AdminMainPage({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.find();
    homeController.setUserInfo();
    var customerPage = [AdminHomePage(), ProfilPage()];
    var customerMenus = [
      BottomNavigationBarItem(
        icon: homeController.indexMenu.value == 0
            ? Icon(
          Icons.home,
          color: colorPrimaryText,
        )
            : Icon(Icons.home, color: colorDisableText),
        label: 'Beranda',
      ),
      BottomNavigationBarItem(
        icon: homeController.indexMenu.value == 1
            ? Icon(
          Icons.account_circle,
          color: colorPrimaryText,
        )
            : Icon(Icons.account_circle, color: colorDisableText),
        label: 'Profile',
      ),
    ];

    return Scaffold(
      body: Obx(
            () => customerPage.elementAt(homeController.indexMenu.value),
      ),
      bottomNavigationBar: Obx(
            () => BottomNavigationBar(
          onTap: (value) {
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
          items: customerMenus,
        ),
      ),
    );
  }
}
