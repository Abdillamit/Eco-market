import 'package:eco_market/features/views/basket/basket.dart';
import 'package:eco_market/features/views/products/bloc/products_bloc.dart';
import 'package:eco_market/features/views/products/widgets/category.dart';
import 'package:eco_market/features/views/products/widgets/products_grid.dart';
import 'package:eco_market/ui/input.dart';
import 'package:eco_market/ui/shimmer_widgets.dart';
import 'package:eco_market/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductsPage extends StatelessWidget {
  const ProductsPage({
    Key? key,
  }) : super(key: key);
  // final List<Products> products;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          ATexts.appBarTitleProduct,
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
                  const SizedBox(height: 16),
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
            child: SizedBox(
              width: 168,
              height: 48,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const Basket(
                              products: [],
                            )),
                  );
                },
                child: const Text(ATexts.basketTitle),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
