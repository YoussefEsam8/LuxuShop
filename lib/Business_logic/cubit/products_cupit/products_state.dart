part of 'products_cubit.dart';

@immutable
sealed class ProductsState {}

final class ProductsInitial extends ProductsState {}

class ProductsLoading extends ProductsState {}

class ProductsSuccess extends ProductsState {
  ProductsSuccess(this.products);
  final List<Product> products;
}

class ProductsError extends ProductsState {
  final String error;
  ProductsError(this.error);
}
