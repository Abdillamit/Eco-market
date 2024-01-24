import 'package:cached_network_image/cached_network_image.dart';
import 'package:eco_market/features/views/basket/bloc/basket_bloc.dart';
import 'package:eco_market/modules/products_list.dart';
import 'package:eco_market/utils/constants/image_strings.dart';
import 'package:eco_market/utils/constants/text_strings.dart';
import 'package:eco_market/utils/helpers/helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class CardBasket extends StatefulWidget {
  const CardBasket({super.key});
  @override
  State<CardBasket> createState() => _CardBasketState();
}

class _CardBasketState extends State<CardBasket> {
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
                              ),
                            ),
                          ),
                          const SizedBox(height: 4),
                          Padding(
                            padding: const EdgeInsets.all(8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Column(
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
                                    const SizedBox(height: 20),
                                    Text(
                                      '${(removeTrailingZeros(state.cartItems[index].price ?? 'error'))}c',
                                      style: const TextStyle(
                                        color: Color(0xFF75DB1B),
                                        textBaseline: TextBaseline.ideographic,
                                        fontFamily: 'TTNormsPro',
                                        fontSize: 20.0,
                                        fontStyle: FontStyle.normal,
                                        fontWeight: FontWeight.w700,
                                        height: 1.0,
                                      ),
                                    )
                                  ],
                                ),
                                const SizedBox(width: 20),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.all(4),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(50),
                                        color: const Color(0xFF75DB1B),
                                      ),
                                      child: GestureDetector(
                                        onTap: () {
                                          context.read<CartBloc>().add(
                                                DecrementProduct(
                                                    state.cartItems[index]),
                                              );
                                        },
                                        child: const Icon(
                                          Icons.remove,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 15),
                                    Text('${state.cartItems[index].quantity}'),
                                    const SizedBox(width: 15),
                                    Container(
                                      padding: const EdgeInsets.all(4),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(50),
                                        color: const Color(0xFF75DB1B),
                                      ),
                                      child: GestureDetector(
                                        onTap: () {
                                          context.read<CartBloc>().add(
                                                IncrimentProduct(
                                                    state.cartItems[index]),
                                              );
                                        },
                                        child: const Icon(
                                          Icons.add,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ],
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
