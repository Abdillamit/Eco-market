part of 'category_bloc.dart';

abstract class CategoryState {}

class LoadingState extends CategoryState {}

class LoadedState extends CategoryState {
  final List<Category> categories;

  LoadedState(this.categories);
}

class ErrorState extends CategoryState {
  final String error;

  ErrorState(this.error);
}
