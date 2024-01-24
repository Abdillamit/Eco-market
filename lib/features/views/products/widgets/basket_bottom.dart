import 'package:cached_network_image/cached_network_image.dart';
import 'package:eco_market/features/views/basket/bloc/basket_bloc.dart';
import 'package:eco_market/ui/button.dart';
import 'package:eco_market/ui/shimmer_widgets.dart';
import 'package:eco_market/utils/constants/image_strings.dart';
import 'package:eco_market/utils/constants/text_strings.dart';
import 'package:eco_market/utils/helpers/helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BasketBottom extends StatelessWidget {
  const BasketBottom({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        if (state.cartItems.isEmpty) {
          return Center(
            child: Center(
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
                  )
                ],
              ),
            ),
          );
        } else {
          return SizedBox(
            height: 1000,
            child: ListView.builder(
                itemCount: state.cartItems.length,
                itemBuilder: (context, index) {
                  return SizedBox(
                    width: 343.0,
                    height: 94.0,
                    child: Container(
                      padding: const EdgeInsets.only(right: 16, left: 16),
                      child: Row(
                        children: [
                          Container(
                            width: 98.0,
                            height: 86.0,
                            decoration: const BoxDecoration(
                              color: Color(0xFFF8F8F8),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20.0),
                              child: CachedNetworkImage(
                                imageUrl: state.cartItems[index].image ??
                                    'placeholder_url',
                                fit: BoxFit.cover,
                                placeholder: (context, url) => ShimmerImg(
                                  baseColor:
                                      Colors.grey[500] ?? Colors.grey[300]!,
                                  highlightColor:
                                      Colors.grey[150] ?? Colors.grey[100]!,
                                ),
                                errorWidget: (context, url, error) =>
                                    const Icon(Icons.error),
                              ),
                            ),
                          ),
                          const SizedBox(height: 4),
                          Padding(
                            padding: const EdgeInsets.all(0),
                            child: Row(
                              children: [
                                Center(
                                  child: Column(
                                    children: [
                                      Text(
                                        state.cartItems[index].name ??
                                            'Unknown Product',
                                        style: const TextStyle(
                                          fontFamily: 'TTNormsPro',
                                          fontSize: 14.0,
                                          fontStyle: FontStyle.normal,
                                          fontWeight: FontWeight.w500,
                                          height: 1.0,
                                        ),
                                      ),
                                      const SizedBox(height: 4),
                                      Text(
                                        'Цена ${(removeTrailingZeros(state.cartItems[index].price ?? 'error'))} c за шт',
                                        style: const TextStyle(
                                          fontFamily: 'TTNormsPro',
                                          fontSize: 14.0,
                                          fontStyle: FontStyle.normal,
                                          fontWeight: FontWeight.w500,
                                          height: 1.0,
                                        ),
                                      ),
                                      const SizedBox(height: 24),
                                      Text(
                                        '${(removeTrailingZeros(state.cartItems[index].price ?? 'error'))}c',
                                        style: const TextStyle(
                                          color: Color(0xFF75DB1B),
                                          textBaseline:
                                              TextBaseline.ideographic,
                                          fontFamily: 'TTNormsPro',
                                          fontSize: 20.0,
                                          fontStyle: FontStyle.normal,
                                          fontWeight: FontWeight.w700,
                                          height: 1.0,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                const SizedBox(width: 40),
                                CustomButton(
                                  onPressed: () {},
                                  buttonText: ATexts.productCardTitle,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
          );
        }
      },
    );
  }
}
