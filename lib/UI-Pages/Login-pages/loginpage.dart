import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mountain_guide_app/UI-Pages/Homa-page/HomePage.dart';
import 'package:mountain_guide_app/UI-Pages/Login-pages/signup.dart';

import '../../RouteStates.dart';
import '../../controller/LoginController.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  LoginController loginController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffE5E5E5),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  top: 140,
                ),
                child: Center(
                  child: Image.asset(
                    'assets/images/montlogo.png',
                    width: 293,
                  ),
                ),
              ),
              SizedBox(height: 80),
              Container(
                width: 336,
                height: 410,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      spreadRadius: 1,
                      blurRadius: 2,
                    )
                  ],
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 30
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Sign In',
                            style: GoogleFonts.poppins(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(width: 35),
                          InkWell(
                            onTap: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SignUp()),
                              );
                            },
                            child: Text(
                              'Sign Up',
                              style: GoogleFonts.poppins(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: Colors.black.withOpacity(0.5),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Obx(
                      () => Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 32),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Email',
                              style: GoogleFonts.poppins(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(height: 8),
                            Container(
                              child: TextFormField(
                                initialValue: loginController.user.value.email,
                                cursorColor: Colors.black,
                                style: GoogleFonts.poppins(
                                  color: Color(0xFF000000),
                                ),
                                decoration: InputDecoration(
                                    contentPadding: EdgeInsets.only(
                                      left: 20,
                                      top: 15,
                                    ),
                                    fillColor: Color(0xFFF2F5FB),
                                    filled: true,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide.none,
                                    ),
                                    hintText: 'Email',
                                    hintStyle: GoogleFonts.poppins(
                                      color: Color(0xFFCFCFCF),
                                    )),
                                onChanged: (value) {
                                  loginController.user(loginController
                                      .user.value
                                      .copyWith(email: value));
                                },
                              ),
                            ),
                            SizedBox(height: 24),
                            Text(
                              'Password',
                              style: GoogleFonts.poppins(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(height: 8),
                            Container(
                              child: TextFormField(
                                initialValue: loginController.user.value.password,
                                cursorColor: Colors.black,
                                obscureText: loginController.showPassword.value,
                                style: GoogleFonts.poppins(
                                  color: Color(0xFF000000),
                                ),
                                decoration: InputDecoration(
                                    suffixIcon: IconButton(
                                        onPressed: () {
                                          loginController.showPassword(
                                              !loginController
                                                  .showPassword.value);
                                        },
                                        icon: Icon(
                                            loginController.showPassword.value
                                                ? Icons.visibility
                                                : Icons.visibility_off)),
                                    contentPadding: EdgeInsets.only(
                                      left: 20,
                                      top: 15,
                                    ),
                                    fillColor: Color(0xFFF2F5FB),
                                    filled: true,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide.none,
                                    ),
                                    hintText: 'Password',
                                    hintStyle: GoogleFonts.poppins(
                                      color: Color(0xFFCFCFCF),
                                    )),
                                onChanged: (value) {
                                  loginController.user(loginController
                                      .user.value
                                      .copyWith(password: value));
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 10,
                        left: 32,
                        right: 32
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            'Forgot Password?',
                            style: GoogleFonts.poppins(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: Colors.black.withOpacity(0.6),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 40),
                    InkWell(
                      onTap: () async {
                        log("${loginController.user.value}");
                        if (loginController.user.value.email != null &&
                            loginController.user.value.password != null &&
                            loginController.user.value.email?.isNotEmpty ==
                                true &&
                            loginController.user.value.password?.isNotEmpty ==
                                true) {
                          try {
                            await FirebaseAuth.instance
                                .signInWithEmailAndPassword(
                              email: loginController.user.value.email!,
                              password: loginController.user.value.password!,
                            );
                            Get.offAndToNamed(homePage);
                          } on FirebaseAuthException catch (e) {
                            if (e.code == 'user-not-found') {
                              Get.snackbar("Maaf","Email belum terdaftar");
                            } else if (e.code == 'wrong-password') {
                              Get.snackbar("Maaf","Password anda salah");
                            }
                          }
                        }
                      },
                      child: Container(
                        width: 295,
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Color(0xffFFB173),
                        ),
                        child: Center(
                          child: Text(
                            'Sign In',
                            style: GoogleFonts.poppins(
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
