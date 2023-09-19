import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/cupertino.dart';
import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:mountain_guide_app/UI-Pages/Homa-page/HomePage.dart';
import 'package:mountain_guide_app/components/guide-card.dart';

class MountDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffEFF1F3),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 24, right: 24),
                    child: Container(
                      width: 365,
                      height: 530,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                          image: AssetImage('assets/images/image4.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              right: 280,
                              top: 30,
                            ),
                            child: InkWell(
                              onTap: () {
                                Navigator.pushReplacement(
                                  context,
                                  PageRouteBuilder(
                                    pageBuilder:
                                        (context, animation1, animation2) =>
                                            HomePage(),
                                    transitionDuration: Duration(seconds: 0),
                                  ),
                                );
                              },
                              child: Icon(
                                Icons.arrow_back,
                                size: 30,
                              ),
                            ),
                          ),
                          SizedBox(height: 370),
                          BlurryContainer(
                            width: 305,
                            height: 78,
                            blur: 2,
                            color: Colors.white.withOpacity(0.3),
                            borderRadius: BorderRadius.circular(12),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                    left: 10,
                                    right: 10,
                                    top: 10,
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Gunung Bawakaraeng',
                                        style: GoogleFonts.poppins(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w700,
                                          color: Colors.white,
                                        ),
                                      ),
                                      Text(
                                        'IDR. 300.000 / Day',
                                        style: GoogleFonts.poppins(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w700,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    left: 10,
                                    right: 10,
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        '1080 Mdpl',
                                        style: GoogleFonts.poppins(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.white,
                                        ),
                                      ),
                                      Text(
                                        'Max 3 Days',
                                        style: GoogleFonts.poppins(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 24,
                  top: 14,
                ),
                child: Row(
                  children: [
                    Text(
                      'Gunung Bawakaraeng',
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 24),
                child: Row(
                  children: [
                    Image.asset(
                      'assets/images/maps-vector.png',
                      width: 13,
                    ),
                    Text(
                      'Lembanna, Sulawesi Selatan',
                      style: GoogleFonts.poppins(
                        fontSize: 10,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 24,
                  top: 24,
                ),
                child: Row(
                  children: [
                    Text(
                      'Details',
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 24,
                  right: 24,
                  top: 14,
                ),
                child: Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nisi aliquet id id lacus orci, nibh enim, nunc id. Eu, in et felis quisque integer posuere. Pellentesque nulla pretium lacus, ut leo. Id eget mi, condimentum leo. Amet lectus diam lectus platea. Maecenas ornare sagittis tempor congue vitae volutpat leo. Sem cursus non metus, velit enim pharetra, convallis rutrum.',
                  textAlign: TextAlign.left,
                  style: GoogleFonts.poppins(
                    color: Colors.black.withOpacity(0.8),
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              SizedBox(height: 24),
              Padding(
                padding: const EdgeInsets.only(
                  left: 24,
                  right: 24,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Tour Guide Avaliable',
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 18),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 24,
                    right: 24,
                  ),
                  child: Row(
                    children: [
                      GuideCard(
                          imageGuide: 'assets/images/avatar.png',
                          guideName: 'Risaldi M',
                          rangeGuide: '(800Km)',
                          profileName: 'View Profile'),
                      SizedBox(width: 16),
                      GuideCard(
                          imageGuide: 'assets/images/avatar.png',
                          guideName: 'Risaldi M',
                          rangeGuide: '(800Km)',
                          profileName: 'View Profile'),
                      SizedBox(width: 16),
                      GuideCard(
                          imageGuide: 'assets/images/avatar.png',
                          guideName: 'Risaldi M',
                          rangeGuide: '(800Km)',
                          profileName: 'View Profile'),
                      SizedBox(width: 16),
                      GuideCard(
                          imageGuide: 'assets/images/avatar.png',
                          guideName: 'Risaldi M',
                          rangeGuide: '(800Km)',
                          profileName: 'View Profile'),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
