import 'package:crypto_app/core/helpers/extensions.dart';
import 'package:crypto_app/core/routing/routes.dart';
import 'package:crypto_app/core/widgets/app_text_form_field.dart';
import 'package:crypto_app/features/auth/logic/auth_cubit.dart';
import 'package:crypto_app/features/auth/logic/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/widgets/app_button.dart';
import '../widgets/auth_header.dart';
import '../widgets/auth_toggle_bar.dart';
import '../widgets/fingerprint_button.dart';
import '../widgets/social_login_section.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  bool _isSignIn = true;
  bool _isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<AuthCubit>();
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: BlocConsumer<AuthCubit, AuthState>(
          listener: (context, state) {
            if (state is AuthSuccess) {
              context.pushNamedAndRemoveUntil(
                Routes.nav,
                predicate: (route) => false,
              );
            } else if (state is AuthError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.message),
                  backgroundColor: AppColors.errorContainer,
                  behavior: SnackBarBehavior.floating,
                ),
              );
            }
          },
          builder: (context, state) {
            return SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Form(
                key: cubit.formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 16),
                    AuthToggleBar(
                      isSignIn: _isSignIn,
                      onToggle: () => setState(() => _isSignIn = !_isSignIn),
                    ),
                    const SizedBox(height: 10),
                    Center(child: AuthHeader(isSignIn: _isSignIn)),
                    const SizedBox(height: 12),
                    
                    Text('Email', style: AppTextStyles.titleSm),
                    const SizedBox(height: 8),
                    AppTextFormField(
                      controller: cubit.emailController,
                      placeholder: 'Enter your email',
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value == null || value.isEmpty) return 'Please enter your email';
                        if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
                          return 'Please enter a valid email';
                        }
                        return null;
                      },
                    ),
                    
                    const SizedBox(height: 12),
                    Text('Password', style: AppTextStyles.titleSm),
                    const SizedBox(height: 8),
                    AppTextFormField(
                      controller: cubit.passwordController,
                      placeholder: 'Enter your password',
                      isPassword: true,
                      isPasswordVisible: _isPasswordVisible,
                      onToggleVisibility: () {
                        setState(() => _isPasswordVisible = !_isPasswordVisible);
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) return 'Please enter your password';
                        if (value.length < 6) return 'Password must be at least 6 characters';
                        return null;
                      },
                    ),

                    _buildForgotPassword(),
                    const SizedBox(height: 12),
                    
                    AppButton(
                      text: _isSignIn ? 'Sign in' : 'Sign up',
                      onTap: () => cubit.submitAuth(isSignIn: _isSignIn),
                      isLoading: state is AuthLoading,
                    ),

                    const SizedBox(height: 16),
                    SocialLoginSection(),
                    if (_isSignIn) Center(child: const FingerprintButton()),
                    const SizedBox(height: 32),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }


  Widget _buildForgotPassword() {
    return Align(
      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed: () {},
        child: Text(
          'Forgot password?',
          style: AppTextStyles.labelMd.copyWith(
            color: AppColors.primary,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}