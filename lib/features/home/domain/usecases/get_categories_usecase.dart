import 'package:dartz/dartz.dart';
import 'package:ecommerce_app_huma_volve/core/failure/failure.dart';
import 'package:ecommerce_app_huma_volve/features/home/domain/entities/home_category_entity.dart';
import 'package:ecommerce_app_huma_volve/features/home/domain/repositories/home_repo.dart';

class GetCategoriesUsecase {
  final HomeRepo homeRepo;

  GetCategoriesUsecase(this.homeRepo);

  Future<Either<Failure, List<HomeCategoryEntity>>> invoke() =>
      homeRepo.getCategories();
}
