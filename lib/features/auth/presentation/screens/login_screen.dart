import 'dart:developer';

import 'package:easy_todo/core/common_widgets/app_elevated_button.dart';
import 'package:easy_todo/core/common_widgets/app_text_field.dart';
import 'package:easy_todo/core/utils/extensions.dart';
import 'package:easy_todo/features/auth/logic/auth_state_notifier.dart';
import 'package:easy_todo/features/auth/presentation/screens/sign_up_screen.dart';
import 'package:easy_todo/features/home/presentation/screens/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/show_snackbar.dart';
import '../../../../core/utils/themes/app_theme.dart';
import '../../../../main.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final TextEditingController emailCtrl = TextEditingController();
  final TextEditingController passwordCtrl = TextEditingController();
  bool isObscure = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              40.hi,
              Text(
                'Welcome back!',
                style: context.textTheme.bodyLarge
                    ?.copyWith(color: AppColors.black),
              ),
              10.hi,
              Text(
                'Login to proceed',
                style: context.textTheme.bodyMedium,
              ),
              20.hi,
              AppTextField(
                hintText: 'Enter email or phone number',
                label: 'Email',
                controller: emailCtrl,
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
              ),
              130.hi,
              AppElevatedButton(
                label: 'Login',
                isLoading: ref.watch(isLoadingStateProvider),
                onTap: () async {
                  ref.read(isLoadingStateProvider.notifier).state = true;
                  try {
                    await FirebaseAuth.instance.signInWithEmailAndPassword(
                      email: emailCtrl.text,
                      password: passwordCtrl.text,
                    );
                    ref.read(isLoadingStateProvider.notifier).state = false;
                    context.push(
                      MaterialPageRoute(builder: (context) {
                        return const HomeScreen();
                      }),
                    );
                  } on FirebaseAuthException catch (e) {
                    log('Login exception: $e');
                    showSnackBar(context, e.toString());
                    ref.read(isLoadingStateProvider.notifier).state = false;
                  }
                },
              ),
              10.hi,
              Center(
                child: GestureDetector(
                  onTap: () {
                    context.push(
                      MaterialPageRoute(builder: (context) {
                        return const SignUpScreen();
                      }),
                    );
                  },
                  child: RichText(
                    text: TextSpan(
                      text: 'New here? ',
                      style: context.textTheme.bodySmall?.copyWith(
                        fontSize: 17.sp,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Create an account',
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
    );
  }

  Future login() async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailCtrl.text,
        password: passwordCtrl.text,
      );
    } on FirebaseAuthException catch (e) {
      log('Login exception: $e');
      showSnackBar(context, e.toString());
    }
    navigatorKey.currentState
        ?.pushReplacement(MaterialPageRoute(builder: (context) {
      return const HomeScreen();
    }));
  }
}
