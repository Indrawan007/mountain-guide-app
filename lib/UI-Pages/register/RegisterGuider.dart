import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../RouteStates.dart';
import '../../controller/SignUpController.dart';
import '../../style/Theme.dart';
import '../../util/Validator.dart';

class RegisterGuider extends StatelessWidget {
  const RegisterGuider({super.key});

  @override
  Widget build(BuildContext context) {
    SignUpController signUpController = Get.find();
    double height =
        MediaQueryData.fromView(WidgetsBinding.instance.window).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ConstrainedBox(
          constraints: BoxConstraints.tightFor(
            height: height,
          ),
          child: SingleChildScrollView(
            child: Container(
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
                            Get.back();
                          },
                          icon: Icon(Icons.arrow_back),
                          color: Colors.black,
                        ),
                        Text(
                          'Tour Guide',
                          style: GoogleFonts.poppins(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
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
                                color: colorPrimaryText,
                              ),
                              decoration: InputDecoration(
                                  contentPadding: EdgeInsets.only(
                                    left: 20,
                                    top: 15,
                                  ),
                                  fillColor: Color(0xFFF2F5FB),
                                  filled: true,
                                  errorText: Validator.isNotEmpty(
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
                                color: colorPrimaryText,
                              ),
                              decoration: InputDecoration(
                                  contentPadding: EdgeInsets.only(
                                    left: 20,
                                    top: 15,
                                  ),
                                  errorText: Validator.isNotEmpty(
                                      value: signUpController.user.value.alamat),
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
                                color: colorPrimaryText,
                              ),
                              keyboardType: TextInputType.phone,
                              decoration: InputDecoration(
                                  contentPadding: EdgeInsets.only(
                                    left: 20,
                                    top: 15,
                                  ),
                                  fillColor: Color(0xFFF2F5FB),
                                  errorText: Validator.isNotEmpty(
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
                                color: colorPrimaryText,
                              ),
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                  contentPadding: EdgeInsets.only(
                                    left: 20,
                                    top: 15,
                                  ),
                                  fillColor: Color(0xFFF2F5FB),
                                  filled: true,
                                  errorText: Validator.emailValidator(
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
                                color: colorPrimaryText,
                              ),
                              decoration: InputDecoration(
                                  suffixIcon: IconButton(
                                      onPressed: () {
                                        signUpController.showPassword(
                                            !signUpController.showPassword.value);
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
                                  errorText: Validator.passwordValidator(
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
                              initialValue: signUpController.user.value.password,
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
                                  color: colorPrimaryText,
                                ),
                                decoration: InputDecoration(
                                    contentPadding: EdgeInsets.only(
                                      left: 20,
                                      top: 15,
                                    ),
                                    errorText: Validator.passwordValidator(
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
                    onTap: () => signUpController.signUp(asGuider: true),
                    child: Container(
                      width: 295,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Color(0xffFFB173),
                      ),
                      child: Center(
                        child: Text(
                          'Daftar',
                          style: GoogleFonts.poppins(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 16)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
