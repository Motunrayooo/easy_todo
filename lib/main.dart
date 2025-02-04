import 'package:easy_todo/core/utils/themes/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'features/splash/presentation/screens/splash_sreen.dart';

void main() {
  runApp(const EasyTodo());
}

class EasyTodo extends StatelessWidget {
  const EasyTodo({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: ScreenUtilInit(
          designSize: const Size(375, 812),
          minTextAdapt: true,
          builder: (context, child) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: AppTheme.lightTheme,
              darkTheme: AppTheme.darkTheme,
              home: SplashScreen(),
            );
          }),
    );
  }
}
