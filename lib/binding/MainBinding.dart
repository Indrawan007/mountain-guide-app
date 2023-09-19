

import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:mountain_guide_app/controller/LoginController.dart';
import 'package:mountain_guide_app/controller/MainController.dart';
import 'package:mountain_guide_app/controller/SignUpController.dart';

class MainBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SignUpController>(()=>SignUpController());
    Get.lazyPut<LoginController>(()=>LoginController());
    Get.lazyPut<MainController>(()=>MainController());
  }

}