import 'dart:developer';

import 'package:easy_todo/core/common_widgets/app_elevated_button.dart';
import 'package:easy_todo/core/common_widgets/app_text_field.dart';
import 'package:easy_todo/core/utils/extensions.dart';
import 'package:easy_todo/features/auth/presentation/screens/sign_up_screen.dart';
import 'package:easy_todo/features/home/presentation/screens/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/themes/app_theme.dart';
import '../../../../main.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailCtrl = TextEditingController();
  final TextEditingController passwordCtrl = TextEditingController();

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
              ),
              130.hi,
              AppElevatedButton(
                label: 'Login',
                onTap: login,
              ),
              10.hi,
              Center(
                child: GestureDetector(
                  onTap: () {
                    context.push(
                      MaterialPageRoute(builder: (context) {
                        return SignUpScreen();
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

    }
    navigatorKey.currentState
        ?.pushReplacement(MaterialPageRoute(builder: (context) {
      return const HomeScreen();
    }));
  }
}
