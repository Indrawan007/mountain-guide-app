import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/cupertino.dart';
import 'package:mountain_guide_app/UI-Pages/Book-page/list-book.dart';
import 'package:mountain_guide_app/UI-Pages/Homa-page/HomePage.dart';
import 'package:mountain_guide_app/UI-Pages/Profil-page/profil.dart';
import 'package:mountain_guide_app/components/field-name.dart';

class EditProfil extends StatelessWidget {
  CollectionReference users = FirebaseFirestore.instance.collection('users');
  TextEditingController nama = TextEditingController();
  TextEditingController alamat = TextEditingController();
  TextEditingController nomor = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Future<void> updateUser() {
      return users
          .doc('ABC123')
          .update({
            'nama': nama,
            'alamat': alamat,
          })
          .then((value) => print("User Updated"))
          .catchError((error) => print("Failed to update user: $error"));
    }

    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  left: 24,
                  right: 145,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          PageRouteBuilder(
                            pageBuilder: (context, animation1, animation2) =>
                                ProfilPage(),
                            transitionDuration: Duration(seconds: 0),
                          ),
                        );
                      },
                      icon: Icon(Icons.arrow_back),
                      color: Colors.black,
                    ),
                    Text(
                      'Edit Profile',
                      style: GoogleFonts.poppins(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 30),
              Stack(
                children: [
                  Image.asset(
                    'assets/images/avatar.png',
                    width: 120,
                  ),
                  Positioned.fill(
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: Image.asset(
                        'assets/images/add_vector.png',
                        width: 40,
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(height: 48),
              FieldName(
                TittleName: 'Nama',
                name: 'aaa',
                controller: nama,
              ),
              SizedBox(height: 24),
              FieldName(
                TittleName: 'Alamat',
                name: 'aaa',
                controller: alamat,
              ),
              SizedBox(height: 24),
              FieldName(
                TittleName: 'Nomor Telp',
                name: 'aaa',
                controller: nomor,
              ),
              SizedBox(height: 24),
              FieldName(
                TittleName: 'Email',
                name: 'nama',
                controller: email,
              ),
              SizedBox(height: 35),
              InkWell(
                onTap: () async{
                  try{
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
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                content: Text(
                                    'Berhasil daftar akun anda, Silahkan login'),
                              ));
                            } catch (e) {
                              print(e);
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                content: Text('Gagal daftar akun anda'),
                              ));
                            }
                          } on FirebaseAuthException catch (e) {
                            if (e.code == 'weak-password') {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                content: Text('Password anda lemah'),
                              ));
                            } else if (e.code == 'email-already-in-use') {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                content: Text('Email telah digunakan'),
                              ));
                            } else if (e.code == 'invalid-email') {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                content: Text('Gunakan email yang benar'),
                              ));
                            }
                          } catch (e) {
                            print(e);
                          }
                },
                child: Container(
                  width: 292,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color(0xffFFB173),
                  ),
                  child: Center(
                    child: Text(
                      'Save',
                      style: GoogleFonts.poppins(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 18),
              Container(
                width: 292,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.red,
                ),
                child: Center(
                  child: Text(
                    'Delete',
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 18),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedLabelStyle: GoogleFonts.poppins(
          color: Colors.black,
          fontSize: 10,
          fontWeight: FontWeight.w500,
        ),
        unselectedLabelStyle: GoogleFonts.poppins(
          color: Color(0xFFCFCFCF),
          fontSize: 10,
          fontWeight: FontWeight.w500,
        ),
        selectedItemColor: Colors.black,
        unselectedItemColor: Color(0xFFCFCFCF),
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        currentIndex: 2,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.only(
                top: 18.0,
                bottom: 8,
              ),
              child: InkWell(
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (context, animation1, animation2) => HomePage(),
                      transitionDuration: Duration(seconds: 0),
                    ),
                  );
                },
                child: Image.asset(
                  'assets/images/nav_home.png',
                  width: 18.0,
                ),
              ),
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.only(
                top: 18.0,
                bottom: 8,
              ),
              child: InkWell(
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (context, animation1, animation2) =>
                          ListBook(),
                      transitionDuration: Duration(seconds: 0),
                    ),
                  );
                },
                child: Image.asset(
                  'assets/images/nav_book.png',
                  width: 20,
                ),
                // ),
              ),
            ),
            label: 'List Book',
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.only(
                top: 18.0,
                bottom: 8,
              ),
              child: Image.asset(
                'assets/images/nav_profile_on.png',
                width: 25,
              ),
            ),
            label: 'Profil',
          ),
        ],
      ),
    );
  }
}
