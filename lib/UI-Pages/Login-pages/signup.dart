import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mountain_guide_app/RouteStates.dart';
import '../../data/model/User.dart' as model;
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mountain_guide_app/UI-Pages/Login-pages/loginpage.dart';
import 'package:mountain_guide_app/controller/SignUpController.dart';

import '../Homa-page/HomePage.dart';

class SignUp extends StatefulWidget {
  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  SignUpController signUpController = Get.find();

  @override
  Widget build(BuildContext context) {
    double height =
        MediaQueryData.fromView(WidgetsBinding.instance.window).size.height;
    bool isValid = false;

    return Scaffold(
      backgroundColor: Color(0xffE5E5E5),
      body: ConstrainedBox(
        constraints: BoxConstraints.tightFor(
          height: height,
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 16),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
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
                      top: 30,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {
                            Get.offAndToNamed(loginPage);
                          },
                          child: Text(
                            'Sign In',
                            style: GoogleFonts.poppins(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Colors.black.withOpacity(0.5),
                            ),
                          ),
                        ),
                        SizedBox(width: 35),
                        Text(
                          'Sign Up',
                          style: GoogleFonts.poppins(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
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
                      padding: const EdgeInsets.symmetric(horizontal: 32.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Nama',
                            style: GoogleFonts.poppins(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(height: 8),
                          Container(
                              child: Obx(
                            () => TextFormField(
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
                                  errorText: signUpController.isNotEmpty(
                                      value: signUpController.user.value.nama),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide.none,
                                  ),
                                  hintText: 'Nama',
                                  hintStyle: GoogleFonts.poppins(
                                    color: Color(0xFFCFCFCF),
                                  )),
                              initialValue: signUpController.user.value.nama,
                              onChanged: (value) {
                                signUpController.updateUser(signUpController
                                    .user.value
                                    .copyWith(nama: value));
                                log("value ${signUpController.user.value}");
                              },
                            ),
                          )),
                          SizedBox(height: 24),
                          Text(
                            'Alamat',
                            style: GoogleFonts.poppins(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(height: 8),
                          Container(
                            child: TextFormField(
                              cursorColor: Colors.black,
                              style: GoogleFonts.poppins(
                                color: Color(0xFF000000),
                              ),
                              decoration: InputDecoration(
                                  contentPadding: EdgeInsets.only(
                                    left: 20,
                                    top: 15,
                                  ),
                                  errorText: signUpController.isNotEmpty(
                                      value:
                                          signUpController.user.value.alamat),
                                  fillColor: Color(0xFFF2F5FB),
                                  filled: true,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide.none,
                                  ),
                                  hintText: 'Alamat',
                                  hintStyle: GoogleFonts.poppins(
                                    color: Color(0xFFCFCFCF),
                                  )),
                              initialValue: signUpController.user.value.alamat,
                              onChanged: (value) {
                                signUpController.updateUser(signUpController
                                    .user.value
                                    .copyWith(alamat: value));
                              },
                            ),
                          ),
                          SizedBox(height: 24),
                          Text(
                            'Nomor Telp',
                            style: GoogleFonts.poppins(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(height: 8),
                          Container(
                            child: TextFormField(
                              cursorColor: Colors.black,
                              style: GoogleFonts.poppins(
                                color: Color(0xFF000000),
                              ),
                              keyboardType: TextInputType.phone,
                              decoration: InputDecoration(
                                  contentPadding: EdgeInsets.only(
                                    left: 20,
                                    top: 15,
                                  ),
                                  fillColor: Color(0xFFF2F5FB),
                                  errorText: signUpController.isNotEmpty(
                                      value: signUpController.user.value.nomor),
                                  filled: true,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide.none,
                                  ),
                                  hintText: 'Nomor Telp',
                                  hintStyle: GoogleFonts.poppins(
                                    color: Color(0xFFCFCFCF),
                                  )),
                              initialValue: signUpController.user.value.nomor,
                              onChanged: (value) {
                                signUpController.updateUser(signUpController
                                    .user.value
                                    .copyWith(nomor: value));
                              },
                            ),
                          ),
                          SizedBox(height: 24),
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
                              cursorColor: Colors.black,
                              style: GoogleFonts.poppins(
                                color: Color(0xFF000000),
                              ),
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                  contentPadding: EdgeInsets.only(
                                    left: 20,
                                    top: 15,
                                  ),
                                  fillColor: Color(0xFFF2F5FB),
                                  filled: true,
                                  errorText: signUpController.emailValidator(
                                      value: signUpController.user.value.email),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide.none,
                                  ),
                                  hintText: 'Email',
                                  hintStyle: GoogleFonts.poppins(
                                    color: Color(0xFFCFCFCF),
                                  )),
                              initialValue: signUpController.user.value.email,
                              onChanged: (value) {
                                signUpController.updateUser(signUpController
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
                              cursorColor: Colors.black,
                              obscureText: signUpController.showPassword.value,
                              style: GoogleFonts.poppins(
                                color: Color(0xFF000000),
                              ),
                              decoration: InputDecoration(
                                  suffixIcon: IconButton(
                                      onPressed: () {
                                        signUpController.showPassword(
                                            !signUpController
                                                .showPassword.value);
                                      },
                                      icon: Icon(
                                          signUpController.showPassword.value
                                              ? Icons.visibility
                                              : Icons.visibility_off)),
                                  contentPadding: EdgeInsets.only(
                                    left: 20,
                                    top: 15,
                                  ),
                                  fillColor: Color(0xFFF2F5FB),
                                  filled: true,
                                  errorText: signUpController.passwordValidator(
                                      value:
                                          signUpController.user.value.password),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide.none,
                                  ),
                                  hintText: 'Password',
                                  hintStyle: GoogleFonts.poppins(
                                    color: Color(0xFFCFCFCF),
                                  )),
                              initialValue:
                                  signUpController.user.value.password,
                              onChanged: (value) {
                                signUpController.updateUser(signUpController
                                    .user.value
                                    .copyWith(password: value));
                              },
                            ),
                          ),
                          SizedBox(height: 24),
                          Text(
                            'Confirm Password',
                            style: GoogleFonts.poppins(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(height: 8),
                          Container(
                            child: Obx(
                              () => TextFormField(
                                cursorColor: Colors.black,
                                obscureText:
                                    signUpController.showConfirmPassword.value,
                                style: GoogleFonts.poppins(
                                  color: Color(0xFF000000),
                                ),
                                decoration: InputDecoration(
                                    contentPadding: EdgeInsets.only(
                                      left: 20,
                                      top: 15,
                                    ),
                                    errorText:
                                        signUpController.passwordValidator(
                                            value: signUpController
                                                .user.value.confirmPassword),
                                    suffixIcon: IconButton(
                                        onPressed: () {
                                          signUpController.showConfirmPassword(
                                              !signUpController
                                                  .showConfirmPassword.value);
                                        },
                                        icon: Icon(signUpController
                                                .showConfirmPassword.value
                                            ? Icons.visibility
                                            : Icons.visibility_off)),
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
                                initialValue:
                                    signUpController.user.value.confirmPassword,
                                onChanged: (value) {
                                  signUpController.updateUser(signUpController
                                      .user.value
                                      .copyWith(confirmPassword: value));
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 30),
                  InkWell(
                    onTap: () => signUpController.signUp(),
                    child: Container(
                      width: 295,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Color(0xffFFB173),
                      ),
                      child: Center(
                        child: Text(
                          'Sign Up',
                          style: GoogleFonts.poppins(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Sudah punya akun?',
                        style: GoogleFonts.poppins(
                          fontSize: 11,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginPage()),
                          );
                        },
                        child: Text(
                          'Login',
                          style: GoogleFonts.poppins(
                            fontSize: 11,
                            fontWeight: FontWeight.w600,
                            color: Color(0xff395995),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
