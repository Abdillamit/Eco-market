import 'package:eco_market/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';

class Info extends StatelessWidget {
  const Info({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          ATexts.bottomTitle4,
          style: TextStyle(
            fontFamily: 'TTNormsPro',
            fontSize: 18.0,
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w500,
            height: 1.0,
          ),
        ),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(ATexts.bottomTitle4),
      ),
    );
  }
}
