import 'package:easy_todo/core/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'app_colors.dart';

void showSnackBar(BuildContext context, String content) {
  ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        margin: EdgeInsets.only(
            bottom: MediaQuery.of(context).size.height - 170,
            right: 20.w,
            left: 20.0.w),
        content: Text(
          content,
          style: context.textTheme.bodySmall?.copyWith(
            fontSize: 13.sp,
            color: AppColors.white
          ),
        ),
        backgroundColor: AppColors.red,
      ),
    );
}
