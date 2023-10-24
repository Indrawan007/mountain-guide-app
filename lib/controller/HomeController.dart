import 'dart:developer';
import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:mountain_guide_app/data/model/Mountain.dart';
import 'package:mountain_guide_app/data/model/User.dart';

import '../data/Session.dart';

class HomeController extends GetxController {
  Session session = Get.find();
  final userInfo = User().obs;
  final indexTabPages = 0.obs;
  final indexMenu = 0.obs;
  final listMountains = <Mountain>[].obs;
  final listGuider = <User>[].obs;
  CollectionReference mountainRef =
      FirebaseFirestore.instance.collection('mountains');
  CollectionReference userRef = FirebaseFirestore.instance.collection('users');

  Future<void> setUserInfo() async {
    var nama = await session.readUserNama();
    var alamat = await session.readUserAlamat();
    var uid = await session.readUserUid();
    var email = await session.readUserEmail();
    var role = await session.readUserRole();

    userInfo(userInfo.value.copyWith(
        nama: nama, alamat: alamat, uid: uid, email: email, role: role));

    if (nama != null) {
      nama = nama.trim();
      if (nama.split(" ").length > 1) {
        nama = nama.split(" ")[0];
        userInfo(userInfo.value.copyWith(nama: nama));
      }
    }

    log("USER info ${userInfo.value}");
  }

  Future<void> getAllMountains() async {
    listMountains.clear();
    mountainRef.get().then((value) {
      for (var jsonMountain in value.docs) {
        var mountain = Mountain.fromJson(jsonMountain);
        log("getAllMountains ${mountain.id}");
        listMountains.add(mountain);
      }
    }, onError: (e) {
      Get.snackbar("Error", "$e");
      log("Error getAllMountains $e");
    });
  }

  Future<void> getAllGuiders() async {
    listGuider.clear();
    userRef.where("role", isEqualTo: "guider").get().then((value) {
      for (var jsonUser in value.docs) {
        var userData = User.fromJson(jsonUser);
        log("getAllGuider ${userData.uid}");
        listGuider.add(userData);
      }
    }, onError: (e) {
      Get.snackbar("Error", "$e");
      log("Error getAllGuider $e");
    });
  }
}
