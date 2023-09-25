import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as usersAuth;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mountain_guide_app/UI-Pages/HomePage/HomePage.dart';
import 'package:mountain_guide_app/UI-Pages/Login-pages/signup.dart';
import 'package:mountain_guide_app/data/Session.dart';
import 'package:mountain_guide_app/data/model/User.dart';

import '../../RouteStates.dart';
import '../../controller/LoginController.dart';
import '../../style/Theme.dart';

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
                      padding: const EdgeInsets.only(top: 30),
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
                              Get.offAndToNamed(signUpPage);
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
                                  color: colorPrimaryText,
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
                                initialValue:
                                    loginController.user.value.password,
                                cursorColor: Colors.black,
                                obscureText: loginController.showPassword.value,
                                style: GoogleFonts.poppins(
                                  color: colorPrimaryText,
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
                      padding:
                          const EdgeInsets.only(top: 10, left: 32, right: 32),
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
                      onTap: () => loginController.login(),
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
