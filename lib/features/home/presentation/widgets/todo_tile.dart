import 'package:easy_todo/core/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_colors.dart';

class TodoTile extends StatefulWidget {
  TodoTile({
    super.key,
    required this.selectedTask,
    required this.todoTitle,
    this.checkboxValue = false,
  });

  final int selectedTask;
  final String todoTitle;
  bool? checkboxValue;

  @override
  State<TodoTile> createState() => _TodoTileState();
}

class _TodoTileState extends State<TodoTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        vertical: 5.h,
      ),
      decoration: BoxDecoration(
        color: AppColors.primaryShade900,
        borderRadius: BorderRadius.all(
          Radius.circular(8.r),
        ),
      ),
      child: Row(
        children: [
          // Radio(
          //   value: selectedTask,
          //   groupValue: selectedTask,
          //   onChanged: (value) {},
          // ),
          Checkbox(
            value: widget.checkboxValue,
            onChanged: (bool? newValue) {
              setState(() {
                widget.checkboxValue = newValue;
              });
            },
            activeColor: AppColors.secondaryColor,
            side: BorderSide(
              color: AppColors.secondaryColor,
              width: 1.5,
            ),

          ),
          Text(
            widget.todoTitle,
            style: context.textTheme.bodyMedium?.copyWith(
              color: AppColors.white,
              fontSize: 18.sp,
            ),
          ),
        ],
      ),
    );
  }
}
