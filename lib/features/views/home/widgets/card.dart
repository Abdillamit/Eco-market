import 'package:cached_network_image/cached_network_image.dart';
import 'package:eco_market/features/views/home/bloc/category_bloc.dart';
import 'package:eco_market/features/views/home/widgets/network_connection.dart';
import 'package:eco_market/features/views/products/bloc/products_bloc.dart';
import 'package:eco_market/features/views/products/products_page.dart';
import 'package:eco_market/ui/shimmer_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CardCategorys extends StatelessWidget {
  const CardCategorys({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryBloc, CategoryState>(
      builder: (context, state) {
        if (state is LoadingState) {
          return const ShimmerGridView();
        } else if (state is ErrorState) {
          return const NetworkConnection();
        } else if (state is LoadedState) {
          return GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 16.0,
              mainAxisSpacing: 16.0,
            ),
            padding: const EdgeInsets.all(16),
            itemCount: state.categories.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  context.read<CategoryBloc>().add(SelectCategoryEvent(index));
                  context.read<ProductsBloc>().add(
                        FilterProductsByCategory(
                          categoryName: '${state.categories[index].name}',
                        ),
                      );
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ProductsPage(),
                    ),
                  );
                },
                child: Stack(
                  alignment: Alignment.bottomLeft,
                  children: [
                    Positioned.fill(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: ColorFiltered(
                          colorFilter: ColorFilter.mode(
                            Colors.black.withOpacity(0.3),
                            BlendMode.srcOver,
                          ),
                          child: CachedNetworkImage(
                            imageUrl: state.categories[index].image != null
                                ? state.categories[index].image!
                                : 'error img categories',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        '${state.categories[index].name}',
                        style: const TextStyle(
                          color: Colors.white,
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
              );
            },
          );
        }
        return Container();
      },
    );
  }
}
