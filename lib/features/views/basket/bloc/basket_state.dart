part of 'basket_bloc.dart';

abstract class BaseBasketState {
  get basketItems => null;
}

class BasketState extends Equatable {
  final List<Products> basketItems;

  BasketState(this.basketItems);

  @override
  List<Object?> get props => [basketItems];
}

class BasketLoaded extends BasketState {
  final List<Products> basketItems;

  BasketLoaded(this.basketItems) : super(basketItems);

  @override
  List<Object?> get props => [basketItems];
}

class BasketInitial extends BasketState {
  BasketInitial(super.basketItems);
  // If BasketInitial doesn't have additional properties, no need to change it
}
