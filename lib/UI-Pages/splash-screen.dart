import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mountain_guide_app/UI-Pages/Login-pages/loginpage.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              'assets/images/bg-images.jpg',
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(
            top: 400,
          ),
          child: Container(
            width: 393,
            height: 400,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(
                left: 24,
                top: 48,
              ),
              child: Column(
                children: [
                  Text(
                    'Mountain Guide\nApp is waiting \nfor you.',
                    style: GoogleFonts.poppins(
                      fontSize: 32,
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 40),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => LoginPage()),
                      );
                    },
                    child: Icon(
                      Icons.arrow_right,
                      color: Colors.white,
                      size: 40,
                    ),
                    style: ElevatedButton.styleFrom(
                      shape: CircleBorder(), //<-- SEE HERE
                      padding: EdgeInsets.all(20),
                      primary: Color(0xFFFFB173),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
