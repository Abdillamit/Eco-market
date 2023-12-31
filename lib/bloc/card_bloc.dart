import 'package:eco_market/modules/category_list.dart';
import 'package:eco_market/utils/http/api_categorie_list.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'cards_state.dart';
part 'load_categories_event.dart';

class CardsBloc extends Bloc<CardsEvent, CardsState> {
  final ApiCategoryList api;

  CardsBloc(this.api) : super(LoadingState()) {
    on<LoadCategoriesEvent>((event, emit) async {
      try {
        final categories = await api.getCategories();
        // print('Categories: ${categories}');
        emit(LoadedState(categories));
      } catch (error) {
        print('Error fetching categories: $error');
        emit(ErrorState(error.toString()));
      }
    });
  }
}
