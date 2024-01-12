part of 'products_bloc.dart';

abstract class ProductsState {
  const ProductsState();
}

class ProductsInitial extends ProductsState {
  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is ProductsInitial;

  @override
  int get hashCode => runtimeType.hashCode;
}

class ProductsLoaded extends ProductsState {
  final List<String> products;

  const ProductsLoaded({required this.products});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProductsLoaded &&
          runtimeType == other.runtimeType &&
          listEquals(products, other.products);

  @override
  int get hashCode => products.hashCode;
}

class ProductsFiltered extends ProductsState {
  final List<String> products;

  const ProductsFiltered({required this.products});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProductsFiltered &&
          runtimeType == other.runtimeType &&
          listEquals(products, other.products);

  @override
  int get hashCode => products.hashCode;
}
