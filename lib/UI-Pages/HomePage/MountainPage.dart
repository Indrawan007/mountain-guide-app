import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mountain_guide_app/controller/HomeController.dart';

import '../../components/card-mountain.dart';

class MountainPage extends StatelessWidget {
  const MountainPage({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.find();
    homeController.getAllMountains();

    return Obx(
      () => GridView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 300,
          childAspectRatio: 3/2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 12,
          mainAxisExtent: 224,
        ),
        itemCount: homeController.listMountains.length,
        itemBuilder: (context, index) {
          return CardMountain(
            imageUrl: 'assets/images/image2.png',
            mountainName: homeController.listMountains[index].nama ?? "",
            mountainMdpl: homeController.listMountains[index].tinggi ?? "",
          );
        },
      )
    );
  }
}
