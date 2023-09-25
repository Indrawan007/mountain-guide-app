

import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:mountain_guide_app/controller/EditUserController.dart';
import 'package:mountain_guide_app/controller/LoginController.dart';
import 'package:mountain_guide_app/controller/MainController.dart';
import 'package:mountain_guide_app/controller/SignUpController.dart';

import '../controller/HomeController.dart';
import '../controller/ProfileController.dart';
import '../data/Session.dart';

class MainBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<Session>(Session());

    Get.lazyPut<LoginController>(() => LoginController());
    Get.lazyPut<EditUserController>(() => EditUserController());
    Get.lazyPut<SignUpController>(() => SignUpController());
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<ProfileController>(() => ProfileController());
    Get.lazyPut<MainController>(() => MainController());
  }

}