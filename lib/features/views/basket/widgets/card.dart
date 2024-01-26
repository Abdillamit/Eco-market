import 'package:cached_network_image/cached_network_image.dart';
import 'package:eco_market/features/views/basket/bloc/basket_bloc.dart';
import 'package:eco_market/modules/products_list.dart';
import 'package:eco_market/utils/helpers/helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class CardBasket extends StatefulWidget {
  final List<Products> cartItems;
  const CardBasket({
    super.key,
    required this.cartItems,
  });
  @override
  State<CardBasket> createState() => _CardBasketState();
}

class _CardBasketState extends State<CardBasket> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 192,
      child: ListView.builder(
        itemCount: widget.cartItems.length,
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
                        imageUrl:
                            widget.cartItems[index].image ?? 'placeholder_url',
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
                              widget.cartItems[index].name ?? 'Unknown Product',
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
                              'Цена ${(removeTrailingZeros(widget.cartItems[index].price ?? 'error'))} c за шт',
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
                              '${(removeTrailingZeros(widget.cartItems[index].price ?? 'error'))}c',
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
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                                          widget.cartItems[index],
                                        ),
                                      );
                                },
                                child: const Icon(
                                  Icons.remove,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            const SizedBox(width: 15),
                            Text('${widget.cartItems[index].quantity}'),
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
                                          widget.cartItems[index],
                                        ),
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
        },
      ),
    );
  }
}
