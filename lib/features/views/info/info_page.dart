import 'package:eco_market/ui/button.dart';
import 'package:eco_market/utils/constants/image_strings.dart';
import 'package:eco_market/utils/constants/text_strings.dart';
import 'package:iconsax/iconsax.dart';
import 'package:flutter/material.dart';

class Info extends StatelessWidget {
  const Info({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            ATexts.bottomTitle4,
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'TTNormsPro',
              fontSize: 18.0,
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w500,
              height: 1.0,
            ),
          ),
          centerTitle: true,
        ),
        extendBodyBehindAppBar: true,
        body: Column(children: [
          Image.asset(
            AImages.infoImg,
            width: double.infinity,
            height: 270,
            fit: BoxFit.cover,
          ),
          Container(
            padding: const EdgeInsets.only(right: 16, left: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 16),
                const Text(
                  ATexts.appBarTitle,
                  style: TextStyle(
                    fontFamily: 'TTNormsPro',
                    fontSize: 24.0,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w700,
                    height: 1.0,
                  ),
                ),
                const SizedBox(height: 8),
                const SizedBox(
                  width: 343,
                  child: Text(
                    ATexts.infoSubText,
                    style: TextStyle(
                      color: Color(0xFFACABAD),
                      fontFamily: 'TT Norms Pro',
                      fontSize: 16,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w400,
                      height: 1.0,
                    ),
                  ),
                ),
                const SizedBox(height: 33),
                CustomButton(
                  onPressed: () {},
                  buttonText: ATexts.infoButtonText1,
                  icon: Iconsax.call,
                  buttonColor: Colors.white,
                  textColor: Colors.black,
                ),
                const SizedBox(height: 12),
                CustomButton(
                  onPressed: () {},
                  buttonText: ATexts.infoButtonText2,
                  icon: Iconsax.call,
                  textColor: Colors.black,
                  buttonColor: Colors.white,
                ),
                const SizedBox(height: 12),
                CustomButton(
                  onPressed: () {},
                  buttonText: ATexts.infoButtonText3,
                  icon: Iconsax.instagram,
                  textColor: Colors.black,
                  buttonColor: Colors.white,
                ),
              ],
            ),
          )
        ]));
  }
}
