import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

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
        // Увеличиваем количество товара в корзине
        updatedCart[existingProductIndex].quantity =
            updatedCart[existingProductIndex].quantity! + 1;
      } else {
        // Добавляем новый товар в корзину
        updatedCart.add(event.products);
      }

      // Сохраняем обновленную корзину в хранилище
      _saveCartToPrefs(updatedCart);
      // Оповещаем слушателей о новом состоянии корзины
      emit(CartState(updatedCart));
    }
  }

  Future<void> _incrementEvent(
      IncrimentProduct event, Emitter<CartState> emit) async {
    // Создаем копию текущей корзины
    final updatedCart = List<Products>.from(state.cartItems);
    // Ищем индекс товара в корзине
    final existingProductIndex =
        updatedCart.indexWhere((product) => product.id == event.products.id);

    if (existingProductIndex != -1) {
      // Увеличиваем количество товара в корзине
      updatedCart[existingProductIndex].quantity =
          updatedCart[existingProductIndex].quantity! + 1;
    } else {
      // Добавляем новый товар в корзину (этот случай не должен происходить)
      updatedCart.add(event.products);
    }

    // Сохраняем обновленную корзину в хранилище
    _saveCartToPrefs(updatedCart);
    // Оповещаем слушателей о новом состоянии корзины
    emit(CartState(updatedCart));
  }

  Future<void> _decrementEvent(
      DecrementProduct event, Emitter<CartState> emit) async {
    // Создаем копию текущей корзины
    final updatedCart = List<Products>.from(state.cartItems);
    // Ищем индекс товара в корзине
    final existingProductIndex =
        updatedCart.indexWhere((product) => product.id == event.products.id);

    if (existingProductIndex != -1) {
      // Уменьшаем количество товара в корзине
      updatedCart[existingProductIndex].quantity =
          updatedCart[existingProductIndex].quantity! - 1;
      updatedCart[existingProductIndex].price = event.products.price;
      // Удаляем товар из корзины, если количество становится равным нулю
      if (updatedCart[existingProductIndex].quantity! <= 0) {
        updatedCart.removeAt(existingProductIndex);
      }
    }

    // Сохраняем обновленную корзину в хранилище
    _saveCartToPrefs(updatedCart);
    // Оповещаем слушателей о новом состоянии корзины
    emit(CartState(updatedCart));
  }

  // Сохраняем корзину в хранилище SharedPreferences
  Future<void> _saveCartToPrefs(List<Products> cart) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> cartStringList =
        cart.map((product) => json.encode(product.toJson())).toList();

    prefs.setStringList('cart', cartStringList);
  }
}
