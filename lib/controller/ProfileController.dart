
import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart' as Firebase;
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:mountain_guide_app/RouteStates.dart';

import '../data/Session.dart';
import '../data/model/User.dart';

class ProfileController extends GetxController {
  Session session = Get.find();
  var userInfo = User().obs;

  Future<void> setUserInfo() async {
    var nama = await session.readUserNama();
    var alamat = await session.readUserAlamat();
    var uid = await session.readUserUid();
    var email = await session.readUserEmail();
    var nomor = await session.readUserNomor();

    userInfo(userInfo.value.copyWith(nama: nama, alamat: alamat, uid: uid, email: email, nomor: nomor));
    log("USER info ${userInfo.value}");
  }

  Future<void> logout() async {
    await Firebase.FirebaseAuth.instance.signOut();
    session.remove();
    Get.offAndToNamed(loginPage);
  }
}