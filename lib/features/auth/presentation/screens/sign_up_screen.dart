import 'dart:developer';

import 'package:easy_todo/core/utils/extensions.dart';
import 'package:easy_todo/features/auth/presentation/screens/login_screen.dart';
import 'package:easy_todo/features/auth/presentation/screens/verify_email_screen.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/common_widgets/app_elevated_button.dart';
import '../../../../core/common_widgets/app_text_field.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/show_snackbar.dart';
import '../../../../core/utils/themes/app_theme.dart';
import '../../../../main.dart';
import '../../logic/auth_state_notifier.dart';

class SignUpScreen extends ConsumerStatefulWidget {
  const SignUpScreen({super.key});

  @override
  ConsumerState<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends ConsumerState<SignUpScreen> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController emailCtrl = TextEditingController();
  final TextEditingController passwordCtrl = TextEditingController();
  bool isObscure = true;

  @override
  void dispose() {
    emailCtrl.dispose();
    passwordCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                40.hi,
                Text(
                  'Hey Welcome!',
                  style: context.textTheme.bodyLarge
                      ?.copyWith(color: AppColors.black),
                ),
                Text(
                  'It\'s good to have you here',
                  style: context.textTheme.bodyMedium?.copyWith(
                    fontFamily: AppTheme.merienda,
                    fontSize: 14.sp,
                  ),
                ),
                18.hi,
                Text(
                  'Create account to proceed',
                  style: context.textTheme.bodyMedium,
                ),
                20.hi,
                AppTextField(
                  hintText: 'Enter email or phone number',
                  label: 'Email',
                  controller: emailCtrl,
                  autoValidateMode: AutovalidateMode.onUserInteraction,
                  validator: (email) =>
                      email != null && !EmailValidator.validate(email)
                          ? 'Enter a valid email'
                          : null,
                ),
                30.hi,
                AppTextField(
                  hintText: 'Enter password',
                  label: 'Password',
                  controller: passwordCtrl,
                  obscureText: isObscure,
                  suffixIcon: GestureDetector(
                    onTap: () {
                      setState(() {
                        isObscure = !isObscure;
                      });
                    },
                    child: Icon(
                      isObscure ? Icons.visibility : Icons.visibility_off,
                    ),
                  ),
                  autoValidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) => value != null && value.length < 6
                      ? 'Enter a min. of 6 characters'
                      : null,
                ),
                130.hi,
                AppElevatedButton(
                  label: 'Sign up',
                  isLoading: ref.watch(isLoadingStateProvider),
                  onTap: () async {
                    final isValid = formKey.currentState!.validate();
                    if (!isValid) return;
                    ref.read(isLoadingStateProvider.notifier).state = true;
                    try {
                      await FirebaseAuth.instance
                          .createUserWithEmailAndPassword(
                        email: emailCtrl.text,
                        password: passwordCtrl.text,
                      );
                      showSnackBar(
                        context,
                        'Account created successfully!',
                        AppColors.green,
                      );
                      ref.read(isLoadingStateProvider.notifier).state = false;
                      context.push(
                        MaterialPageRoute(builder: (context) {
                          return const VerifyEmailScreen();
                        }),
                      );
                    }on FirebaseAuthException catch (e) {
                      log('sign up exception: $e');
                      ref.read(isLoadingStateProvider.notifier).state = false;
                      showSnackBar(context, e.toString());
                    }
                  },
                ),
                10.hi,
                Center(
                  child: GestureDetector(
                    onTap: () {
                      context.push(
                        MaterialPageRoute(builder: (context) {
                          return const LoginScreen();
                        }),
                      );
                    },
                    child: RichText(
                      text: TextSpan(
                        text: 'Already have an account? ',
                        style: context.textTheme.bodySmall?.copyWith(
                          fontSize: 17.sp,
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text: 'Login',
                            style: context.textTheme.bodyMedium?.copyWith(
                              color: AppColors.secondaryColor,
                              fontSize: 17.sp,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ).padHorizontal(16),
          ),
        ),
      ),
    );
  }
}
