part of 'category_bloc.dart';

sealed class CategoryEvent extends Equatable {
  const CategoryEvent();

  @override
  List<Object> get props => [];
}

class CategoryInitialEvent extends CategoryEvent {}

class GetCategoryEvent extends CategoryEvent {
  final String buissnessTypeId;
  const GetCategoryEvent(this.buissnessTypeId);
}
