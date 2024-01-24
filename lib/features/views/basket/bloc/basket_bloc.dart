import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../modules/products_list.dart';

part 'basket_event.dart';
part 'basket_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartState([])) {
    on<CartEvent>(_mapEventToState);
    on<IncrimentProduct>(_IncrimentEvent);
    on<DecrementProduct>(_DecrementEvent);
  }
  Future<void> _mapEventToState(
      CartEvent event, Emitter<CartState> emit) async {
    if (event is AddToCart) {
      final updatedCart = List<Products>.from(state.cartItems)
        ..add(event.products);
      emit(CartState(updatedCart));
    }
  }

  Future<void> _IncrimentEvent(
      IncrimentProduct event, Emitter<CartState> emit) async {
    if (event is IncrimentProduct) {
      final incrimentEv = List<Products>.from(state.cartItems)
        ..add(event.products);
      emit(CartState(incrimentEv));
    }
  }

  Future<void> _DecrementEvent(
      DecrementProduct event, Emitter<CartState> emit) async {
    if (event is DecrementProduct) {
      final decrementEv = List<Products>.from(state.cartItems);
      decrementEv.remove(event.products);
      emit(CartState(decrementEv));
    }
  }
}
