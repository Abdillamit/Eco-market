import 'package:eco_market/features/views/basket/widgets/card.dart';
import 'package:eco_market/modules/products_list.dart';
import 'package:eco_market/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';

class Basket extends StatelessWidget {
  const Basket({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          ATexts.appBarTitleBasketTitle,
          style: TextStyle(
            fontFamily: 'TTNormsPro',
            fontSize: 18.0,
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w500,
            height: 1.0,
          ),
        ),
        leading: const Center(
          child: SizedBox(
            width: 1000,
            height: 18,
            child: Text(
              'Очистить',
              style: TextStyle(
                color: Color(0xFFED2929),
                fontFamily: 'TTNormsPro',
                fontSize: 18.0,
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.w500,
                height: 1.0,
              ),
            ),
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: CardBasket(),
      ),
    );
  }
}
