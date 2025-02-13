import 'dart:developer';

import 'package:easy_todo/core/utils/extensions.dart';
import 'package:easy_todo/features/auth/presentation/screens/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/common_widgets/app_elevated_button.dart';
import '../../../../core/common_widgets/app_text_field.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/themes/app_theme.dart';
import '../../../../main.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController emailCtrl = TextEditingController();
  final TextEditingController passwordCtrl = TextEditingController();

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
              ),
              30.hi,
              AppTextField(
                hintText: 'Enter password',
                label: 'Password',
                controller: passwordCtrl,
              ),
              130.hi,
              AppElevatedButton(
                label: 'Sign up',
                onTap: createAccount,
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
    );
  }

  Future createAccount() async {
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
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailCtrl.text,
        password: passwordCtrl.text,
      );
    } on FirebaseAuthException catch (e) {
      log('sign up exception: $e');
    }
    navigatorKey.currentState?.popUntil((route) => route.isFirst);
  }
}
