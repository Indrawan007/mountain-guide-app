
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class LoginController extends GetxController {
    var state = MainState.Loading.obs;
    var nama = "".obs;
    var alamat = "".obs;
    var telphone = "".obs;
    var email = "".obs;
    var password = "".obs;

    signUp(){

    }
}

enum MainState {
  Loading, Loaded, Error
}