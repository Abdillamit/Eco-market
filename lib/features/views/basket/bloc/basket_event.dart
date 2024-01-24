part of 'basket_bloc.dart';

sealed class CartEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class AddToCart extends CartEvent {
  final Products products;
  AddToCart(this.products);
  @override
  List<Object> get props => [products];
}

class IncrimentProduct extends CartEvent {
  final Products products;
  IncrimentProduct(this.products);
  @override
  List<Object> get props => [products];
}

class DecrementProduct extends CartEvent {
  final Products products;
  DecrementProduct(this.products);
  @override
  List<Object> get props => [products];
}
