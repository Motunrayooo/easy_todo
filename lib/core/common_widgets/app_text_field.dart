import 'package:easy_todo/core/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/app_colors.dart';

class AppTextField extends StatelessWidget {
  AppTextField({
    super.key,
    required this.hintText,
    required this.label,
    required this.controller,
    this.onChanged,
    this.prefixIcon,
    this.maxLines = 1,
  });

  final String hintText,label;
  TextEditingController? controller;
  final void Function(String)? onChanged;
  final Widget? prefixIcon;
  int? maxLines;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: context.textTheme.bodySmall?.copyWith(
            color: AppColors.primaryShade900,
          ),
        ),
        10.hi,
        TextFormField(
          controller: controller,
          onChanged: onChanged,
          style: context.textTheme.bodySmall?.copyWith(color: AppColors.black),
          maxLines: maxLines,
          decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(vertical: 10.h,horizontal: 6.w,),
              hintText: hintText,
              hintStyle: context.textTheme.bodySmall
                  ?.copyWith(color: AppColors.white.withOpacity(0.6)),
              isDense: true,

              prefixIcon: prefixIcon,
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: AppColors.primaryShade900,
                  width: 1.1.w,
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(10.r),
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: AppColors.primaryShade900,
                  width: 1.1.w,
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(10.r),
                ),
              )),
        ),
      ],
    );
  }
}
