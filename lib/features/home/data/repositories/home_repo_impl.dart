import 'package:dartz/dartz.dart';
import 'package:ecommerce_app_huma_volve/core/error/error_handler.dart';
import 'package:ecommerce_app_huma_volve/core/failure/failure.dart';
import 'package:ecommerce_app_huma_volve/features/home/data/datasources/home_remote_datasource.dart';
import 'package:ecommerce_app_huma_volve/features/home/domain/entities/home_category_entity.dart';
import 'package:ecommerce_app_huma_volve/features/home/domain/entities/home_product_entity.dart';
import 'package:ecommerce_app_huma_volve/features/home/domain/repositories/home_repo.dart';

class HomeRepoImpl implements HomeRepo {
  final HomeRemoteDatasource homeRemoteDatasource;
  HomeRepoImpl(this.homeRemoteDatasource);

  @override
  Future<Either<Failure, List<HomeCategoryEntity>>> getCategories() async {
    try {
      final categories = await homeRemoteDatasource.getCategories();
      return Right(categories);
    } catch (e) {
      return Left(ErrorHandler.handle(e));
    }
  }

  @override
  Future<Either<Failure, List<HomeProductEntity>>> getProducts(
    int? categoryId, {
    required int limit,
    required int offset,
  }) async {
    try {
      final products = await homeRemoteDatasource.getProducts(
        categoryId,
        limit: limit,
        offset: offset,
      );
      return Right(products);
    } catch (e) {
      return Left(ErrorHandler.handle(e));
    }
  }


 @override
Future<Either<Failure, HomeProductEntity>> getProductById(int id) async {
  try {
    final product = await homeRemoteDatasource.getProductById(id);
    return Right(product);
  } catch (e) {
    return Left(ErrorHandler.handle(e));
  }
}
}
