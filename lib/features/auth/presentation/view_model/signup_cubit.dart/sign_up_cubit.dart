import 'package:ecommerce_app_huma_volve/features/auth/data/models/signup_req_model.dart';
import 'package:ecommerce_app_huma_volve/features/auth/data/models/signup_res_model.dart';
import 'package:ecommerce_app_huma_volve/features/auth/domain/repositories/auth_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  final AuthRepo authRepo;
  SignUpCubit({required this.authRepo}) : super(SignUpInitial());

  Future<void> signUp({required SignupReqModel signupReqModel}) async {
    emit(SignUpLoading());
    final response = await authRepo.signUp(signupReqModel: signupReqModel);
    response.fold(
      (failure) => emit(SignUpFailure(errorMsg: failure.failureMessage)),
      (signUpModel) => emit(SignUpSuccess(signupResModel: signUpModel)),
    );
  }
}
