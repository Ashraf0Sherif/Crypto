import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/networking/api_result.dart';
import '../data/repos/auth_repo.dart';
import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepo _authRepo;

  late TextEditingController emailController;
  late TextEditingController passwordController;
  late GlobalKey<FormState> formKey;

  AuthCubit(this._authRepo) : super(AuthInitial()) {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    formKey = GlobalKey<FormState>();
  }

  Future<void> submitAuth({required bool isSignIn}) async {
    if (formKey.currentState!.validate()) {
      emit(AuthLoading());

      final email = emailController.text.trim();
      final password = passwordController.text;

      final result = isSignIn 
          ? await _authRepo.signIn(email: email, password: password)
          : await _authRepo.signUp(email: email, password: password);

      switch (result) {
        case Success():
          emit(AuthSuccess());
        case Failure(error: final error):
          emit(AuthError(error));
      }
    }
  }

  @override
  Future<void> close() {
    emailController.dispose();
    passwordController.dispose();
    return super.close();
  }
}