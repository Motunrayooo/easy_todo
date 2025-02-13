import 'package:easy_todo/core/utils/extensions.dart';
import 'package:easy_todo/features/auth/presentation/screens/login_screen.dart';
import 'package:easy_todo/features/home/presentation/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/themes/app_theme.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return const LoginScreen();
      }));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              AppColors.primaryColor.withOpacity(0.9),
              AppColors.primaryShade900,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        // height: context.size?.height,
        // width: context.size?.width,
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Center(
          child: Text(
            'Easy Todo!',
            style: context.textTheme.bodyMedium?.copyWith(
              fontSize: 40.sp,
              fontFamily: AppTheme.merienda,
              color: AppColors.white,
            ),
          ),
        ),
      ),
    );
  }
}
