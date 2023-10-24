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

class RegisterMountain extends StatelessWidget {
  const RegisterMountain({super.key});

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
                          'Gunung',
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
                                      value: signUpController.mountain.value.nama),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide.none,
                                  ),
                                  hintText: 'Nama',
                                  hintStyle: GoogleFonts.poppins(
                                    color: Color(0xFFCFCFCF),
                                  )),
                              initialValue: signUpController.mountain.value.nama,
                              onChanged: (value) {
                                signUpController.updateMountain(signUpController
                                    .mountain.value
                                    .copyWith(nama: value));
                                log("value ${signUpController.mountain.value}");
                              },
                            ),
                          )),
                          SizedBox(height: 24),
                          Text(
                            'Lokasi',
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
                                      value: signUpController.mountain.value.lokasi),
                                  fillColor: Color(0xFFF2F5FB),
                                  filled: true,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide.none,
                                  ),
                                  hintText: 'Lokasi',
                                  hintStyle: GoogleFonts.poppins(
                                    color: Color(0xFFCFCFCF),
                                  )),
                              initialValue: signUpController.mountain.value.lokasi,
                              onChanged: (value) {
                                signUpController.updateMountain(signUpController
                                    .mountain.value
                                    .copyWith(lokasi: value));
                              },
                            ),
                          ),
                          SizedBox(height: 24),
                          Text(
                            'Keterangan',
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
                              keyboardType: TextInputType.multiline,
                              decoration: InputDecoration(
                                  contentPadding: EdgeInsets.only(
                                    left: 20,
                                    top: 15,
                                  ),
                                  fillColor: Color(0xFFF2F5FB),
                                  errorText: Validator.isNotEmpty(
                                      value: signUpController.mountain.value.ket),
                                  filled: true,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide.none,
                                  ),
                                  hintText: 'Keterangan',
                                  hintStyle: GoogleFonts.poppins(
                                    color: Color(0xFFCFCFCF),
                                  )),
                              initialValue: signUpController.mountain.value.ket,
                              onChanged: (value) {
                                signUpController.updateMountain(signUpController
                                    .mountain.value
                                    .copyWith(ket: value));
                              },
                            ),
                          ),
                          SizedBox(height: 24),
                          Text(
                            'Tinggi',
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
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                  contentPadding: EdgeInsets.only(
                                    left: 20,
                                    top: 15,
                                  ),
                                  fillColor: Color(0xFFF2F5FB),
                                  filled: true,
                                  errorText: Validator.isNotEmpty(
                                      value: signUpController.mountain.value.tinggi),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide.none,
                                  ),
                                  hintText: 'Tinggi',
                                  hintStyle: GoogleFonts.poppins(
                                    color: Color(0xFFCFCFCF),
                                  )),
                              initialValue: signUpController.mountain.value.tinggi,
                              onChanged: (value) {
                                signUpController.updateMountain(signUpController
                                    .mountain.value
                                    .copyWith(tinggi: "$value Mdpl"));
                              },
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 30),
                  InkWell(
                    onTap: () => signUpController.registerMountain(),
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
