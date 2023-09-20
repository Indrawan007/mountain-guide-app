import 'dart:developer';

import 'package:get/get.dart';
import '../data/model/User.dart';

class SignUpController extends GetxController {
  final user = User().obs;
  final showPassword = false.obs;
  final showConfirmPassword = false.obs;
  final isValid = false.obs;

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

  String? emailValidator({String? value = ""}) {
    if (value?.isEmpty == true || (value != null && !(value.contains('@') == true))) {
      return 'Please enter a valid email address.';
    }
    return null;
  }

  String? userNameValidator({String? value = ""}) {
    if (value?.isEmpty == true || value!.length < 4) {
      return 'Password must be at least 4 characters long.';
    }
    return null;
  }

  String? isNotEmpty({String? value = ""}) {
    if ( value?.isEmpty == true ||
        value.isBlank == true) {
      return 'Tidak Boleh Kosong';
    }
    return null;
  }

  String? passwordValidator({String? value = ""}) {
    if (value != null) {
      if(value.isEmpty == true || value!.length < 7){
        return 'Password must be at least 7 characters long.';
      }
    }
    return null;
  }
}
