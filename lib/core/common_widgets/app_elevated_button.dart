import 'package:easy_todo/core/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../utils/app_colors.dart';

class AppElevatedButton extends StatelessWidget {
  AppElevatedButton({
    super.key,
    required this.onTap,
    required this.label,
    this.isLoading = false,
  });

  final void Function() onTap;
  final String label;
  bool isLoading;

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
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              isLoading
                  ?  SpinKitChasingDots(
                      color: AppColors.white,
                size: 20.h,
                    )
                  : const SizedBox(),
              isLoading ? 6.wi : 0.wi,
              Text(
                label,
                style: context.textTheme.bodyMedium?.copyWith(
                  color: AppColors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
