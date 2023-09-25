
import 'dart:developer';

import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:mountain_guide_app/data/model/User.dart';

import '../data/Session.dart';

class HomeController extends GetxController {
  Session session = Get.find();
  var userInfo = User().obs;
  var indexTabPages = 0.obs;
  var indexMenu = 0.obs;

  // FirebaseAuth.instance.userChanges().listen((User? user) {
  // if (user == null) {
  // } else {
  // FirebaseFirestore.instance
  //     .collection('users')
  //     .where('uid', isEqualTo: user.uid)
  //     .get()
  //     .then((QuerySnapshot querySnapshot) {
  // querySnapshot.docs.forEach((doc) {
  // setState(() {
  // data = doc;
  // });
  // });
  // });
  // }
  // });

  Future<void> setUserInfo() async {
    var nama = await session.readUserNama();
    var alamat = await session.readUserAlamat();
    var uid = await session.readUserUid();
    var email = await session.readUserEmail();

    userInfo(userInfo.value.copyWith(nama: nama, alamat: alamat, uid: uid, email: email));

    if(nama != null){
      nama = nama.trim();
      if(nama.split(" ").length > 1){
        nama = nama.split(" ")[0];
        userInfo(userInfo.value.copyWith(nama: nama));
      }
    }

    log("USER info ${userInfo.value}");
  }
}