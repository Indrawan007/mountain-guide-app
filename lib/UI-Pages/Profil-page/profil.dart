// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mountain_guide_app/UI-Pages/Book-page/list-book.dart';
import 'package:mountain_guide_app/UI-Pages/Homa-page/home.dart';
import 'package:mountain_guide_app/UI-Pages/Login-pages/loginpage.dart';
import 'package:mountain_guide_app/UI-Pages/Profil-page/edit-profil.dart';
import 'package:mountain_guide_app/components/card-name.dart';

class ProfilPage extends StatefulWidget {
  @override
  State<ProfilPage> createState() => _ProfilPageState();
}

class _ProfilPageState extends State<ProfilPage> {
  var data;
  @override
  Widget build(BuildContext context) {
    FirebaseAuth.instance.userChanges().listen((User? user) {
      if (user == null) {
        print('User is currently signed out!');
      } else {
        FirebaseFirestore.instance
            .collection('users')
            .where('uid', isEqualTo: user.uid)
            .get()
            .then((QuerySnapshot querySnapshot) {
          querySnapshot.docs.forEach((doc) {
            setState(() {
              data = doc;
            });
          });
        });
      }
    });
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  left: 24,
                  right: 145,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          PageRouteBuilder(
                            pageBuilder: (context, animation1, animation2) =>
                                Home(),
                            transitionDuration: Duration(seconds: 0),
                          ),
                        );
                      },
                      icon: Icon(Icons.arrow_back),
                      color: Colors.black,
                    ),
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
                  TittleName: 'Nama', name: data != null ? data["nama"] : ''),
              SizedBox(height: 24),
              CardName(
                  TittleName: 'Alamat',
                  name: data != null ? data["alamat"] : ''),
              SizedBox(height: 24),
              CardName(
                  TittleName: 'Nomor Telp',
                  name: data != null ? data["nomor"] : ''),
              SizedBox(height: 24),
              CardName(
                  TittleName: 'Email', name: data != null ? data["email"] : ''),
              SizedBox(height: 35),
              InkWell(
                onTap: (() {
                  Navigator.pushReplacement(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (context, animation1, animation2) =>
                          EditProfil(),
                      transitionDuration: Duration(seconds: 0),
                    ),
                  );
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
                onTap: () async {
                  try {
                    await FirebaseAuth.instance.signOut();
                    Navigator.pushReplacement(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (context, animation1, animation2) =>
                            LoginPage(),
                        transitionDuration: Duration(seconds: 0),
                      ),
                    );
                  } catch (e) {
                    print(e);
                  }
                },
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
                  Navigator.pushReplacement(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (context, animation1, animation2) => Home(),
                      transitionDuration: Duration(seconds: 0),
                    ),
                  );
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
                  Navigator.pushReplacement(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (context, animation1, animation2) =>
                          ListBook(),
                      transitionDuration: Duration(seconds: 0),
                    ),
                  );
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
