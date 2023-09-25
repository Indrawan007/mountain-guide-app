import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../data/Session.dart';

class MainController extends GetxController {
  var isAuthenticated = false.obs;
  var indexMenu = 0.obs;

  checkUser() {
    var currentUser = FirebaseAuth.instance.currentUser;
    if(currentUser != null){
      isAuthenticated.value = true;
    } else {
      isAuthenticated.value = false;
    }
  }
}
