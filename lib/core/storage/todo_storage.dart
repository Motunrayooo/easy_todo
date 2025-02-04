import 'dart:convert';
import 'dart:developer';

import 'package:shared_preferences/shared_preferences.dart';

import '../../features/home/data/model/todo_model.dart';

class ToDoStorage {
  static const _todoKey = "easyToDo";

  static Future<void> saveTodos(List<TodoModel> todoModel) async {
    log('Saving todo');
    final prefs = await SharedPreferences.getInstance();
    final jsonList = todoModel.map((e) => e.toJson()).toList();
    prefs.setStringList(_todoKey, jsonList.map((e) => jsonEncode(e)).toList());
    log('I saved: $todoModel');
  }

  static Future<List<TodoModel>> getTodos() async {
    log('Getting todo');
    final prefs = await SharedPreferences.getInstance();
    final jsonList = prefs.getStringList(_todoKey) ?? [];
    return jsonList.map((e) => TodoModel.fromJson(jsonDecode(e))).toList();
  }
}
