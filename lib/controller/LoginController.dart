
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebaseAuth;
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:mountain_guide_app/data/model/User.dart';

import '../RouteStates.dart';
import '../data/Session.dart';

class LoginController extends GetxController {
    final user = User().obs;
    final showPassword = true.obs;
    Session session = Get.find();
    CollectionReference usersCollection = FirebaseFirestore.instance.collection('users');

    Future<void> login() async {
      if (user.value.email != null &&
          user.value.password != null &&
          user.value.email?.isNotEmpty ==
              true &&
          user.value.password?.isNotEmpty ==
              true) {
        try {
          var userCredential = await firebaseAuth.FirebaseAuth.instance
              .signInWithEmailAndPassword(
            email: user.value.email!,
            password: user.value.password!,
          );

          log("USER $userCredential");
          // userCredential.user?.uid;
          usersCollection
              .where("uid",
              isEqualTo: userCredential.user?.uid)
              .get()
              .then((value) {
            if (value.size > 0) {
              var userData = value.docs.first;
              session.updateUserData(User.fromJson(userData));
              Get.offAndToNamed(mainPage);
            }
          });
        } on firebaseAuth.FirebaseAuthException catch (e) {
          if (e.code == 'user-not-found') {
            Get.snackbar("Maaf", "Email belum terdaftar");
          } else if (e.code == 'wrong-password') {
            Get.snackbar("Maaf", "Password anda salah");
          }
        }
      }
    }
}

enum MainState {
  Loading, Loaded, Error
}