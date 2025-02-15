import 'package:flutter/material.dart';
import 'app_colors.dart';

final messengerKey = GlobalKey<ScaffoldMessengerState>();

void showSnackBar(BuildContext context, String content) {
  // ScaffoldMessenger.of(context)
  messengerKey.currentState!
    ..hideCurrentSnackBar()
    ..showSnackBar(
      SnackBar(
        content: Text(content),
        backgroundColor: AppColors.red,
      ),
    );
}
