import 'package:eco_market/modules/category_list.dart';
import 'package:eco_market/utils/http/api_categorie_list.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'category_state.dart';
part 'category_event.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final ApiCategoryList api;

  CategoryBloc(this.api) : super(LoadingState()) {
    on<LoadCategoriesEvent>((event, emit) async {
      try {
        final categories = await api.getCategories();
        // print('Categories: dsiav[uafhd] ${categories}');
        emit(LoadedState(categories));
      } catch (error) {
        emit(ErrorState(error.toString()));
      }
    });
  }
}
