import 'package:easy_todo/core/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/app_colors.dart';

class AppRadioTile extends StatelessWidget {
  AppRadioTile({
    super.key,
    required this.groupValue,
    required this.onChanged,
    required this.value,
    required this.label,
    this.isSelected = false,
  });

  final int? groupValue;
  final int value;
  final void Function(int?) onChanged;
  final String label;
  bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColors.primaryShade900,
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(10.r),
        ),
        color: isSelected ? AppColors.primaryShade900 : AppColors.white,
      ),
      width: double.infinity,
      child: Row(
        children: [
          Radio<int>(
            value: value,
            groupValue: groupValue,
            onChanged: onChanged,
            toggleable: true,
            activeColor: isSelected
                ? AppColors.secondaryColor
                : AppColors.primaryShade900,
            fillColor: MaterialStateProperty.all(
              isSelected ? AppColors.secondaryColor : AppColors.primaryShade900,
            ),
          ),
          10.wi,
          Text(
            label,
            style: context.textTheme.bodyMedium?.copyWith(
              fontSize: 17.sp,
              color: isSelected ? AppColors.white : AppColors.primaryShade900,
            ),
          )
        ],
      ),
    );
  }
}
