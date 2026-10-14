import 'package:ecommerce_app_huma_volve/features/home/domain/entities/home_category_entity.dart';

class CategoryModel extends HomeCategoryEntity {
  CategoryModel({super.id, super.name});

  CategoryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }
}
