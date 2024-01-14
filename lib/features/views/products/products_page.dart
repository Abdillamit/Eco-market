import 'package:eco_market/features/views/products/widgets/products_grid.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:eco_market/features/views/home/bloc/category_bloc.dart';
import 'package:eco_market/ui/input.dart';
import 'package:eco_market/utils/constants/text_strings.dart';
import 'package:eco_market/features/views/products/bloc/products_bloc.dart';
import 'package:shimmer/shimmer.dart';

class ProductsPage extends StatelessWidget {
  const ProductsPage({Key? key}) : super(key: key);

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
      body: SingleChildScrollView(
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
              BlocBuilder<CategoryBloc, CategoryState>(
                builder: (context, state) {
                  if (state is LoadingState) {
                    return _buildShimmerCategories();
                  } else if (state is LoadedState) {
                    return SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          for (int i = 0; i < state.categories.length; i++)
                            Container(
                              margin: const EdgeInsets.all(8),
                              padding: const EdgeInsets.symmetric(
                                vertical: 10,
                                horizontal: 18,
                              ),
                              decoration: BoxDecoration(
                                color: state.categories[i].name == 'Все'
                                    ? const Color(0xFF75DB1B)
                                    : Colors.white,
                                borderRadius: BorderRadius.circular(18),
                                boxShadow: const [
                                  BoxShadow(
                                    blurRadius: 1.0,
                                    color: Colors.grey,
                                  )
                                ],
                              ),
                              child: Text(
                                state.categories[i].name ?? 'DefaultCategory',
                                style: const TextStyle(
                                  color: Color(0xFFD2D1D5),
                                  fontFamily: 'TTNormsPro',
                                  fontSize: 16.0,
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.w500,
                                  height: 1.0,
                                ),
                              ),
                            ),
                        ],
                      ),
                    );
                  } else if (state is ErrorState) {
                    return Text('Error: ${state.error}');
                  } else {
                    return const Text('Unknown state');
                  }
                },
              ),
              const SizedBox(height: 24),
              BlocBuilder<ProductsBloc, ProductsState>(
                builder: (context, state) {
                  if (state is LoadedStateProducts) {
                    return ProductsGrid(products: state.products);
                  } else if (state is LoadingStateProducts) {
                    return _buildShimmerGrid();
                  } else {
                    return const SizedBox();
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildShimmerCategories() {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: List.generate(
            6,
            (index) => Container(
              margin: const EdgeInsets.all(8),
              padding: const EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 18,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(18),
                boxShadow: const [
                  BoxShadow(
                    blurRadius: 1.0,
                    color: Colors.grey,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

Widget _buildShimmerGrid() {
  return Shimmer.fromColors(
    baseColor: Colors.grey[300]!,
    highlightColor: Colors.grey[100]!,
    child: SingleChildScrollView(
      child: GridView.builder(
        itemCount: 6,
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: 0.7,
          crossAxisCount: 2,
        ),
        itemBuilder: (context, index) {
          return _buildShimmerImage();
        },
      ),
    ),
  );
}

Widget _buildShimmerImage() {
  return Shimmer.fromColors(
    baseColor: Colors.grey[300]!,
    highlightColor: Colors.grey[100]!,
    child: Container(
      margin: const EdgeInsets.all(8),
      child: Container(
        height: 228,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: const Color.fromARGB(255, 248, 248, 248),
        ),
      ),
    ),
  );
}
