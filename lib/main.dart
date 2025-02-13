import 'package:easy_todo/core/utils/themes/app_theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'features/splash/presentation/screens/splash_sreen.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyAq2gu_p9xI5RMUskeRkjJqsqWKuRlQLRQ",
      appId: "1:344947341026:android:e51638370391397aae10bb",
      messagingSenderId: "344947341026",
      projectId: "easy-todo-25253",
    ),
  );
  runApp(const EasyTodo());
}
final navigatorKey = GlobalKey<NavigatorState>();
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
              navigatorKey: navigatorKey,
              debugShowCheckedModeBanner: false,
              theme: AppTheme.lightTheme,
              darkTheme: AppTheme.darkTheme,
              home: const SplashScreen(),
            );
          }),
    );
  }
}
