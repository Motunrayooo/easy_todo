import 'package:easy_todo/core/storage/todo_storage.dart';
import 'package:easy_todo/core/utils/extensions.dart';
import 'package:easy_todo/features/home/data/model/todo_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/themes/app_theme.dart';
import '../../logic/todo_notifier.dart';
import '../widgets/todo_tile.dart';
import 'create_todo_screen.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int selectedTask = 1;
  bool? checkBoxValue = false;

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final todos = ref.watch(todoStateProvider);
    List<TodoModel> personalTodos = [];
    List<TodoModel> businessTodos = [];

    personalTodos =
        todos.where((element) => element.category == 'Personal').toList();
    businessTodos =
        todos.where((element) => element.category == 'Business').toList();

    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      floatingActionButton: GestureDetector(
        onTap: () {
          context.push(
            MaterialPageRoute(builder: (context) {
              return CreateTodoScreen();
            }),
          );
        },
        child: Container(
          width: 50.w,
          height: 50.h,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.secondaryColor,
          ),
          child: const Icon(
            Icons.add,
            color: AppColors.white,
          ),
        ).padOnly(
          bottom: 20.h,
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              50.hi,
              Text(
                'What\'s up, Mo\'!',
                style: context.textTheme.bodyLarge
                    ?.copyWith(fontSize: 34.sp, color: AppColors.white),
              ),
              30.hi,
              Text(
                'CATEGORIES',
                style: context.textTheme.bodySmall?.copyWith(
                  color: AppColors.white.withOpacity(0.5),
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              28.hi,
              TabBar(
                isScrollable: true,
                tabAlignment: TabAlignment.start,
                padding: EdgeInsets.only(
                  left: 18.h,
                ),
                controller: _tabController,
                dividerColor: Colors.transparent,
                indicatorPadding: EdgeInsets.symmetric(
                  horizontal: -20.h,
                  vertical: -10.w,
                ),
                indicator: BoxDecoration(
                  color: AppColors.primaryShade900,
                  borderRadius: BorderRadius.all(
                    Radius.circular(20.r),
                  ),
                ),
                labelPadding: EdgeInsets.only(
                  right: 20.w,
                  top: 6.h,
                  bottom: 6.h,
                ),
                tabs: [
                  Padding(
                    padding: EdgeInsets.only(
                      right: 12.w,
                      left: 12.w,
                    ),
                    child: Tab(
                      height: 70.h,
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              '${todos.length} Tasks',
                              // '${todoList.length} Tasks',
                              style: context.textTheme.bodySmall?.copyWith(
                                color: AppColors.white.withOpacity(0.5),
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              'All',
                              style: context.textTheme.bodyMedium?.copyWith(
                                color: AppColors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      right: 10.w,
                      left: 10.w,
                    ),
                    child: Tab(
                      height: 70.h,
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${personalTodos.length} Tasks',
                              style: context.textTheme.bodySmall?.copyWith(
                                color: AppColors.white.withOpacity(0.5),
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              'Personal',
                              style: context.textTheme.bodyMedium?.copyWith(
                                color: AppColors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      right: 10.w,
                      left: 10.w,
                    ),
                    child: Tab(
                      height: 70.h,
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${businessTodos.length} Tasks',
                              style: context.textTheme.bodySmall?.copyWith(
                                color: AppColors.white.withOpacity(0.5),
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              'Business',
                              style: context.textTheme.bodyMedium?.copyWith(
                                color: AppColors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              20.hi,
              Text(
                'Today\'s Tasks',
                style: context.textTheme.bodySmall?.copyWith(
                  color: AppColors.white.withOpacity(0.5),
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              20.hi,
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.6,
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    ListView.builder(
                      itemCount: todos.length,
                      itemBuilder: (BuildContext context, int index) {
                        final todo = todos[index];
                        return TodoTile(
                          selectedTask: selectedTask,
                          todoTitle: todo.title ?? '',
                          checkboxValue: checkBoxValue,
                        ).padVertical(8);
                      },
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.4,
                      child: ListView.builder(
                        itemCount: personalTodos.length,
                        itemBuilder: (BuildContext context, int index) {
                          final personalTodo = personalTodos[index];
                          return TodoTile(
                            selectedTask: selectedTask,
                            todoTitle: personalTodo.title ?? '',
                            checkboxValue: checkBoxValue,
                          ).padVertical(8);
                        },
                      ),
                    ),
                    SizedBox(
                        height: MediaQuery.of(context).size.height * 0.4,
                        child: ListView.builder(
                          itemCount: businessTodos.length,
                          itemBuilder: (BuildContext context, int index) {
                            final businessTodo = businessTodos[index];
                            return TodoTile(
                              selectedTask: selectedTask,
                              todoTitle: businessTodo.title ?? '',
                              checkboxValue: checkBoxValue,
                            ).padVertical(8);
                          },
                        )),
                  ],
                ),
              ),
            ],
          ).padHorizontal(16),
        ),
      ),
    );
  }
}
