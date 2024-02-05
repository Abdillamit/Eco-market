import 'package:cached_network_image/cached_network_image.dart';
import 'package:eco_market/features/views/basket/bloc/basket_bloc.dart';
import 'package:eco_market/modules/products_list.dart';
import 'package:eco_market/utils/helpers/helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';

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
      height: 210,
      child: ListView.builder(
        itemCount: widget.cartItems.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 10),
                child: Container(
                  width: 370,
                  height: 94,
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(248, 248, 248, 1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    children: [
                      Stack(
                        children: [
                          SizedBox(
                            width: 98.0,
                            height: 86.0,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: CachedNetworkImage(
                                imageUrl: widget.cartItems[index].image ??
                                    'placeholder_url',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Positioned(
                              bottom: 5,
                              left: 5,
                              child: Container(
                                width: 32,
                                height: 32,
                                padding: const EdgeInsets.all(4),
                                decoration: BoxDecoration(
                                  color: const Color.fromRGBO(248, 248, 248, 1),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: const Icon(
                                  Iconsax.trash,
                                  color: Colors.red,
                                  size: 24.0,
                                ),
                              )),
                        ],
                      ),
                      Container(
                        width: 158,
                        height: 80,
                        margin: const EdgeInsets.all(8),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              alignment: Alignment.topLeft,
                              child: Text(
                                widget.cartItems[index].name ??
                                    'Unknown Product',
                                style: const TextStyle(
                                  color: Color.fromRGBO(31, 31, 31, 1),
                                  fontFamily: "TTNormsPro",
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  height: 1.2143,
                                  letterSpacing: 0,
                                ),
                              ),
                            ),
                            const SizedBox(height: 5),
                            Container(
                              alignment: Alignment.topLeft,
                              child: Text(
                                'Цена ${(removeTrailingZeros(widget.cartItems[index].price ?? 'error'))} c за шт',
                                style: const TextStyle(
                                  fontFamily: 'TTNormsPro',
                                  color: Color.fromRGBO(172, 171, 173, 1),
                                  fontSize: 14.0,
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.w500,
                                  height: 1.0,
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),
                            Container(
                              alignment: Alignment.topLeft,
                              child: Text(
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
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        alignment: Alignment.bottomRight,
                        width: 90,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                            const SizedBox(width: 5),
                            Text('${widget.cartItems[index].quantity}'),
                            const SizedBox(width: 5),
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
                      ),
                    ],
                  ),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
