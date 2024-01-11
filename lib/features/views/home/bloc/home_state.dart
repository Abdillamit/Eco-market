part of 'home_bloc.dart';

abstract class CardsState {}

class LoadingState extends CardsState {}

class LoadedState extends CardsState {
  final List<Category> categories;

  LoadedState(this.categories);
}

class ErrorState extends CardsState {
  final String error;

  ErrorState(this.error);
}
