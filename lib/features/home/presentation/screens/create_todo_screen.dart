import 'dart:developer';

import 'package:easy_todo/core/common_widgets/app_radio_tile.dart';
import 'package:easy_todo/core/common_widgets/app_text_field.dart';
import 'package:easy_todo/core/enums.dart';
import 'package:easy_todo/core/utils/extensions.dart';
import 'package:easy_todo/features/home/logic/todo_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uuid/uuid.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/themes/app_theme.dart';
import '../../data/model/todo_model.dart';

class CreateTodoScreen extends ConsumerStatefulWidget {
  const CreateTodoScreen({super.key});

  @override
  ConsumerState<CreateTodoScreen> createState() => _CreateTodoScreenState();
}

class _CreateTodoScreenState extends ConsumerState<CreateTodoScreen> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  int? selectedCategory;
  var uuid = Uuid();

  String todoId() {
    var id = uuid.v4();
    print('new id: $id');
    return id;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryShade900,
        leading: InkWell(
          onTap: () {
            context.pop();
          },
          child: const Icon(
            Icons.arrow_back_rounded,
            color: AppColors.white,
          ),
        ),
        centerTitle: true,
        title: Text(
          'Create your Todo',
          style: context.textTheme.bodyMedium?.copyWith(
            color: AppColors.white,
            fontSize: 18.sp,
            fontFamily: AppTheme.merienda,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            20.hi,
            AppTextField(
              label: 'Title:',
              hintText: 'Enter title',
              controller: titleController,
            ),
            20.hi,
            Text(
              'Categories',
              style: context.textTheme.bodySmall?.copyWith(
                color: AppColors.primaryShade900,
              ),
            ),
            10.hi,
            AppRadioTile(
              value: 1,
              groupValue: selectedCategory,
              onChanged: (value) {
                setState(() {
                  // If the same value is clicked, deselect it
                  selectedCategory = selectedCategory == 1 ? null : value;
                });
                ref.read(todoCategoryStateProvider.notifier).state = 'Personal';
              },
              isSelected: selectedCategory == 1,
              label: 'Personal',
            ),
            16.hi,
            AppRadioTile(
              value: 2,
              groupValue: selectedCategory,
              onChanged: (value) {
                setState(() {
                  // If the same value is clicked, deselect it
                  selectedCategory = selectedCategory == 2 ? null : value;
                });
                ref.read(todoCategoryStateProvider.notifier).state = 'Business';
              },
              isSelected: selectedCategory == 2,
              label: 'Business',
            ),
            20.hi,
            AppTextField(
              label: 'Description:',
              hintText: 'Enter description',
              controller: descriptionController,
              maxLines: 5,
            ),
            120.hi,
            GestureDetector(
              onTap: () {
                final TodoModel todo = TodoModel(
                    id: todoId(),
                    title: titleController.text,
                    description: descriptionController.text,
                    category: ref.watch(todoCategoryStateProvider));
                ref.read(todoStateProvider.notifier).addTodo(todo);

                context.pop();
              },
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
                    'Done',
                    style: context.textTheme.bodyMedium?.copyWith(
                      color: AppColors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ).padHorizontal(16),
    );
  }
}
