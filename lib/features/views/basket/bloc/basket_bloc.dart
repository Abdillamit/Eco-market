import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../modules/products_list.dart';

part 'basket_event.dart';
part 'basket_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartState([])) {
    on<CartEvent>(_mapEventToState);
    on<IncrimentProduct>(_incrimentEvent);
    on<DecrementProduct>(_decrementEvent);
  }
  Future<void> _mapEventToState(
      CartEvent event, Emitter<CartState> emit) async {
    if (event is AddToCart) {
      final updatedCart = List<Products>.from(state.cartItems)
        ..add(event.products);
      emit(CartState(updatedCart));
    }
  }

  Future<void> _incrimentEvent(
      IncrimentProduct event, Emitter<CartState> emit) async {
    final incrimentEv = List<Products>.from(state.cartItems)
      ..add(event.products);
    // if (incrimentEv == incrimentEv) {
    //   state.cartItems[].quantity++;
    // }
    emit(CartState(incrimentEv));
  }

  Future<void> _decrementEvent(
      DecrementProduct event, Emitter<CartState> emit) async {
    final decrementEv = List<Products>.from(state.cartItems);
    decrementEv.remove(event.products);
    emit(CartState(decrementEv));
  }
}
