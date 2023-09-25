
import 'package:get/get.dart';

class Validator {
  Validator._();

  static String? emailValidator({String? value = ""}) {
    if (value?.isEmpty == true || (value != null && !(value.contains('@') == true))) {
      return 'Please enter a valid email address.';
    }
    return null;
  }

  static String? userNameValidator({String? value = ""}) {
    if (value?.isEmpty == true || value!.length < 4) {
      return 'Password must be at least 4 characters long.';
    }
    return null;
  }

  static String? isNotEmpty({String? value = ""}) {
    if ( value?.isEmpty == true ||
        value?.isBlank == true) {
      return 'Tidak Boleh Kosong';
    }
    return null;
  }

  static String? passwordValidator({String? value = ""}) {
    if (value != null) {
      if(value.isEmpty == true || value.length < 7){
        return 'Password must be at least 7 characters long.';
      }
    }
    return null;
  }
}