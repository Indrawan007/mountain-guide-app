import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebaseUser;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../RouteStates.dart';
import '../data/Session.dart';
import '../data/model/Mountain.dart';
import '../data/model/User.dart';

class SignUpController extends GetxController {
  final user = User().obs;
  final mountain = Mountain().obs;
  final showPassword = true.obs;
  final showConfirmPassword = true.obs;
  Session session = Get.find();
  final isValid = false.obs;
  CollectionReference users = FirebaseFirestore.instance.collection('users');
  CollectionReference mountains = FirebaseFirestore.instance.collection('mountains');

  updateUser(User newUser) {
    user(newUser);
  }

  updateMountain(Mountain mountain){
    this.mountain(mountain.copyWith(image: ""));
  }

  String? validateMountain(Mountain mountain){
    isValid(false);
    if(mountain.nama == null || mountain.nama?.isEmpty== true || mountain.nama.isBlank == true){
      return "Nama Tidak Boleh Kosong";
    }

    if(mountain.lokasi == null || mountain.lokasi?.isEmpty== true || mountain.lokasi.isBlank == true){
      return "Alamat Tidak Boleh Kosong";
    }

    if(mountain.ket == null || mountain.ket?.isEmpty== true || mountain.ket.isBlank == true){
      return "Nomor Tidak Boleh Kosong";
    }

    if(mountain.tinggi == null || mountain.tinggi?.isEmpty== true || mountain.tinggi.isBlank == true ){
      return "Format tinggi  Boleh Kosong";
    }

    if(
    mountain.nama != null || mountain.nama?.isEmpty== false || mountain.nama.isBlank == false ||
        mountain.lokasi != null || mountain.lokasi?.isEmpty== false || mountain.lokasi.isBlank == false ||
        mountain.ket != null || mountain.ket?.isEmpty== false || mountain.ket.isBlank == false ||
        mountain.tinggi != null || mountain.tinggi?.isEmpty== false || mountain.tinggi.isBlank == false
    ){
      isValid(true);
      return null;
    }
  }

  String? validateUser(User newUser){
    isValid(false);
    if(newUser.nama == null || newUser.nama?.isEmpty== true || newUser.nama.isBlank == true){
      return "Nama Tidak Boleh Kosong";
    }

    if(newUser.alamat == null || newUser.alamat?.isEmpty== true || newUser.alamat.isBlank == true){
      return "Alamat Tidak Boleh Kosong";
    }

    if(newUser.nomor == null || newUser.nomor?.isEmpty== true || newUser.nomor.isBlank == true){
      return "Nomor Tidak Boleh Kosong";
    }

    if(newUser.email == null || newUser.email?.isEmpty== true || newUser.email.isBlank == true || !(newUser.email?.contains('@') == true) ){
      return "Format email tidak valid";
    }

    if(newUser.password == null || newUser.password?.isEmpty== true || newUser.password.isBlank == true || newUser.password!.length <= 6){
      return "Password tidak valid";
    }

    if(newUser.password != newUser.confirmPassword){
      return "Confirm password tidak valid";
    }

    if(
      newUser.nama != null || newUser.nama?.isEmpty== false || newUser.nama.isBlank == false ||
      newUser.alamat != null || newUser.alamat?.isEmpty== false || newUser.alamat.isBlank == false ||
      newUser.nomor != null || newUser.nomor?.isEmpty== false || newUser.nomor.isBlank == false ||
      newUser.email != null || newUser.email?.isEmpty== false || newUser.email.isBlank == false || newUser.email?.contains('@') == true ||
      newUser.password != null || newUser.password?.isEmpty== false || newUser.password.isBlank == false || newUser.password!.length >= 6 ||
      newUser.password == newUser.confirmPassword
    ){
      isValid(true);
      return null;
    }
  }

  Future<void> registerMountain() async {
    String message = "";
    var validatorInput = validateMountain(mountain.value.copyWith());

    if(isValid.value == true){
      try {
        await mountains.add(mountain.value.toFirestore());
        message = "Data berhasil ditambahkan";
        Get.snackbar('${mountain.value.nama}', message);
        // Get.back();
      } catch(e){
        Get.snackbar('Maaf', "$e");
      }
    }
    if(validatorInput != null){
      Get.snackbar('Maaf', "$validatorInput");
    }
  }

  Future<void> signUp({bool asGuider = false})async {
    String message = "";
    var validatorResponse = validateUser(user.value.copyWith());

    if (isValid.value == true) {
      try {
        final credential = await firebaseUser.FirebaseAuth.instance
            .createUserWithEmailAndPassword(
          email: user.value.email ?? "",
          password: user.value.password ?? "",
        );
        try {
          await users.add({
            'nama': user.value.nama,
            'alamat': user.value.alamat,
            'nomor': user.value.nomor,
            'role': asGuider==true ? 'guider' : 'customer',
            'email': credential.user?.email ??"",
            'uid': credential.user?.uid?? "",
            'createdAt' : DateTime.now()
          });
          message = "Berhasil daftar akun, Silahkan login";
          // Get.offAndToNamed(homePage);

          if(asGuider != true){
            users.where("uid",
                isEqualTo: credential.user?.uid)
                .get()
                .then((value) {
              if (value.size > 0) {
                var userData = value.docs.first;
                session.updateUserData(User.fromJson(userData));
                isValid(false);
                Get.offAndToNamed(mainPage);
              }
            });
          } else {
            Get.snackbar("Tour Guider", "Berhasil Terdaftar");
          }
        } catch (e) {
          print(e);
          message = "Gagal daftar akun anda";
        }
      } on firebaseUser.FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          message = "Password anda lemah";
        } else if (e.code == 'email-already-in-use') {
          message = "Email telah digunakan";
        } else if (e.code == 'invalid-email') {
          message = "Email tidak Valid";
        }
        Get.snackbar('Maaf', message);
      } catch (e) {
        print(e);
        Get.snackbar('Maaf', "$e");
      }
    } else {
      Get.snackbar('Maaf', '$validatorResponse');
    }
  }
}
