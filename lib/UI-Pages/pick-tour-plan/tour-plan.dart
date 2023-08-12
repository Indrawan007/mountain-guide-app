import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/cupertino.dart';
import 'package:mountain_guide_app/UI-Pages/mount-detail/mount-details.dart';

import 'package:mountain_guide_app/widget/custom-widget.dart';

import '../../components/card-mountain.dart';

class TourPlan extends StatelessWidget {
  // Widget textcustom(
  //   String text, {
  //   FontWeight fontWeight = FontWeight.w600,
  //   double size = 16,
  //   Color warna = Colors.black,
  // }) {
  //   return Text(
  //     text,
  //     style: GoogleFonts.poppins(
  //       fontSize: size,
  //       fontWeight: fontWeight,
  //       color: warna,
  //     ),
  //   );
  // }

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
                            MountDetails(),
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
                            'Pick Tour Plan',
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
                  )
                ],
              ),
            ),
            SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.only(
                left: 24,
              ),
              child: Row(
                children: [
                  Text(
                    'Mountain Available',
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(
                left: 24,
                right: 20,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CardMountain(
                    imageUrl: 'assets/images/image1.png',
                    mountainName: 'Gunung Bawakaraeng',
                    mountainMdpl: '1080 Mdpl',
                  ),
                  CardMountain(
                    imageUrl: 'assets/images/image2.png',
                    mountainName: 'Gunung Lompobattang',
                    mountainMdpl: '1080 Mdpl',
                  ),
                ],
              ),
            ),
            SizedBox(height: 18),
            Padding(
              padding: const EdgeInsets.only(
                left: 24,
                right: 20,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CardMountain(
                    imageUrl: 'assets/images/image3.png',
                    mountainName: 'Gunung Lompobattang',
                    mountainMdpl: '1080 Mdpl',
                  ),
                  CardMountain(
                    imageUrl: 'assets/images/image4.png',
                    mountainName: 'Gunung Lompobattang',
                    mountainMdpl: '1080 Mdpl',
                  ),
                ],
              ),
            ),
            SizedBox(height: 18),
            Padding(
              padding: const EdgeInsets.only(
                left: 24,
                right: 20,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CardMountain(
                    imageUrl: 'assets/images/image5.png',
                    mountainName: 'Gunung Lompobattang',
                    mountainMdpl: '1080 Mdpl',
                  ),
                  CardMountain(
                    imageUrl: 'assets/images/image6.png',
                    mountainName: 'Gunung Lompobattang',
                    mountainMdpl: '1080 Mdpl',
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 80,
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            customWidget.customButton(
              text: 'Book Now',
              tinggi: 48,
              lebar: 292,
              radiusCircular: 14,
              sizeText: 18,
            ),
          ],
        ),
      ),
    );
  }
}
