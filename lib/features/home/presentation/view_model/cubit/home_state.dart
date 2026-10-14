import 'package:ecommerce_app_huma_volve/features/home/domain/entities/home_category_entity.dart';
import 'package:ecommerce_app_huma_volve/features/home/domain/entities/home_product_entity.dart';

abstract class HomeState {}

class HomeInitial extends HomeState {}

class CategoriesLoading extends HomeState {}

class CategoriesSuccess extends HomeState {
  final List<HomeCategoryEntity> categories;
  CategoriesSuccess(this.categories);
}

class CategoriesError extends HomeState {
  final String errorMessage;
  CategoriesError(this.errorMessage);
}

class ProductsLoading extends HomeState {}

class ProductsSuccess extends HomeState {
  final List<HomeProductEntity> products;
  ProductsSuccess(this.products);
}

class ProductsError extends HomeState {
  final String errorMessage;
  ProductsError(this.errorMessage);
}
