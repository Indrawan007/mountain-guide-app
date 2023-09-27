import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/cupertino.dart';
import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/cupertino.dart';
import 'package:mountain_guide_app/RouteStates.dart';

class CardMountain extends StatelessWidget {
  String imageUrl;
  String mountainName;
  String mountainMdpl;

  CardMountain(
      {required this.imageUrl,
      required this.mountainName,
      required this.mountainMdpl});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GestureDetector(
        onTap: () => Get.toNamed(detailMountainPage),
        child: Stack(
          alignment: Alignment.center,
            children: [
          Container(
            width: 300,
            height: 224,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              image: DecorationImage(
                image: AssetImage(
                  imageUrl,
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
              Positioned(
                top: 175,
                left: 0,
                child: BlurryContainer(
                  width: 300,
                  height: 50,
                  blur: 2,
                  color: Colors.white.withOpacity(0.6),
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(12),
                      bottomLeft: Radius.circular(12)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        mountainName,
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        mountainMdpl,
                        style: GoogleFonts.poppins(
                          fontSize: 10,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              )
        ]),
      ),
    );
  }
}
