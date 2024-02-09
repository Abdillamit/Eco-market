import 'package:eco_market/ui/button.dart';
import 'package:eco_market/utils/constants/image_strings.dart';
import 'package:eco_market/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';

class Modal extends StatelessWidget {
  const Modal({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        padding:
            const EdgeInsets.only(left: 16, right: 16, top: 24, bottom: 24),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              AImages.basketModal,
              height: 224,
            ),
            const SizedBox(height: 24),
            const Text(
              ATexts.basketModalText,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                textBaseline: TextBaseline.ideographic,
                fontFamily: 'TTNormsPro',
                fontSize: 20.0,
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.w700,
                height: 1.0,
              ),
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              height: 54,
              child: CustomButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                buttonText: ATexts.basketModalButtonText,
              ),
            )
          ],
        ),
      ),
    );
  }
}
