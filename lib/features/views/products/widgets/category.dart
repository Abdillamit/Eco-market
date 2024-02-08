import 'package:eco_market/features/views/home/bloc/category_bloc.dart';
import 'package:eco_market/features/views/products/bloc/products_bloc.dart';
import 'package:eco_market/ui/shimmer_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryBar extends StatelessWidget {
  const CategoryBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryBloc, CategoryState>(
      builder: (context, state) {
        if (state is LoadingState) {
          return ShimmerImg(
            baseColor: Colors.grey[500] ?? Colors.grey[300]!,
            highlightColor: Colors.grey[150] ?? Colors.grey[100]!,
          );
        } else if (state is LoadedState) {
          return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(
                state.categories.length,
                (i) {
                  final isActive = i == state.selectedCategoryIndex;
                  return GestureDetector(
                    onTap: () {
                      context.read<CategoryBloc>().add(SelectCategoryEvent(i));
                      context.read<ProductsBloc>().add(
                            FilterProductsByCategory(
                              categoryName: '${state.categories[i].name}',
                            ),
                          );
                    },
                    child: Container(
                      margin: const EdgeInsets.all(8),
                      padding: const EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 18,
                      ),
                      decoration: BoxDecoration(
                        color:
                            isActive ? const Color(0xFF75DB1B) : Colors.white,
                        borderRadius: BorderRadius.circular(18),
                        boxShadow: const [
                          BoxShadow(
                            blurRadius: 1.0,
                            color: Color.fromRGBO(210, 209, 213, 1.0),
                          ),
                        ],
                      ),
                      child: Text(
                        state.categories[i].name ?? 'DefaultCategory',
                        style: TextStyle(
                          color: isActive
                              ? Colors.white
                              : const Color.fromRGBO(210, 209, 213, 1.0),
                          fontFamily: 'TTNormsPro',
                          fontSize: 16.0,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w500,
                          height: 1.0,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          );
        } else if (state is ErrorState) {
          return Text('Error: ${state.error}');
        } else {
          return const Text('Unknown state');
        }
      },
    );
  }
}
