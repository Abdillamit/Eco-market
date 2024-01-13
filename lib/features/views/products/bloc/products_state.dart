part of 'products_bloc.dart';

abstract class ProductsState {
  const ProductsState();
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
