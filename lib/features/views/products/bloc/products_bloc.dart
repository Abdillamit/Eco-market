import 'package:eco_market/modules/products_list.dart';
import 'package:eco_market/utils/http/api_products_list.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'products_event.dart';
part 'products_state.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  final ApiProductsList api;
  ProductsBloc(this.api) : super(const LoadingStateProducts()) {
    on<FilterProductsByCategory>((event, emit) async {
      emit(LoadingStateProducts());
      try {
        final products = await api.getProducts(event.categoryName);
        emit(LoadedStateProducts(products));
      } catch (error) {
        emit(ErrorStateProducts(error.toString()));
      }
    });

    on<SearchCardEvent>((event, emit) async {
      try {
        final products = await api.getProducBySearch(event.query);
        emit(LoadedStateProducts(products));
      } catch (error) {
        emit(ErrorStateProducts(error.toString()));
      }
    });
  }
}
