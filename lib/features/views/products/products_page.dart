import 'package:eco_market/features/views/basket/bloc/basket_bloc.dart';
import 'package:eco_market/features/views/products/bloc/products_bloc.dart';
import 'package:eco_market/features/views/products/widgets/basket_bottom.dart';
import 'package:eco_market/features/views/products/widgets/category.dart';
import 'package:eco_market/features/views/products/widgets/products_grid.dart';
import 'package:eco_market/modules/products_list.dart';
import 'package:eco_market/ui/input.dart';
import 'package:eco_market/ui/shimmer_widgets.dart';
import 'package:eco_market/utils/constants/sizes.dart';
import 'package:eco_market/utils/constants/text_strings.dart';
import 'package:eco_market/utils/helpers/helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductsPage extends StatelessWidget {
  const ProductsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          ATexts.appBarTitleProductTitle,
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
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(top: 20, left: 16, right: 25),
              child: Column(
                children: [
                  const Input(
                    labelText: ATexts.searchTextProduct,
                    prefixIcon: Icons.search,
                    labelColor: Color(0xFFACABAD),
                    backgroundColor: Color(0xFFF8F8F8),
                    iconColor: Color(0xFFACABAD),
                    borderRadius: 16.0,
                  ),
                  const SizedBox(height: ASizes.cardRadiusLg),
                  const CategoryBar(),
                  const SizedBox(height: 24),
                  BlocBuilder<ProductsBloc, ProductsState>(
                    builder: (context, state) {
                      if (state is LoadedStateProducts) {
                        return ProductsGrid(products: state.products);
                      } else if (state is LoadingStateProducts) {
                        return const ShimmerGrid();
                      } else {
                        return const SizedBox();
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 40,
            right: 16,
            child: InkWell(
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
                          child: const BasketBottom(),
                        );
                      },
                    );
                  },
                );
              },
              child: Container(
                width: 168,
                height: 48,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.0),
                  color: const Color(0xFF75DB1B),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.shopping_basket, color: Colors.white),
                    const SizedBox(width: 8),
                    const Text(
                      ATexts.basketTitle,
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'TT Norms Pro',
                        fontSize: 16.0,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 0.0,
                      ),
                    ),
                    const SizedBox(width: 8),
                    BlocBuilder<CartBloc, CartState>(
                      builder: (context, state) {
                        if (state.cartItems.isNotEmpty) {
                          Products product = state.cartItems[0];
                          return Text(
                            '${(removeTrailingZeros(product.price ?? 'error'))} c',
                            style: const TextStyle(
                              color: Colors.white,
                              fontFamily: 'TT Norms Pro',
                              fontSize: 16.0,
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w500,
                              letterSpacing: 0.0,
                            ),
                          );
                        } else {
                          return const Text(
                            '0 c',
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'TT Norms Pro',
                              fontSize: 16.0,
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w500,
                              letterSpacing: 0.0,
                            ),
                          );
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
