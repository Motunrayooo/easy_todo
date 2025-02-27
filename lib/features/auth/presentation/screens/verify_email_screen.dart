import 'dart:async';
import 'dart:developer';

import 'package:easy_todo/core/common_widgets/app_elevated_button.dart';
import 'package:easy_todo/core/utils/extensions.dart';
import 'package:easy_todo/features/auth/presentation/screens/login_screen.dart';
import 'package:easy_todo/features/home/presentation/screens/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/show_snackbar.dart';

class VerifyEmailScreen extends StatefulWidget {
  const VerifyEmailScreen({super.key});

  @override
  State<VerifyEmailScreen> createState() => _VerifyEmailScreenState();
}

class _VerifyEmailScreenState extends State<VerifyEmailScreen> {
  bool isEmailVerified = false;
  Timer? timer;
  bool canSendEmail = false;

  @override
  void initState() {
    super.initState();
    isEmailVerified = FirebaseAuth.instance.currentUser!.emailVerified;
    if (!isEmailVerified) {
      sendVerificationEmail();

      timer = Timer.periodic(Duration(seconds: 3), (_) => checkEmailVerified());
    }
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  Future checkEmailVerified() async {
    // call after email is verified
    await FirebaseAuth.instance.currentUser?.reload();
    setState(() {
      isEmailVerified = FirebaseAuth.instance.currentUser!.emailVerified;
    });
    if (isEmailVerified) timer?.cancel();
  }

  Future sendVerificationEmail() async {
    try {
      final user = FirebaseAuth.instance.currentUser!;
      await user.sendEmailVerification();
      setState(() => canSendEmail = false);
      await Future.delayed(Duration(seconds: 5));
      setState(() => canSendEmail = true);
    } catch (e) {
      log('send verification error: $e');
      showSnackBar(context, e.toString());
    }
  }

  @override
  Widget build(BuildContext context) => isEmailVerified
      ? HomeScreen()
      : Scaffold(
          appBar: AppBar(
            backgroundColor: AppColors.primaryShade900,
            title: Text(
              'Verify Email',
              style: context.textTheme.bodySmall?.copyWith(
                color: AppColors.white,
              ),
            ),
          ),
          body: Column(
            children: [
              120.hi,
              Text(
                'A verification email has been sent\n to your email',
                style: context.textTheme.bodyMedium?.copyWith(
                  color: AppColors.black.withOpacity(0.8),
                ),
                textAlign: TextAlign.center,
              ),
              200.hi,
              AppElevatedButton(
                onTap: canSendEmail ? sendVerificationEmail : () {},
                label: 'Resend Email',
                isRow: true,
              ),
              20.hi,
              AppElevatedButton(
                onTap: () async {
                  timer?.cancel();
                  await FirebaseAuth.instance.signOut();
                  context.push(
                    MaterialPageRoute(builder: (context) {
                      return LoginScreen();
                    }),
                  );
                },
                label: 'Cancel',
                isFilled: false,
              ),
            ],
          ).padHorizontal(16),
        );
}
