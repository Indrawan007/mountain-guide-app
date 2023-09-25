import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/state_manager.dart';
import 'package:mountain_guide_app/RouteStates.dart';
import 'package:mountain_guide_app/UI-Pages/Book-page/list-book.dart';
import 'package:mountain_guide_app/UI-Pages/HomePage/HomePage.dart';
import 'package:mountain_guide_app/UI-Pages/HomePage/Trip-page/trip-Page.dart';
import 'package:mountain_guide_app/UI-Pages/Login-pages/loginpage.dart';
import 'package:mountain_guide_app/UI-Pages/Login-pages/signup.dart';
import 'package:mountain_guide_app/UI-Pages/Profil-page/EditProfile.dart';
import 'package:mountain_guide_app/UI-Pages/Profil-page/profil.dart';
import 'package:mountain_guide_app/UI-Pages/main-page.dart';
import 'package:mountain_guide_app/controller/MainController.dart';
import 'package:mountain_guide_app/data/Session.dart';
import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'binding/MainBinding.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(mountainguide());
}

class mountainguide extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final mainController = Get.put(MainController());
    mainController.checkUser();

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: MainBinding(),
      initialRoute: mainController.isAuthenticated.value ? mainPage : loginPage,
      getPages: [
        GetPage(name: homePage, page: () => HomePage(), binding: MainBinding()),
        GetPage(name: mainPage, page: () => MainPage(), binding: MainBinding()),
        GetPage(name: loginPage, page: () => LoginPage(), binding: MainBinding()),
        GetPage(name: signUpPage, page: () => SignUp(), binding: MainBinding()),
        GetPage(name: profilePage, page: () => ProfilPage(), binding: MainBinding()),
        GetPage(name: listbookPage, page: () => ListBook(), binding: MainBinding()),
        GetPage(name: editProfile, page: () => EditProfile(), binding: MainBinding()),
        GetPage(name: tripPage, page: () => TripPage(), binding: MainBinding()),
      ],
    );
  }
}