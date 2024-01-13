import 'package:eco_market/features/views/home/bloc/category_bloc.dart';
import 'package:eco_market/modules/products_list.dart';
import 'package:eco_market/ui/input.dart';
import 'package:eco_market/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:eco_market/features/views/products/bloc/products_bloc.dart';

class ProductsPage extends StatelessWidget {
  const ProductsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          ATexts.appBarTitleProduct,
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 20, left: 16, right: 25),
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(right: 25),
                child: Input(
                  prefixIcon: Icons.search,
                  labelText: 'Быстрый поиск',
                ),
              ),
              BlocBuilder<CategoryBloc, CategoryState>(
                builder: (context, state) {
                  if (state is LoadingState) {
                    return const CircularProgressIndicator();
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
                                    color: Colors.grey,
                                  )
                                ],
                              ),
                              child: Text(state.categories[i].name ??
                                  'DefaultCategory'),
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
              BlocBuilder<ProductsBloc, ProductsState>(
                builder: (context, state) {
                  if (state is LoadingStateProducts) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is LoadedStateProducts) {
                    List<Products> products = state.products;
                    return SingleChildScrollView(
                      child: GridView.builder(
                        itemCount: products.length,
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          childAspectRatio: 0.7,
                          crossAxisCount: 2,
                        ),
                        itemBuilder: (context, index) => InkWell(
                          onTap: () {
                            (products[index]);
                          },
                          child: Container(
                            margin: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: const Color(0xFFF8F8F8),
                              boxShadow: const [
                                BoxShadow(
                                  color: Color(0xFFF8F8F8),
                                  blurRadius: 5,
                                  spreadRadius: 2,
                                )
                              ],
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: Image.network(
                                      products[index].image ??
                                          'placeholder_url',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          products[index].name ??
                                              'Unknown Product',
                                          style: const TextStyle(fontSize: 15),
                                        ),
                                        const SizedBox(height: 3),
                                        Row(
                                          children: [
                                            Text(
                                              'Сом${products[index].price ?? "error"}',
                                              style: const TextStyle(
                                                fontSize: 13,
                                                color: Color(0xFF75DB1B),
                                              ),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  } else if (state is ErrorStateProducts) {
                    return Center(child: Text('Error: ${state.errorMessage}'));
                  } else {
                    return const Center(child: Text('Unexpected state'));
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
