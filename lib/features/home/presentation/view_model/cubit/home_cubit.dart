import 'package:ecommerce_app_huma_volve/features/home/domain/entities/home_product_entity.dart';
import 'package:ecommerce_app_huma_volve/features/home/domain/usecases/get_categories_usecase.dart';
import 'package:ecommerce_app_huma_volve/features/home/domain/usecases/get_products_usecase.dart';
import 'package:ecommerce_app_huma_volve/features/home/presentation/view_model/cubit/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeState> {
  final GetCategoriesUsecase getCategoriesUsecase;
  final GetProductsUsecase getProductsUsecase;

  final int limit = 10;
  int offset = 0;

  bool isLoadingMore = false;
  bool hasMore = true;

  int? selectedCategory;
  final List<HomeProductEntity> _products = [];

  HomeCubit({
    required this.getCategoriesUsecase,
    required this.getProductsUsecase,
  }) : super(HomeInitial());

  Future<void> loadHomeData() async {
    emit(CategoriesLoading());

    final categoriesResult = await getCategoriesUsecase.invoke();

    final categories = categoriesResult.fold(
      (failure) {
        emit(CategoriesError(failure.failureMessage));
        return null;
      },
      (categories) {
        emit(CategoriesSuccess(categories));
        return categories;
      },
    );

    if (categories == null || categories.isEmpty) return;

    getProductsByCategory(categories.first.id);
  }

  void getProductsByCategory(int categoryId) async {
    hasMore = true;
    offset = 0;
    _products.clear();
    emit(ProductsLoading());

    final products = await getProductsUsecase.invoke(
      categoryId,
      limit: limit,
      offset: offset,
    );
    products.fold(
      (failure) {
        emit(ProductsError(failure.failureMessage));
      },
      (products) {
        _products.addAll(products);
        offset = products.length;
        if (products.length < limit) {
          hasMore = false;
        }
        selectedCategory = categoryId;
        emit(ProductsSuccess(List.from(_products)));
      },
    );
  }

  Future<void> loadMoreProduts() async {
    if (isLoadingMore || !hasMore) return;
    isLoadingMore = true;
    emit(ProductsLoadingMore());
    final result = await getProductsUsecase.invoke(
      selectedCategory,
      limit: limit,
      offset: offset,
    );

    result.fold(
      (failure) {
        emit(ProductsLoadingError(failure.failureMessage));
      },
      (newProducts) {
        _products.addAll(newProducts);
        offset += newProducts.length;
        if (newProducts.length < limit) {
          hasMore = false;
        }
        emit(ProductsSuccess(List.from(_products)));
      },
    );
  }
}
