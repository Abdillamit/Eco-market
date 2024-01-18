import 'package:eco_market/ui/button.dart';
import 'package:eco_market/utils/constants/image_strings.dart';
import 'package:eco_market/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';

class NetworkConnection extends StatelessWidget {
  const NetworkConnection({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
      width: 343.0,
      height: 458.0,
      padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 0.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: Colors.white,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(AImages.networkError),
          const SizedBox(height: 16),
          const Text(
            'Отсутствует интернет  соединение',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color(0xFF1F1F1F),
              fontFamily: 'TT Norms Pro',
              fontSize: 24.0,
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w700,
              height: 1.0,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'Попробуйте подключить мобильный интернет',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color(0xFFACABAD),
              fontFamily: 'TT Norms Pro',
              fontSize: 18.0,
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w400,
              height: 1.0,
            ),
          ),
          const SizedBox(height: 24),
          SizedBox(
            width: 311,
            height: 54,
            child: CustomButton(
              onPressed: () {},
              buttonText: ATexts.appBarTitle,
            ),
          ),
        ],
      ),
    ));
  }
}
