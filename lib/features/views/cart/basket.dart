import 'package:eco_market/features/views/cart/bloc/cart_bloc.dart';
import 'package:eco_market/features/views/cart/widgets/card.dart';
import 'package:eco_market/features/views/cart/widgets/modal.dart';
import 'package:eco_market/features/views/home/home_page.dart';
import 'package:eco_market/ui/button.dart';
import 'package:eco_market/utils/constants/image_strings.dart';
import 'package:eco_market/utils/constants/text_strings.dart';
import 'package:eco_market/utils/helpers/helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
        leadingWidth: 100,
        leading: SizedBox(
          height: 15,
          child: CustomButton(
            onPressed: () {},
            buttonColor: Colors.white,
            textColor: Colors.red,
            buttonText: 'Очистить',
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          BlocBuilder<CartBloc, CartState>(
            builder: (context, state) {
              if (state.cartItems.isEmpty) {
                return Center(
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.only(top: 100),
                        child: Column(
                          children: [
                            Image.asset(AImages.emptyBasket),
                            const SizedBox(height: 16),
                            const Text(
                              ATexts.basketEptyTitle,
                              style: TextStyle(
                                color: Color(0xFFACABAD),
                                fontFamily: 'Poppins',
                                fontSize: 17.6,
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w600,
                                letterSpacing: -0.168,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 250),
                      SizedBox(
                        width: 343,
                        height: 54,
                        child: CustomButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const Home(),
                              ),
                            );
                          },
                          buttonText: ATexts.basketButtonText2,
                        ),
                      )
                    ],
                  ),
                );
              } else {
                return Column(
                  children: [
                    CardBasket(cartItems: state.cartItems),
                    Container(
                      padding:
                          const EdgeInsets.only(right: 16, top: 20, left: 16),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Сумма',
                                style: TextStyle(
                                  color: Color.fromRGBO(172, 171, 173, 1),
                                  textBaseline: TextBaseline.ideographic,
                                  fontFamily: 'TTNormsPro',
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  height: 1.1875,
                                  letterSpacing: 0,
                                ),
                              ),
                              Text(
                                calculateTotalSum(state.cartItems),
                                style: const TextStyle(
                                  color: Colors.black,
                                  textBaseline: TextBaseline.ideographic,
                                  fontFamily: 'TTNormsPro',
                                  fontSize: 20.0,
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.w700,
                                  height: 1.0,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Доставка',
                                style: TextStyle(
                                  color: Color.fromRGBO(172, 171, 173, 1),
                                  textBaseline: TextBaseline.ideographic,
                                  fontFamily: 'TTNormsPro',
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  height: 1.1875,
                                  letterSpacing: 0,
                                ),
                              ),
                              Text(
                                '150 с',
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
                            ],
                          ),
                          const SizedBox(height: 8),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Итого',
                                style: TextStyle(
                                  color: Color.fromRGBO(172, 171, 173, 1),
                                  textBaseline: TextBaseline.ideographic,
                                  fontFamily: 'TTNormsPro',
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  height: 1.1875,
                                  letterSpacing: 0,
                                ),
                              ),
                              Text(
                                calculateTotalAmount(state.cartItems),
                                style: const TextStyle(
                                  color: Colors.black,
                                  textBaseline: TextBaseline.ideographic,
                                  fontFamily: 'TTNormsPro',
                                  fontSize: 20.0,
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.w700,
                                  height: 1.0,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 320),
                          SizedBox(
                            width: 343,
                            height: 54,
                            child: CustomButton(
                              onPressed: () {
                                showDialog(
                                    context: context,
                                    builder: (context) => const Modal());
                              },
                              buttonText: ATexts.basketButtonText,
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
