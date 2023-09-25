import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/cupertino.dart';
import 'package:mountain_guide_app/RouteStates.dart';
import 'package:mountain_guide_app/UI-Pages/Book-page/list-book.dart';
import 'package:mountain_guide_app/UI-Pages/HomePage/HomePage.dart';
import 'package:mountain_guide_app/UI-Pages/Profil-page/profil.dart';
import 'package:mountain_guide_app/components/MountainTextField.dart';
import 'package:mountain_guide_app/controller/EditUserController.dart';
import 'package:mountain_guide_app/util/Validator.dart';

import '../../controller/ProfileController.dart';

class EditProfile extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    EditUserController editUserController = Get.find();

    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Obx(
            () => Column(
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
                        'Edit Profile',
                        style: GoogleFonts.poppins(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 30),
                Stack(
                  children: [
                    Image.asset(
                      'assets/images/avatar.png',
                      width: 120,
                    ),
                    Positioned.fill(
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child: Image.asset(
                          'assets/images/add_vector.png',
                          width: 40,
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(height: 48),
                MountainTextField(
                  titleName: 'Nama',
                  initialValue: editUserController.userInfo.value.nama ?? "",
                  onChange: (value) => editUserController.userInfo(editUserController.userInfo.value.copyWith(nama: value)),
                  errorText: Validator.isNotEmpty(value: editUserController.userInfo.value.nama),
                ),
                SizedBox(height: 24),
                MountainTextField(
                  titleName: 'Alamat',
                  initialValue: editUserController.userInfo.value.alamat ?? "",
                  onChange: (value) => editUserController.userInfo(editUserController.userInfo.value.copyWith(alamat: value)),
                  errorText: Validator.isNotEmpty(value: editUserController.userInfo.value.alamat),
                ),
                SizedBox(height: 24),
                MountainTextField(
                  titleName: 'Nomor Telp',
                  initialValue: editUserController.userInfo.value.nomor ?? "",
                  onChange: (value) => editUserController.userInfo(editUserController.userInfo.value.copyWith(nomor: value)),
                  errorText: Validator.isNotEmpty(value: editUserController.userInfo.value.nomor),
                ),
                SizedBox(height: 24),
                MountainTextField(
                  titleName: 'Email',
                  initialValue: editUserController.userInfo.value.email ?? "",
                  onChange: (value) => editUserController.userInfo(editUserController.userInfo.value.copyWith(email: value)),
                  errorText: Validator.emailValidator(value: editUserController.userInfo.value.email),
                ),
                SizedBox(height: 35),
                InkWell(
                  onTap: () {
                    var validatorResponse = editUserController.validateUser(editUserController.userInfo.value.copyWith());
                    if(editUserController.isValid.value == true){
                      editUserController.updateUser(editUserController.userInfo.value.copyWith());
                    } else {
                      Get.snackbar("Update Info", "${validatorResponse}");
                    }
                  },
                  child: Container(
                    width: 292,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color(0xffFFB173),
                    ),
                    child: Center(
                      child: Text(
                        'Update',
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
                // Container(
                //   width: 292,
                //   height: 50,
                //   decoration: BoxDecoration(
                //     borderRadius: BorderRadius.circular(10),
                //     color: Colors.red,
                //   ),
                //   child: Center(
                //     child: Text(
                //       'Delete',
                //       style: GoogleFonts.poppins(
                //         fontSize: 18,
                //         fontWeight: FontWeight.w700,
                //         color: Colors.white,
                //       ),
                //     ),
                //   ),
                // ),
                // SizedBox(height: 18),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
