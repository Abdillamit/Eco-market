import 'package:eco_market/modules/products_list.dart';
import 'package:eco_market/utils/http/api_products_list.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'products_event.dart';
part 'products_state.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  final ApiProductsList api;

  ProductsBloc(this.api) : super(LoadingStateProducts()) {
    on<FilterProductsByCategory>((event, emit) async {
      try {
        final products = await api.getProducts(event.categoryName);
        // print('products ${products}');
        emit(LoadedStateProducts(products));
      } catch (error) {
        // Оставьте комментарий, если вы хотите обрабатывать ошибку
        emit(ErrorStateProducts(error.toString()));
      }
    });
  }
}
