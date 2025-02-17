import 'dart:developer';

import 'package:easy_todo/core/common_widgets/app_elevated_button.dart';
import 'package:easy_todo/core/common_widgets/app_text_field.dart';
import 'package:easy_todo/core/utils/extensions.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/show_snackbar.dart';
import '../../logic/auth_state_notifier.dart';

class ForgotPasswordScreen extends ConsumerStatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  ConsumerState<ForgotPasswordScreen> createState() =>
      _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends ConsumerState<ForgotPasswordScreen> {
  final emailCtrl = TextEditingController();

  @override
  void dispose() {
    emailCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryShade900,
        leading: BackButton(
          color: AppColors.white,
          onPressed: () {
            context.pop();
          },
        ),
        title: Text(
          'Reset Password',
          style: context.textTheme.bodySmall?.copyWith(
            color: AppColors.white,
          ),
        ),
      ),
      body: SingleChildScrollView(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          100.hi,
          Text(
            'Receive an email to reset password',
            style: context.textTheme.bodyMedium,
          ),
          50.hi,
          AppTextField(
            hintText: 'Enter email',
            label: 'Email',
            controller: emailCtrl,
            autoValidateMode: AutovalidateMode.onUserInteraction,
            validator: (email) =>
                email != null && !EmailValidator.validate(email)
                    ? 'Enter a valid email'
                    : null,
          ),
          160.hi,
          AppElevatedButton(
            onTap: () async {
              ref.read(isLoadingStateProvider.notifier).state = true;
              try {
                await FirebaseAuth.instance
                    .sendPasswordResetEmail(email: emailCtrl.text.trim());
                showSnackBar(
                  context,
                  'Password reset email sent!',
                  AppColors.green,
                );
                ref.read(isLoadingStateProvider.notifier).state = false;
                context.pop();
              } on FirebaseAuthException catch (e) {
                log('Reset Password exception: $e');
                ref.read(isLoadingStateProvider.notifier).state = false;
                showSnackBar(context, e.toString());
              }
            },
            isLoading: ref.watch(isLoadingStateProvider),
            label: 'Reset Password',
            isRow: true,
          ),
        ],
      ).padHorizontal(16)),
    );
  }

}
