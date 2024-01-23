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

// class DeleToCartEvent extends CartEvent {
//   final Products products;
//   DeleToCartEvent({required this.products});
//   @override
//   List<Object> get props => [products];
// }
