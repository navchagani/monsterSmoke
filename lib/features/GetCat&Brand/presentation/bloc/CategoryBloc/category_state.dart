part of 'category_bloc.dart';

sealed class CategoryState extends Equatable {
  const CategoryState();

  @override
  List<Object> get props => [];
}

final class CategoryInitial extends CategoryState {}

class CategoryLoadingCategory extends CategoryState {}

class CategoryCompletedCategory extends CategoryState {
  final List<CategoryModel> lilstContries;

  const CategoryCompletedCategory({required this.lilstContries});
}

class CategoryErrorCategory extends CategoryState {
  final DioException error;

  const CategoryErrorCategory({required this.error});
}
