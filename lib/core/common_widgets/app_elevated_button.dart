import 'package:easy_todo/core/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/app_colors.dart';

class AppElevatedButton extends StatelessWidget {
  const AppElevatedButton({super.key, required this.onTap, required this.label});

  final void Function() onTap;
  final String label;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.primaryShade900,
          borderRadius: BorderRadius.all(
            Radius.circular(10.r),
          ),
        ),
        width: double.infinity,
        padding: EdgeInsets.symmetric(
          vertical: 10.w,
        ),
        child: Center(
          child: Text(
            label,
            style: context.textTheme.bodyMedium?.copyWith(
              color: AppColors.white,
            ),
          ),
        ),
      ),
    );
  }
}
