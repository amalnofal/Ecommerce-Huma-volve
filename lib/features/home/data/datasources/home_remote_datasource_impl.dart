import 'package:ecommerce_app_huma_volve/core/constants/api_constants.dart';
import 'package:ecommerce_app_huma_volve/core/network/api_client.dart';
import 'package:ecommerce_app_huma_volve/features/home/data/datasources/home_remote_datasource.dart';
import 'package:ecommerce_app_huma_volve/features/home/data/models/category_model.dart';
import 'package:ecommerce_app_huma_volve/features/home/data/models/product_model.dart';

class HomeRemoteDatasourceImpl implements HomeRemoteDatasource {
  final ApiClient apiClient;
  HomeRemoteDatasourceImpl(this.apiClient);

  @override
  Future<List<CategoryModel>> getCategories() async {
    final response = await apiClient.dio.get(ApiConstants.categoriesEndpoint);

    final List<dynamic> jsonData = response.data;
    final List<CategoryModel> categories = jsonData
        .map((e) => CategoryModel.fromJson(e))
        .toList();

    return categories;
  }

  @override
  Future<List<ProductModel>> getProducts(int? categoryId) async {
    final response = await apiClient.dio.get(
      "${ApiConstants.categoriesEndpoint}/$categoryId/${ApiConstants.productsEndpoint}",
    );
    final List<dynamic> jsonData = response.data;
    final List<ProductModel> products = jsonData
        .map((e) => ProductModel.fromJson(e))
        .toList();

    return products;
  }
}
