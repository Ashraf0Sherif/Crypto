import 'package:crypto_app/core/helpers/extensions.dart';
import 'package:crypto_app/core/routing/routes.dart';
import 'package:crypto_app/core/widgets/app_text_form_field.dart';
import 'package:crypto_app/features/auth/presentation/widgets/auth_toggle_button.dart';
import 'package:crypto_app/features/auth/presentation/widgets/social_button.dart';
import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/widgets/app_button.dart';
import '../../../../gen/assets.gen.dart';
import '../widgets/fingerprint_button.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  bool _isSignIn = true;
  bool _isPasswordVisible = false;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 12,
            children: [
              const SizedBox(height: 16),

              Center(
                child: Container(
                  padding: const EdgeInsets.all(4),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: AppColors.surfaceContainerLow,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: AuthToggleButton(
                          title: 'Sign in',
                          isSelected: _isSignIn,
                          onTap: () => setState(() => _isSignIn = true),
                        ),
                      ),
                      Expanded(
                        child: AuthToggleButton(
                          title: 'Sign up',
                          isSelected: !_isSignIn,
                          onTap: () => setState(() => _isSignIn = false),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Text(
                _isSignIn ? 'Sign in' : 'Sign up',
                style: AppTextStyles.displaySm,
              ),
              Text('Email', style: AppTextStyles.titleSm),
              AppTextFormField(
                controller: _emailController,
                placeholder: 'Enter your email',
              ),

              Text('Password', style: AppTextStyles.titleSm),
              AppTextFormField(
                controller: _passwordController,
                placeholder: 'Enter your password',
                isPassword: true,
                isPasswordVisible: _isPasswordVisible,
                onToggleVisibility: () {
                  setState(() => _isPasswordVisible = !_isPasswordVisible);
                },
              ),
              Align(
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
              ),
              AppButton(
                text: 'Sign in',
                onTap: () => context.pushNamedAndRemoveUntil(
                  Routes.home,
                  predicate: (route) => false,
                ),
              ),
              const SizedBox(height: 10),

              Center(
                child: Text(
                  'Or login with',
                  style: AppTextStyles.labelMd.copyWith(
                    color: AppColors.onSurfaceMuted,
                  ),
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: SocialButton(
                      icon: Assets.svgs.facebook.path,
                      label: 'Facebook',
                      onTap: () {},
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: SocialButton(
                      icon: Assets.svgs.google.path,
                      label: 'Google',
                      onTap: () {},
                    ),
                  ),
                ],
              ),
              if (_isSignIn) Center(child: FingerprintButton()),
              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }
}
