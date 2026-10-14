import 'package:ecommerce_app_huma_volve/core/network/api_client.dart';
import 'package:ecommerce_app_huma_volve/features/auth/data/repositories/auth_repo_impl.dart';
import 'package:ecommerce_app_huma_volve/features/auth/domain/repositories/auth_repo.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

Future<void> getItsetup() async {
  getIt.registerLazySingleton<ApiClient>(() => ApiClient());

  getIt.registerSingleton<AuthRepo>(
    AuthRepoImpl(apiClient: getIt<ApiClient>()),
  );
}
