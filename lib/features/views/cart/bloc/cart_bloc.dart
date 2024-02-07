import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../modules/products_list.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartState([])) {
    on<AddToCart>(_mapEventToState);
    on<IncrimentProduct>(_incrementEvent);
    on<DecrementProduct>(_decrementEvent);
    on<DeleteProduct>(_deleteProductEvent);
    on<DeleteAllProduct>(_deleteProductAllEvent);
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

          updatedCart[existingProductIndex].quantity ??= 0;
          updatedCart[existingProductIndex].quantity!;

          updatedCart[existingProductIndex].totalSum =
              updatedCart[existingProductIndex].quantity! * priceValue;
        }
      } else {
        event.products.quantity = 1;

        double priceValue = double.tryParse(event.products.price ?? '') ?? 0.0;

        event.products.totalSum = priceValue;
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
      String? price = updatedCart[existingProductIndex].price;

      if (price != null) {
        double priceValue = double.tryParse(price) ?? 0.0;

        updatedCart[existingProductIndex].quantity =
            (updatedCart[existingProductIndex].quantity ?? 0) + 1;
        updatedCart[existingProductIndex].totalSum =
            (updatedCart[existingProductIndex].quantity ?? 0) * priceValue;
      }
    } else {
      event.products.quantity = 1;
      updatedCart.add(event.products);
    }

    _saveCartToPrefs(updatedCart);
    emit(CartState(updatedCart));
  }

  Future<void> _decrementEvent(
    DecrementProduct event,
    Emitter<CartState> emit,
  ) async {
    final updatedCart = List<Products>.from(state.cartItems);
    final existingProductIndex =
        updatedCart.indexWhere((product) => product.id == event.products.id);

    if (existingProductIndex != -1) {
      String? price = updatedCart[existingProductIndex].price;

      if (price != null) {
        double priceValue = double.tryParse(price) ?? 0.0;

        if (updatedCart[existingProductIndex].quantity! > 0) {
          updatedCart[existingProductIndex].quantity =
              (updatedCart[existingProductIndex].quantity ?? 0) - 1;

          if (updatedCart[existingProductIndex].quantity! == 0) {
            updatedCart.removeAt(existingProductIndex);
          } else {
            updatedCart[existingProductIndex].totalSum =
                (updatedCart[existingProductIndex].quantity ?? 0) * priceValue;
          }
        }
      }
    } else {
      event.products.quantity = 1;
      updatedCart.add(event.products);
    }

    _saveCartToPrefs(updatedCart);
    emit(CartState(updatedCart));
  }

  Future<void> _deleteProductEvent(
    DeleteProduct event,
    Emitter<CartState> emit,
  ) async {
    final updatedCart = List<Products>.from(state.cartItems);
    final existingProductIndex =
        updatedCart.indexWhere((product) => product.id == event.products.id);

    updatedCart.removeAt(existingProductIndex);

    _saveCartToPrefs(updatedCart);
    emit(CartState(updatedCart));
  }

  Future<void> _deleteProductAllEvent(
    DeleteAllProduct event,
    Emitter<CartState> emit,
  ) async {
    final updatedCart = List<Products>.from(state.cartItems);

    updatedCart.clear();

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
