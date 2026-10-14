import 'package:dartz/dartz.dart';
import 'package:ecommerce_app_huma_volve/core/constants/api_constants.dart';
import 'package:ecommerce_app_huma_volve/core/error/error_handler.dart';
import 'package:ecommerce_app_huma_volve/core/failure/failure.dart';
import 'package:ecommerce_app_huma_volve/core/network/api_client.dart';
import 'package:ecommerce_app_huma_volve/features/auth/data/models/signup_req_model.dart';
import 'package:ecommerce_app_huma_volve/features/auth/data/models/signup_res_model.dart';
import 'package:ecommerce_app_huma_volve/features/auth/domain/repositories/auth_repo.dart';
import 'package:ecommerce_app_huma_volve/features/auth/data/models/login_model.dart';

class AuthRepoImpl implements AuthRepo {
  final ApiClient apiClient;

  AuthRepoImpl({required this.apiClient});

  @override
  Future<Either<Failure, LoginModel>> login({
    required String email,
    required String password,
  }) async {
    try {
      final response = await apiClient.dio.post(
        ApiConstants.loginEndpoint,
        data: {'email': email, 'password': password},
      );

      final Map<String, dynamic> jsonData = response.data;
      final modelData = LoginModel.fromJson(jsonData);

      return right(modelData);
    } catch (e) {
      return left(ErrorHandler.handle(e));
    }
  }

  @override
  Future<Either<Failure, SignupResModel>> signUp({
    required SignupReqModel signupReqModel,
  }) async {
    try {
      final response = await apiClient.dio.post(
        ApiConstants.signupEndpoint,
        data: {
          "name": signupReqModel.name,
          "email": signupReqModel.email,
          "password": signupReqModel.password,
          "avatar": "https://picsum.photos/800",
        },
      );

      return right(SignupResModel.fromJson(response.data));
    } catch (e) {
      return left(ErrorHandler.handle(e));
    }
  }
}
