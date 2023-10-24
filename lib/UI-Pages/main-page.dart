import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mountain_guide_app/UI-Pages/Book-page/GuiderListBook.dart';
import 'package:mountain_guide_app/UI-Pages/Book-page/list-book.dart';
import 'package:mountain_guide_app/UI-Pages/Profil-page/profil.dart';
import 'package:mountain_guide_app/controller/MainController.dart';
import 'package:mountain_guide_app/data/Session.dart';
import 'package:mountain_guide_app/style/Theme.dart';

import '../RouteStates.dart';
import '../components/card-mountain.dart';
import '../components/guide-card.dart';
import '../controller/HomeController.dart';
import 'HomePage/AdminHomePage.dart';
import 'HomePage/HomePage.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.find();
    homeController.setUserInfo();
    var customerPage = [HomePage(), ListBook(), ProfilPage()];
    var guiderPage = [GuiderListBook(), ProfilPage()];
    var adminPage = [AdminHomePage(), ProfilPage()];
    var adminMenus = [
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

    var customerMenus = [
      BottomNavigationBarItem(
        icon: homeController.indexMenu.value == 0
            ? Icon(
                Icons.home,
                color: colorPrimaryText,
              )
            : Icon(Icons.home, color: colorDisableText),
        label: 'Home',
      ),
      BottomNavigationBarItem(
        icon: homeController.indexMenu.value == 1
            ? Icon(
                Icons.book,
                color: colorPrimaryText,
              )
            : Icon(Icons.book, color: colorDisableText),
        label: 'Booking',
      ),
      BottomNavigationBarItem(
        icon: homeController.indexMenu.value == 2
            ? Icon(
                Icons.account_circle,
                color: colorPrimaryText,
              )
            : Icon(Icons.account_circle, color: colorDisableText),
        label: 'Profil',
      )
    ];

    var guiderMenus = [
      BottomNavigationBarItem(
        icon: homeController.indexMenu.value == 0
            ? Icon(
                Icons.book,
                color: colorPrimaryText,
              )
            : Icon(Icons.book, color: colorDisableText),
        label: 'Booking',
      ),
      BottomNavigationBarItem(
        icon: homeController.indexMenu.value == 1
            ? Icon(
                Icons.account_circle,
                color: colorPrimaryText,
              )
            : Icon(Icons.account_circle, color: colorDisableText),
        label: 'Profil',
      )
    ];

    log("nilai Index + ${homeController.indexMenu.value}");

    return Scaffold(
      backgroundColor: const Color(0xffEFF1F3),
      body: Obx(() {
        var screen = customerPage.elementAt(homeController.indexMenu.value);
        if(homeController.userInfo.value.role == "customer"){
          return customerPage.elementAt(homeController.indexMenu.value);
        } else if(homeController.userInfo.value.role == "guider") {
          return guiderPage.elementAt(homeController.indexMenu.value);
        } else if(homeController.userInfo.value.role == "admin"){
          return adminPage.elementAt(homeController.indexMenu.value);
        } else {
          return screen;
        }
      }),
      bottomNavigationBar: Obx(
        () {
          var tabs = customerMenus;
          if(homeController.userInfo.value.role == "customer"){
            tabs = customerMenus;
          } else if(homeController.userInfo.value.role == "guider") {
            tabs = guiderMenus;
          } else if(homeController.userInfo.value.role == "admin"){
            tabs = adminMenus;
          }
          return BottomNavigationBar(
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
              items:tabs
          );
        }
      ),
    );
  }
}
