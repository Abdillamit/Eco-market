part of 'products_bloc.dart';

abstract class ProductsState {
  const ProductsState();
}

class SearchState extends ProductsState {
  final List cards;

  SearchState({
    this.cards = const [],
  });
}

class LoadingStateProducts extends ProductsState {
  const LoadingStateProducts();
}

class LoadedStateProducts extends ProductsState {
  final List<Products> products;

  LoadedStateProducts(this.products);
}

class ErrorStateProducts extends ProductsState {
  final String errorMessage;

  ErrorStateProducts(this.errorMessage);
}
