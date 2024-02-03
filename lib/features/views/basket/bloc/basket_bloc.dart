import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../modules/products_list.dart';

part 'basket_event.dart';
part 'basket_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartState([])) {
    on<CartEvent>(_mapEventToState);
    on<IncrimentProduct>(_incrementEvent);
    on<DecrementProduct>(_decrementEvent);
  }

  Future<void> _mapEventToState(
      CartEvent event, Emitter<CartState> emit) async {
    if (event is AddToCart) {
      final updatedCart = List<Products>.from(state.cartItems);
      final existingProductIndex =
          updatedCart.indexWhere((product) => product.id == event.products.id);

      if (existingProductIndex != -1) {
        String? price = updatedCart[existingProductIndex].price;

        if (price != null) {
          double priceValue = double.tryParse(price) ?? 0.0;

          updatedCart[existingProductIndex].quantity =
              (updatedCart[existingProductIndex].quantity ?? 0) + 1;
          updatedCart[existingProductIndex].totalSum =
              (updatedCart[existingProductIndex].quantity ?? 0) * priceValue;
        }
      } else {
        updatedCart.add(event.products);
      }

      _saveCartToPrefs(updatedCart);
      emit(CartState(updatedCart));
    }
  }

  Future<void> _incrementEvent(
      IncrimentProduct event, Emitter<CartState> emit) async {
    final updatedCart = List<Products>.from(state.cartItems);
    final existingProductIndex =
        updatedCart.indexWhere((product) => product.id == event.products.id);

    if (existingProductIndex != -1) {
      updatedCart[existingProductIndex].quantity =
          updatedCart[existingProductIndex].quantity! + 1;
    } else {
      updatedCart.add(event.products);
    }

    _saveCartToPrefs(updatedCart);
    emit(CartState(updatedCart));
  }

  Future<void> _decrementEvent(
      DecrementProduct event, Emitter<CartState> emit) async {
    final updatedCart = List<Products>.from(state.cartItems);
    final existingProductIndex =
        updatedCart.indexWhere((product) => product.id == event.products.id);

    if (existingProductIndex != -1) {
      updatedCart[existingProductIndex].quantity =
          updatedCart[existingProductIndex].quantity! - 1;
      updatedCart[existingProductIndex].price = event.products.price;
      if (updatedCart[existingProductIndex].quantity! <= 0) {
        updatedCart.removeAt(existingProductIndex);
      }
    }

    _saveCartToPrefs(updatedCart);
    emit(CartState(updatedCart));
  }

  Future<void> _saveCartToPrefs(List<Products> cart) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> cartStringList =
        cart.map((product) => json.encode(product.toJson())).toList();

    prefs.setStringList('cart', cartStringList);
  }
}
