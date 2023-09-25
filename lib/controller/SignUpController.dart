import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebaseUser;
import 'package:get/get.dart';
import '../RouteStates.dart';
import '../data/model/User.dart';

class SignUpController extends GetxController {
  final user = User().obs;
  final showPassword = true.obs;
  final showConfirmPassword = true.obs;
  final isValid = false.obs;
  CollectionReference users = FirebaseFirestore.instance.collection('users');

  updateUser(User newUser) {
    user(newUser);
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

  Future<void> signUp()async {
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
            'email': credential.user?.email ??"",
            'uid': credential.user?.uid?? "",
          });
          message = "Berhasil daftar akun, Silahkan login";
          Get.offAndToNamed(homePage);
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
      }
    } else {
      Get.snackbar('Maaf', '$validatorResponse');
    }
  }
}
