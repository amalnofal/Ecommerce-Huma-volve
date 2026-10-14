import 'package:ecommerce_app_huma_volve/features/auth/data/models/login_model.dart';
import 'package:ecommerce_app_huma_volve/features/auth/domain/repositories/auth_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final AuthRepo authRepo;
  LoginCubit({required this.authRepo}) : super(LoginInitial());

  Future<void> logIn({required String email, required String password}) async {
    emit(LoginLoading());
    final response = await authRepo.login(email: email, password: password);
    response.fold(
      (failure) => emit(LoginFailure(errorMsg: failure.failureMessage)),
      (loginModel) => emit(LoginSuccess(loginModel: loginModel)),
    );
  }
}
