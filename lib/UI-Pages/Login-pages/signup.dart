import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mountain_guide_app/UI-Pages/Login-pages/loginpage.dart';

import '../Homa-page/home.dart';

class SignUp extends StatefulWidget {
  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  CollectionReference users = FirebaseFirestore.instance.collection('users');

  TextEditingController nama = TextEditingController();

  TextEditingController alamat = TextEditingController();

  TextEditingController nomor = TextEditingController();

  TextEditingController email = TextEditingController();

  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double height = MediaQueryData.fromView(WidgetsBinding.instance.window).size.height;
    return Scaffold(
      backgroundColor: Color(0xffE5E5E5),
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints.tightFor(
            height: height,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 16),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    spreadRadius: 1,
                    blurRadius: 2,
                  )
                ],
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 30,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(builder: (context) => LoginPage()),
                            );
                          },
                          child: Text(
                            'Sign In',
                            style: GoogleFonts.poppins(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Colors.black.withOpacity(0.5),
                            ),
                          ),
                        ),
                        SizedBox(width: 35),
                        Text(
                          'Sign Up',
                          style: GoogleFonts.poppins(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Nama',
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: 8),
                      Container(
                        width: 295,
                        height: 42,
                        child: TextFormField(
                          controller: nama,
                          cursorColor: Colors.black,
                          style: GoogleFonts.poppins(
                            color: Color(0xFF000000),
                          ),
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.only(
                                left: 20,
                                top: 15,
                              ),
                              fillColor: Color(0xFFF2F5FB),
                              filled: true,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide.none,
                              ),
                              hintText: 'Nama',
                              hintStyle: GoogleFonts.poppins(
                                color: Color(0xFFCFCFCF),
                              )),
                        ),
                      ),
                      SizedBox(height: 24),
                      Text(
                        'Alamat',
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: 8),
                      Container(
                        width: 295,
                        height: 42,
                        child: TextFormField(
                          controller: alamat,
                          cursorColor: Colors.black,
                          style: GoogleFonts.poppins(
                            color: Color(0xFF000000),
                          ),
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.only(
                                left: 20,
                                top: 15,
                              ),
                              fillColor: Color(0xFFF2F5FB),
                              filled: true,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide.none,
                              ),
                              hintText: 'Alamat',
                              hintStyle: GoogleFonts.poppins(
                                color: Color(0xFFCFCFCF),
                              )),
                        ),
                      ),
                      SizedBox(height: 24),
                      Text(
                        'Nomor Telp',
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: 8),
                      Container(
                        width: 295,
                        height: 42,
                        child: TextFormField(
                          controller: nomor,
                          cursorColor: Colors.black,
                          style: GoogleFonts.poppins(
                            color: Color(0xFF000000),
                          ),
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.only(
                                left: 20,
                                top: 15,
                              ),
                              fillColor: Color(0xFFF2F5FB),
                              filled: true,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide.none,
                              ),
                              hintText: 'Nomor Telp',
                              hintStyle: GoogleFonts.poppins(
                                color: Color(0xFFCFCFCF),
                              )),
                        ),
                      ),
                      SizedBox(height: 24),
                      Text(
                        'Email',
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: 8),
                      Container(
                        width: 295,
                        height: 42,
                        child: TextFormField(
                          controller: email,
                          cursorColor: Colors.black,
                          style: GoogleFonts.poppins(
                            color: Color(0xFF000000),
                          ),
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.only(
                                left: 20,
                                top: 15,
                              ),
                              fillColor: Color(0xFFF2F5FB),
                              filled: true,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide.none,
                              ),
                              hintText: 'Email',
                              hintStyle: GoogleFonts.poppins(
                                color: Color(0xFFCFCFCF),
                              )),
                        ),
                      ),
                      SizedBox(height: 24),
                      Text(
                        'Password',
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: 8),
                      Container(
                        width: 295,
                        height: 42,
                        child: TextFormField(
                          controller: password,
                          cursorColor: Colors.black,
                          obscureText: true,
                          style: GoogleFonts.poppins(
                            color: Color(0xFF000000),
                          ),
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.only(
                                left: 20,
                                top: 15,
                              ),
                              fillColor: Color(0xFFF2F5FB),
                              filled: true,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide.none,
                              ),
                              hintText: 'Password',
                              hintStyle: GoogleFonts.poppins(
                                color: Color(0xFFCFCFCF),
                              )),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 30),
                  InkWell(
                    onTap: () async {
                      String message = "";
                      bool isValid = false;
                      try {
                        final credential = await FirebaseAuth.instance
                            .createUserWithEmailAndPassword(
                          email: email.text,
                          password: password.text,
                        );
                        try {
                          await users.add({
                            'nama': nama.text,
                            'alamat': alamat.text,
                            'nomor': nomor.text,
                            'email': credential.user!.email,
                            'uid': credential.user!.uid,
                          });
                          isValid = true;
                          message = "Berhasil daftar akun, Silahkan login";
                        } catch (e) {
                          print(e);
                          message = "Gagal daftar akun anda";
                        }
                      } on FirebaseAuthException catch (e) {
                        if (e.code == 'weak-password') {
                          message = "Password anda lemah";
                        } else if (e.code == 'email-already-in-use') {
                          message = "Email telah digunakan";
                        } else if (e.code == 'invalid-email') {
                          message = "Email tidak Valid";
                        }

                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
                        if (isValid){
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Home()));
                        }
                      } catch (e) {
                        print(e);
                      }
                    },
                    child: Container(
                      width: 295,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Color(0xffFFB173),
                      ),
                      child: Center(
                        child: Text(
                          'Sign Up',
                          style: GoogleFonts.poppins(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Sudah punya akun?',
                        style: GoogleFonts.poppins(
                          fontSize: 11,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => LoginPage()),
                          );
                        },
                        child: Text(
                          'Login',
                          style: GoogleFonts.poppins(
                            fontSize: 11,
                            fontWeight: FontWeight.w600,
                            color: Color(0xff395995),
                          ),
                        ),
                      ),
                    ],
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
