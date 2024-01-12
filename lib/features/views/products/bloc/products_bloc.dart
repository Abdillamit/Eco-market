import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'products_event.dart';
part 'products_state.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  List<String> allProducts = []; // Store all products here
  List<String> filteredProducts = []; // Store filtered products here

  ProductsBloc() : super(ProductsInitial());

  Future<List<String>> fetchAllProducts() async {
    // Simulate fetching products from an API or database
    await Future.delayed(Duration(seconds: 2)); // Simulating a delay
    return ['Product 1', 'Product 2', 'Product 3'];
  }

  @override
  Stream<ProductsState> mapEventToState(
    ProductsEvent event,
  ) async* {
    if (event is LoadProducts) {
      allProducts = await fetchAllProducts();
      yield ProductsLoaded(products: allProducts);
    } else if (event is FilterProductsByCategory) {
      filteredProducts = allProducts
          .where((product) => product.contains(event.categoryName))
          .toList();
      yield ProductsFiltered(products: filteredProducts);
    }
  }
}
