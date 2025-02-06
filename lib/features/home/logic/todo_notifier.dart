import 'package:easy_todo/core/storage/todo_storage.dart';
import 'package:easy_todo/features/home/data/model/todo_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final todoCategoryStateProvider = StateProvider<String>((ref) => '');

final todoStateProvider =
    StateNotifierProvider<TodoStateNotifier, List<TodoModel>>(
        (ref) => TodoStateNotifier());

class TodoStateNotifier extends StateNotifier<List<TodoModel>> {
  TodoStateNotifier() : super([]) {
    loadTodoFromStorage();
  }

  Future<void> loadTodoFromStorage() async {
    state = await ToDoStorage.getTodos();
  }

  ///another way to write the add method
  // void addTodo(TodoModel todoModel) {
  //   state.add(todoModel);
  // }

  Future<void> addTodo(TodoModel todoModel) async {
    state = [...state, todoModel];
    await ToDoStorage.saveTodos(state);
  }

 Future<void>  removeTodo(String id) async{
    state = state.where((todo) => todo.id != id).toList();
    await ToDoStorage.saveTodos(state);
  }

  void toggleTodoStatus(TodoModel todo) {
    state = state.map((t) {
      if (t == todo) {
        return TodoModel(
          title: t.title,
          category: t.category,
          isCompleted: !t.isCompleted,
          id: t.title,
          description: t.description,
        );
      }
      return t;
    }).toList();
  }
}
