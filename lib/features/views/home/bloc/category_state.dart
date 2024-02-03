part of 'category_bloc.dart';

abstract class CategoryState {}

class LoadingState extends CategoryState {}

class LoadedState extends CategoryState {
  final List<Category> categories;
  final int selectedCategoryIndex;

  LoadedState({
    required this.categories,
    required this.selectedCategoryIndex,
  });

  LoadedState copyWith({
    List<Category>? categories,
    int? selectedCategoryIndex,
  }) {
    return LoadedState(
      categories: categories ?? this.categories,
      selectedCategoryIndex:
          selectedCategoryIndex ?? this.selectedCategoryIndex,
    );
  }

  List<Object> get props => [categories, selectedCategoryIndex];
}

class ErrorState extends CategoryState {
  final String error;

  ErrorState(this.error);
}
