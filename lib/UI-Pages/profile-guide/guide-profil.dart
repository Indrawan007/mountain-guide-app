import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:mountain_guide_app/UI-Pages/Detail-book/detail-book.dart';
import 'package:mountain_guide_app/components/card-name.dart';
import 'package:mountain_guide_app/widget/custom-widget.dart';

class GuideProfile extends StatelessWidget {
  CustomWidget customWidget = CustomWidget();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffEFF1F3),
      body: SingleChildScrollView(
        child: Column(
          children: [
            AppBar(
              leading: Padding(
                padding: const EdgeInsets.only(
                  bottom: 60,
                  left: 15,
                ),
                child: IconButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (context, animation1, animation2) =>
                            DetailBook(),
                        transitionDuration: Duration(seconds: 0),
                      ),
                    );
                  },
                  icon: Icon(
                    Icons.arrow_back,
                    color: Colors.black,
                  ),
                ),
              ),
              elevation: 0.5,
              toolbarHeight: 100,
              backgroundColor: Colors.white,
              flexibleSpace: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 55,
                      left: 145,
                    ),
                    child: Row(
                      children: [
                        Container(
                          child: Text(
                            'Tour Guide',
                            style: GoogleFonts.poppins(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 24,
                          top: 30,
                        ),
                        child: Container(
                          child: Image.asset(
                            'assets/images/avatar.png',
                            width: 70,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 20,
                          top: 30,
                        ),
                        child: Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              customWidget.textcustom(
                                'Risaldi M',
                              ),
                              customWidget.textcustom(
                                '(800Km)',
                                size: 12,
                              ),
                              SizedBox(height: 5),
                              customWidget.customButton(
                                text: 'View Profile',
                                tinggi: 20,
                                lebar: 85,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
            SizedBox(height: 30),
            CardName(TittleName: 'Nama', name: 'Muh Akbar'),
            SizedBox(height: 24),
            CardName(TittleName: 'Alamat', name: 'Muh Akbar'),
            SizedBox(height: 24),
            CardName(TittleName: 'Nomor Telp', name: 'Muh Akbar'),
            SizedBox(height: 24),
            CardName(TittleName: 'Usia', name: 'Muh Akbar'),
          ],
        ),
      ),
    );
  }
}
