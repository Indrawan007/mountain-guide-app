
import 'package:get/get.dart';
import '../data/model/User.dart';

class SignUpController extends GetxController {
  final user = User().obs;
  final showPassword = false.obs;
  final showConfirmPassword = false.obs;

  updateUser(User newUser){
    user(newUser);
  }

  funShowPassword(bool value){
    showPassword(value);
  }

  funShowConfirmPassword(bool value){
    showConfirmPassword(value);
  }

}