part of 'category_cubit.dart';

@immutable
sealed class CategoryCupitState {}

final class CategoryCupitInitial extends CategoryCupitState {}

final class CategoryLoaded extends CategoryCupitState {
  final List<String> categoriesName;

  CategoryLoaded({required this.categoriesName});
}

final class CategoryLoading extends CategoryCupitState {}

final class CategoryError extends CategoryCupitState {
  final String error;
  CategoryError({required this.error});
}
