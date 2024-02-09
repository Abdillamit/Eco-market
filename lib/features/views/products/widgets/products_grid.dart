import 'package:cached_network_image/cached_network_image.dart';
import 'package:eco_market/features/views/cart/bloc/cart_bloc.dart';
import 'package:eco_market/features/views/products/widgets/card.dart';
import 'package:eco_market/modules/products_list.dart';
import 'package:eco_market/ui/button.dart';
import 'package:eco_market/ui/shimmer_widgets.dart';
import 'package:eco_market/utils/constants/sizes.dart';
import 'package:eco_market/utils/constants/text_strings.dart';
import 'package:eco_market/utils/helpers/helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductsGrid extends StatelessWidget {
  final List<Products> products;
  const ProductsGrid({Key? key, required this.products}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: GridView.builder(
        itemCount: products.length,
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: 0.8,
          crossAxisCount: 2,
        ),
        itemBuilder: (context, index) => InkWell(
          onTap: () {
            showModalBottomSheet(
              context: context,
              isDismissible: true,
              builder: (BuildContext context) {
                return DraggableScrollableSheet(
                  expand: false,
                  initialChildSize: 0.9,
                  minChildSize: 0.2,
                  maxChildSize: 1,
                  builder: (BuildContext context,
                      ScrollController scrollController) {
                    return SingleChildScrollView(
                      controller: scrollController,
                      child: Container(
                        margin: const EdgeInsets.only(
                            right: 10, left: 10, bottom: 10),
                        child: Column(
                          children: [
                            SizedBox(
                              width: double.infinity,
                              height: 208.0,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: CachedNetworkImage(
                                  imageUrl: products[index].image ??
                                      'placeholder_url',
                                  fit: BoxFit.cover,
                                  placeholder: (context, url) => ShimmerImg(
                                    baseColor:
                                        Colors.grey[500] ?? Colors.grey[300]!,
                                    highlightColor:
                                        Colors.grey[150] ?? Colors.grey[100]!,
                                  ),
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
                                    products[index].name ?? 'Unknown Product',
                                    style: const TextStyle(
                                      fontFamily: 'TTNormsPro',
                                      fontSize: 24.0,
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.w700,
                                      height: 1.0,
                                    ),
                                  ),
                                  const SizedBox(height: 20),
                                  Row(
                                    children: [
                                      Text(
                                        '${(removeTrailingZeros(products[index].price ?? 'error'))}c',
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
                                  const SizedBox(
                                    height: ASizes.cardRadiusLg,
                                  ),
                                  Text(
                                    products[index].description ??
                                        'Unknown Product',
                                    style: const TextStyle(
                                      color: Color(0xFFACABAD),
                                      fontFamily: 'TTNormsPro',
                                      fontSize: 16.0,
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.w400,
                                      height: 1.0,
                                    ),
                                  ),
                                  const SizedBox(height: 24),
                                  BlocBuilder<CartBloc, CartState>(
                                      builder: (context, state) {
                                    int quantity = 0;
                                    for (int i = 0;
                                        i < state.cartItems.length;
                                        i++) {
                                      if (state.cartItems[i].id ==
                                          products[index].id) {
                                        quantity =
                                            state.cartItems[i].quantity ?? 0;
                                      }
                                    }
                                    return quantity != 0
                                        ? Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              Text( '${(productPrice(products[index].price ?? 'error'))}c',),
                                              Container(
                                                padding:
                                                    const EdgeInsets.all(3),
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(50),
                                                  color:
                                                      const Color(0xFF75DB1B),
                                                ),
                                                child: GestureDetector(
                                                  onTap: () {
                                                    context
                                                        .read<CartBloc>()
                                                        .add(
                                                          DecrementProduct(
                                                            products[index],
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
                                              Text(
                                                  '$quantity'),
                                              const SizedBox(width: 15),
                                              Container(
                                                padding:
                                                    const EdgeInsets.all(3),
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(50),
                                                  color:
                                                      const Color(0xFF75DB1B),
                                                ),
                                                child: GestureDetector(
                                                  onTap: () {
                                                    context
                                                        .read<CartBloc>()
                                                        .add(
                                                          IncrimentProduct(
                                                            products[index],
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
                                            width: double.infinity,
                                            height: 54,
                                            child: CustomButton(
                                              onPressed: () {
                                                final cartBloc =
                                                    context.read<CartBloc>();
                                                cartBloc.add(
                                                    AddToCart(products[index]));
                                              },
                                              buttonText:
                                                  ATexts.productCardTitle,
                                            ),
                                          );
                                  })
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
            );
          },
          child: ProductCart(product: products[index]),
        ),
      ),
    );
  }
}
