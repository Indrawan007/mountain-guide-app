import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as Firebase;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mountain_guide_app/RouteStates.dart';
import 'package:mountain_guide_app/components/MountainTextField.dart';
import 'package:mountain_guide_app/style/Theme.dart';

import '../data/Session.dart';
import '../data/model/User.dart';

class ProfileController extends GetxController {
  Session session = Get.find();
  var oldEmail = "".obs;
  var password = "".obs;
  var userInfo = User().obs;
  CollectionReference usersCollection =
      FirebaseFirestore.instance.collection('users');
  var firestoreDb = FirebaseFirestore.instance;
  final isValid = false.obs;

  Future<void> setUserInfo() async {
    var nama = await session.readUserNama();
    var alamat = await session.readUserAlamat();
    var uid = await session.readUserUid();
    var email = await session.readUserEmail();
    var nomor = await session.readUserNomor();

    userInfo(userInfo.value.copyWith(
        nama: nama, alamat: alamat, uid: uid, email: email, nomor: nomor));
    log("USER info ProfileController ${userInfo.value}");
  }

  Future<void> updateUser(
    User updatedUser,
  ) async {
    log("updated user ${updatedUser}");

    var listUser =
        await usersCollection.where("uid", isEqualTo: updatedUser.uid).get();

    showModalBottomSheet(
      context: Get.context!,
      isScrollControlled: true,
      builder: (context) {
        return Obx(
          () => Container(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom + 24, top: 24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              mainAxisSize: MainAxisSize.min,
              children: [
                MountainTextField(
                  titleName: "Old Email",
                  initialValue: oldEmail.value,
                  onChange: (value) => oldEmail(value),
                ),
                MountainTextField(
                  titleName: "Password",
                  initialValue: password.value ?? "",
                  onChange: (value) => password(value),
                ),
                SizedBox(height: 24),
                GestureDetector(
                  onTap: () async {
                    try {
                      var credential = await Firebase.FirebaseAuth.instance
                          .signInWithEmailAndPassword(
                              email: oldEmail.value,
                              password: password.value);
                      if (credential.user?.uid.isNotEmpty == true) {
                        if (listUser.docs.isNotEmpty) {
                          firestoreDb.runTransaction((transaction) async {
                            await Firebase.FirebaseAuth.instance
                                .signInWithEmailAndPassword(
                                    email: oldEmail.value,
                                    password: password.value)
                                .then((value) {
                                  log("oldEmail ${oldEmail.value} new ${userInfo.value.email}");
                              if (oldEmail.value != updatedUser.email) {
                                log("updated email too");
                                value.user?.updateEmail(updatedUser.email!);
                              }
                            });

                            transaction.update(
                                usersCollection.doc(listUser.docs[0].id),
                                updatedUser.toFirestore());
                          }).then((value) {
                            oldEmail("");
                            password("");
                            getUserByUid();
                            Get.offAllNamed(mainPage);
                            Get.snackbar(
                                "Profile", "Profile berhasil diupdate");
                            log("Profile berhasil diupdate");
                          }, onError: (e) {
                            log("Firestore Update Failed $e");
                          });
                        }
                      }
                    } on Firebase.FirebaseAuthException catch (e) {
                      if (e.code == 'user-not-found') {
                        Get.snackbar("Maaf", "Email belum terdaftar");
                      } else if (e.code == 'wrong-password') {
                        Get.snackbar("Maaf", "Password anda salah");
                      }
                    } on Exception catch (e) {
                      Get.snackbar("Maaf", "$e");
                    }
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32),
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: colorAccent,
                      ),
                      child: Center(
                        child: Text(
                          'Save',
                          style: GoogleFonts.poppins(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  String? validateUser(User newUser) {
    isValid(false);
    if (newUser.nama == null ||
        newUser.nama?.isEmpty == true ||
        newUser.nama.isBlank == true) {
      return "Nama Tidak Boleh Kosong";
    }

    if (newUser.alamat == null ||
        newUser.alamat?.isEmpty == true ||
        newUser.alamat.isBlank == true) {
      return "Alamat Tidak Boleh Kosong";
    }

    if (newUser.nomor == null ||
        newUser.nomor?.isEmpty == true ||
        newUser.nomor.isBlank == true) {
      return "Nomor Tidak Boleh Kosong";
    }

    if (newUser.email == null ||
        newUser.email?.isEmpty == true ||
        newUser.email.isBlank == true ||
        !(newUser.email?.contains('@') == true)) {
      return "Format email tidak valid";
    }

    if (newUser.nama != null ||
        newUser.nama?.isEmpty == false ||
        newUser.nama.isBlank == false ||
        newUser.alamat != null ||
        newUser.alamat?.isEmpty == false ||
        newUser.alamat.isBlank == false ||
        newUser.nomor != null ||
        newUser.nomor?.isEmpty == false ||
        newUser.nomor.isBlank == false ||
        newUser.email != null ||
        newUser.email?.isEmpty == false ||
        newUser.email.isBlank == false ||
        newUser.email?.contains('@') == true) {
      isValid(true);
      return null;
    }
  }

  Future<void> getUserByUid() async {
    await usersCollection
        .where("uid", isEqualTo: userInfo.value.uid)
        .get()
        .then((value) {
      if (value.size > 0) {
        var userData = value.docs.first;
        session.updateUserData(User.fromJson(userData));
      }
    });
  }

  Future<void> logout() async {
    await Firebase.FirebaseAuth.instance.signOut();
    session.remove();
    Get.offAndToNamed(loginPage);
  }
}
