import 'package:easy_todo/features/auth/presentation/screens/login_screen.dart';
import 'package:easy_todo/features/home/presentation/screens/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../features/auth/presentation/screens/verify_email_screen.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            // return HomeScreen();
            return VerifyEmailScreen();
          } else {
            return LoginScreen();
          }
        },
      ),
    );
  }
}
