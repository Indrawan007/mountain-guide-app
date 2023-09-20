
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:mountain_guide_app/data/model/User.dart';

class LoginController extends GetxController {
    final user = User().obs;
    final showPassword = false.obs;

}

enum MainState {
  Loading, Loaded, Error
}