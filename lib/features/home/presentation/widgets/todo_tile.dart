import 'package:easy_todo/core/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_colors.dart';
import '../../data/model/todo_model.dart';
import '../../logic/todo_notifier.dart';

class TodoTile extends ConsumerStatefulWidget {
  TodoTile({
    // super.key,
    required this.todoTitle,
    required this.todo,
    required this.key,
    required this.onDismissed,
  });

  final String todoTitle;

  final TodoModel todo;
  final Key key;
  final void Function(DismissDirection)? onDismissed;

  @override
  ConsumerState<TodoTile> createState() => _TodoTileState();
}

class _TodoTileState extends ConsumerState<TodoTile> {
  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: widget.key,
      direction: DismissDirection.endToStart,
      background: Container(
        decoration: const BoxDecoration(
          color: AppColors.red,
        ),
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
        ),
        child: const Icon(
          Icons.delete,
          color: AppColors.white,
        ),
      ),
      onDismissed: widget.onDismissed,
      child: Container(
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
            Checkbox(
              value: widget.todo.isCompleted,
              onChanged: (bool? newValue) {
                ref
                    .read(todoStateProvider.notifier)
                    .toggleTodoStatus(widget.todo);
              },
              activeColor: AppColors.secondaryColor,
              side: const BorderSide(
                color: AppColors.secondaryColor,
                width: 1.5,
              ),
            ),
            Text(
              widget.todoTitle,
              style: context.textTheme.bodyMedium?.copyWith(
                  color: AppColors.white,
                  fontSize: 18.sp,
                  decoration: widget.todo.isCompleted
                      ? TextDecoration.lineThrough
                      : TextDecoration.none,
                  decorationColor: AppColors.white,
                  decorationThickness: 2.0),
            ),
          ],
        ),
      ),
    );
  }
}
