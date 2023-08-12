import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mountain_guide_app/UI-Pages/Homa-page/home.dart';
import 'package:mountain_guide_app/UI-Pages/Login-pages/loginpage.dart';
import 'package:mountain_guide_app/UI-Pages/Trip-page/trip-details.dart';
import 'package:mountain_guide_app/admin-guide/home-admin.dart';
import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(mountainguide());
}

class mountainguide extends StatefulWidget {
  @override
  State<mountainguide> createState() => _mountainguideState();
}

class _mountainguideState extends State<mountainguide> {
  bool isAuthenticated = false;
  @override
  Widget build(BuildContext context) {
    FirebaseAuth.instance.userChanges().listen((User? user) {
      if (user == null) {
        setState(() {
          isAuthenticated = false;
        });
      } else {
        setState(() {
          isAuthenticated = true;
        });
      }
    });
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: isAuthenticated ? HomeAdmin() : LoginPage(),
    );
  }
}
