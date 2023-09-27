import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/cupertino.dart';
import 'package:mountain_guide_app/UI-Pages/mount-detail/DetailMountain.dart';

import 'package:mountain_guide_app/widget/custom-widget.dart';

import '../../components/card-mountain.dart';

enum QuestionsRequest { Yes, No }

class DetailBook extends StatefulWidget {
  @override
  State<DetailBook> createState() => _DetailBookState();
}

class _DetailBookState extends State<DetailBook> {
  CustomWidget customWidget = CustomWidget();
  int? _value = 1;

  QuestionsRequest? _request = QuestionsRequest.Yes;

  String valueMountain = "Gunung Lompobattang";

  var items = [
    "Gunung Bawakaraeng",
    "Gunung Lompobattang",
    "Gunung Everest",
    "Gunung Semeru"
  ];

  String valueDays = "3 Days";

  var itemsDays = [
    "1 Days",
    "2 Days",
    "3 Days",
  ];

  String valuePeoples = "3 Peoples";

  var itemsPeoples = [
    "1 Peoples",
    "2 Peoples",
    "3 Peoples",
  ];

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
                            DetailMountain(),
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
                            'Detail Book',
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
            Padding(
              padding: const EdgeInsets.only(
                left: 24,
                top: 30,
              ),
              child: Row(
                children: [
                  customWidget.textcustom(
                    'Pick Your Mount Plan',
                    size: 16,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 24,
                top: 14,
              ),
              child: Row(
                children: [
                  DropdownButton(
                    icon: Padding(
                      padding: const EdgeInsets.only(
                        left: 130,
                      ),
                      child: Image.asset(
                        'assets/images/Vector-arrow.png',
                        width: 14,
                        height: 7,
                      ),
                    ),
                    underline: Container(
                      height: 2,
                      color: Colors.black.withOpacity(0.6),
                    ),
                    value: valueMountain,
                    items: items.map((String items) {
                      return DropdownMenuItem(
                        child: Text(
                          items,
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.black.withOpacity(0.6),
                          ),
                        ),
                        value: items,
                      );
                    }).toList(),
                    onChanged: (String? value) {
                      setState(() {
                        valueMountain = value
                            as String; //Untuk memberitahu _valGender bahwa isi nya akan diubah sesuai dengan value yang kita pilih
                      });
                      print(valueMountain);
                    },
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
                  customWidget.textcustom(
                    'How Many Days ?',
                    size: 16,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 24,
                top: 14,
              ),
              child: Row(
                children: [
                  DropdownButton(
                    icon: Padding(
                      padding: const EdgeInsets.only(
                        left: 265,
                      ),
                      child: Image.asset(
                        'assets/images/Vector-arrow.png',
                        width: 14,
                        height: 7,
                      ),
                    ),
                    underline: Container(
                      height: 2,
                      color: Colors.black.withOpacity(0.6),
                    ),
                    value: valueDays,
                    items: itemsDays.map((String items) {
                      return DropdownMenuItem(
                        child: Text(
                          items,
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.black.withOpacity(0.6),
                          ),
                        ),
                        value: items,
                      );
                    }).toList(),
                    onChanged: (String? value) {
                      setState(() {
                        valueDays = value
                            as String; //Untuk memberitahu _valGender bahwa isi nya akan diubah sesuai dengan value yang kita pilih
                      });
                      print(valueDays);
                    },
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
                  customWidget.textcustom(
                    'How Many Peoples ?',
                    size: 16,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 24,
                top: 14,
              ),
              child: Row(
                children: [
                  DropdownButton(
                    icon: Padding(
                      padding: const EdgeInsets.only(
                        left: 240,
                      ),
                      child: Image.asset(
                        'assets/images/Vector-arrow.png',
                        width: 14,
                        height: 7,
                      ),
                    ),
                    underline: Container(
                      height: 2,
                      color: Colors.black.withOpacity(0.6),
                    ),
                    value: valuePeoples,
                    items: itemsPeoples.map((String items) {
                      return DropdownMenuItem(
                        child: Text(
                          items,
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.black.withOpacity(0.6),
                          ),
                        ),
                        value: items,
                      );
                    }).toList(),
                    onChanged: (String? value) {
                      setState(() {
                        valuePeoples = value
                            as String; //Untuk memberitahu _valGender bahwa isi nya akan diubah sesuai dengan value yang kita pilih
                      });
                      print(valuePeoples);
                    },
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
                  customWidget.textcustom(
                    'Did You Bring Your Equipment ?',
                    size: 16,
                  ),
                ],
              ),
            ),
            Column(
              children: [
                ListTile(
                  title: Text('Yes'),
                  leading: Radio<QuestionsRequest>(
                    value: QuestionsRequest.Yes,
                    groupValue: _request,
                    activeColor: Color(0xfff395995),
                    onChanged: (QuestionsRequest? value) {
                      setState(() {
                        _request = value;
                      });
                    },
                  ),
                ),
                ListTile(
                  title: Text('No'),
                  leading: Radio<QuestionsRequest>(
                    value: QuestionsRequest.No,
                    groupValue: _request,
                    onChanged: (QuestionsRequest? value) {
                      setState(() {
                        _request = value;
                      });
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 80,
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.only(
            right: 24,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  left: 24,
                  top: 10,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    customWidget.textcustom('Total',
                        size: 18, fontWeight: FontWeight.w600),
                    customWidget.textcustom('Rp 450.000,-',
                        size: 18,
                        fontWeight: FontWeight.w700,
                        warna: Color(0xfff395995)),
                  ],
                ),
              ),
              customWidget.customButton(
                text: 'Book Now',
                tinggi: 48,
                lebar: 141,
                radiusCircular: 14,
                sizeText: 14,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
