import 'package:alquran_app/app/constant/color.dart';
import 'package:alquran_app/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../controllers/introduction_controller.dart';

class IntroductionView extends GetView<IntroductionController> {
  const IntroductionView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Al-Quran Apps",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 40,
              ),
              child: Text(
                "sesibuk itukan kamu sampai belum membaca Al-Quran?",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Container(
              width: 320,
              height: 320,
              child: Lottie.asset("assets/lotties/animasi-quran.json"),
            ),
            SizedBox(
              height: 35,
            ),
            ElevatedButton(
              onPressed: () => Get.offAllNamed(Routes.HOME),
              child: Text(
                "GET STARTED",
                style: TextStyle(
                  color: Get.isDarkMode ? appPurpleDark : appWhite,
                  fontSize: 15,
                ),
              ),
              style: ElevatedButton.styleFrom(
                primary: Get.isDarkMode ? appWhite : appPurpleDark,
                padding: EdgeInsets.symmetric(
                  horizontal: 50,
                  vertical: 18,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
