part of 'category_bloc.dart';

abstract class CategoryEvent {}

class LoadCategoriesEvent extends CategoryEvent {}

class SelectCategoryEvent extends CategoryEvent {
  final int index;

  SelectCategoryEvent(this.index);
}
