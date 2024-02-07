import 'package:cached_network_image/cached_network_image.dart';
import 'package:eco_market/features/views/cart/bloc/cart_bloc.dart';
import 'package:eco_market/modules/products_list.dart';
import 'package:eco_market/ui/button.dart';
import 'package:eco_market/ui/shimmer_widgets.dart';
import 'package:eco_market/utils/constants/text_strings.dart';
import 'package:eco_market/utils/helpers/helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductCart extends StatelessWidget {
  const ProductCart({Key? key, required this.product}) : super(key: key);
  final Products product;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: const Color(0xFFF8F8F8),
        ),
        child: Container(
          padding: const EdgeInsets.all(3),
          child: Column(
            children: [
              SizedBox(
                width: 166.0,
                height: 100.0,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20.0),
                  child: CachedNetworkImage(
                    imageUrl: product.image ?? 'placeholder_url',
                    fit: BoxFit.cover,
                    placeholder: (context, url) => ShimmerImg(
                      baseColor: Colors.grey[500] ?? Colors.grey[300]!,
                      highlightColor: Colors.grey[150] ?? Colors.grey[100]!,
                    ),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),
                ),
              ),
              const SizedBox(height: 4),
              Padding(
                padding: const EdgeInsets.all(4),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.name ?? 'Unknown Product',
                      style: const TextStyle(
                        fontFamily: 'TTNormsPro',
                        fontSize: 14.0,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w500,
                        height: 1.0,
                      ),
                    ),
                    const SizedBox(height: 24),
                    Row(
                      children: [
                        Text(
                          '${(removeTrailingZeros(product.price ?? 'error'))}c',
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
                      ],
                    ),
                    const SizedBox(height: 5),
                    BlocBuilder<CartBloc, CartState>(builder: (context, state) {
                      int quantity = 0;
                      for (int i = 0; i < state.cartItems.length; i++) {
                        if (state.cartItems[i].id == product.id) {
                          quantity = state.cartItems[i].quantity ?? 0;
                        }
                      }
                      return quantity != 0
                          ? Row(
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
                                              product,
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
                                Text('${product.quantity}'),
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
                                              product,
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
                            )
                          : SizedBox(
                              width: 158,
                              child: CustomButton(
                                onPressed: () {
                                  final cartBloc = context.read<CartBloc>();
                                  cartBloc.add(AddToCart(product));
                                },
                                buttonText: ATexts.productCardTitle,
                              ),
                            );
                    })
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
