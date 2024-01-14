part of 'products_bloc.dart';

abstract class ProductsEvent {
  const ProductsEvent();
}

class LoadProductsEvent extends ProductsEvent {}

class SearchCardEvent extends ProductsEvent {
  final String query;

  SearchCardEvent(this.query);
}

class FilterProductsByCategory extends ProductsEvent {
  final String categoryName;

  FilterProductsByCategory({required this.categoryName});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FilterProductsByCategory &&
          runtimeType == other.runtimeType &&
          categoryName == other.categoryName;

  @override
  int get hashCode => categoryName.hashCode;
}
