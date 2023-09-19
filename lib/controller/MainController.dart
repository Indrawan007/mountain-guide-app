

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class MainController extends GetxController {
  var isAuthenticated = false.obs;

  checkUser () {
    FirebaseAuth.instance.userChanges().listen((event) {
      if(event == null){
        isAuthenticated.value = false;
      } else {
        isAuthenticated.value = true;
      }
    });
  }
}