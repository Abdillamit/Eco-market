import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../modules/products_list.dart';

part 'basket_event.dart';
part 'basket_state.dart';

class BasketBloc extends Bloc<BasketEvent, BasketState> {
  BasketBloc() : super(BasketInitial()) {
    on<AddToBasketEvent>((event, emit) {
      final updatedBasket = _addToBasket(event.products, state.basketItems);
      emit(BasketLoaded(updatedBasket));
    });
  }

  _addToBasket(Products product, List<Products> currentBasket) {
    final updatedBasket = List.from(currentBasket);
    updatedBasket.add(product);
    return updatedBasket;
  }
}
