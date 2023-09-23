// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mountain_guide_app/UI-Pages/Book-page/list-book.dart';
import 'package:mountain_guide_app/UI-Pages/Homa-page/HomePage.dart';
import 'package:mountain_guide_app/UI-Pages/Login-pages/loginpage.dart';
import 'package:mountain_guide_app/UI-Pages/Profil-page/edit-profil.dart';
import 'package:mountain_guide_app/components/card-name.dart';
import 'package:mountain_guide_app/controller/ProfileController.dart';

import '../../RouteStates.dart';

class ProfilPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    ProfileController profileController = Get.find();
    profileController.setUserInfo();

    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Obx(
            () => Column(
              children: [
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'My Profile',
                        style: GoogleFonts.poppins(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 30),
                Image.asset(
                  'assets/images/avatar.png',
                  width: 120,
                ),
                SizedBox(height: 48),
                CardName(
                    TittleName: 'Nama', name: profileController.userInfo.value.nama ?? ""),
                SizedBox(height: 24),
                CardName(
                    TittleName: 'Alamat',
                    name: profileController.userInfo.value.alamat ?? ""),
                SizedBox(height: 24),
                CardName(
                    TittleName: 'Nomor Telp',
                    name: profileController.userInfo.value.nomor ?? ""),
                SizedBox(height: 24),
                CardName(
                    TittleName: 'Email', name: profileController.userInfo.value.email ?? ""),
                SizedBox(height: 35),
                InkWell(
                  onTap: (() {
                    Get.toNamed(editProfile);
                  }),
                  child: Container(
                    width: 292,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color(0xffFFB173),
                    ),
                    child: Center(
                      child: Text(
                        'Edit Profile',
                        style: GoogleFonts.poppins(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 18),
                InkWell(
                  onTap: () => profileController.logout(),
                  child: Container(
                    width: 292,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.red,
                    ),
                    child: Center(
                      child: Text(
                        'Log Out',
                        style: GoogleFonts.poppins(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 18),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedLabelStyle: GoogleFonts.poppins(
          color: Colors.black,
          fontSize: 10,
          fontWeight: FontWeight.w500,
        ),
        unselectedLabelStyle: GoogleFonts.poppins(
          color: Color(0xFFCFCFCF),
          fontSize: 10,
          fontWeight: FontWeight.w500,
        ),
        selectedItemColor: Colors.black,
        unselectedItemColor: Color(0xFFCFCFCF),
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        currentIndex: 2,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.only(
                top: 18.0,
                bottom: 8,
              ),
              child: InkWell(
                onTap: () {
                  Get.offAndToNamed(homePage);
                },
                child: Image.asset(
                  'assets/images/nav_home.png',
                  width: 18.0,
                ),
              ),
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.only(
                top: 18.0,
                bottom: 8,
              ),
              child: InkWell(
                onTap: () {
                  Get.offAndToNamed(listbookPage);
                },
                child: Image.asset(
                  'assets/images/nav_book.png',
                  width: 20,
                ),
                // ),
              ),
            ),
            label: 'List Book',
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.only(
                top: 18.0,
                bottom: 8,
              ),
              child: Image.asset(
                'assets/images/nav_profile_on.png',
                width: 25,
              ),
            ),
            label: 'Profil',
          ),
        ],
      ),
    );
  }
}
