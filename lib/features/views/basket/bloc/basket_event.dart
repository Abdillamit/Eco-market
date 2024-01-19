part of 'basket_bloc.dart';

sealed class BasketEvent extends Equatable {
  const BasketEvent();

  @override
  List<Object> get props => [];
}

class AddToBasketEvent extends BasketEvent {
  final products;

  AddToBasketEvent({required this.products});
}
