import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../../../shared/model/todo.dart';

class TodoManager {
  late List<ToDo> todosList = [];

  Future<void> loadTodos() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? todos = prefs.getString('todosList');
    if (todos != null) {
      Iterable decoded = jsonDecode(todos);
      todosList =
          decoded.map((model) => ToDo.fromJson(model)).toList().cast<ToDo>();
    } else {
      todosList = ToDo.todoList();
    }
  }

  Future<void> saveTodos() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('todosList', jsonEncode(todosList));
  }

  void handleTodoTap(ToDo todo) {
    todo.isDone = !todo.isDone!;
    saveTodos();
  }

  void handleAddTodo(String toDo) {
    todosList.add(ToDo(
      id: todosList.length + 1,
      description: toDo,
      isDone: false,
    ));
    saveTodos();
  }
}
