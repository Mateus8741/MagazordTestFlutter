import 'package:flutter/material.dart';
import 'package:magazordtestf/modules/shared/widgets/logo.dart';
import 'package:magazordtestf/modules/shared/widgets/text_field.dart';

import '../../shared/model/todo.dart';
import '../data/storage/todo_manager.dart';
import '../widgets/todo_item.dart';

class TodoHomeScreen extends StatefulWidget {
  const TodoHomeScreen({Key? key}) : super(key: key);

  @override
  State<TodoHomeScreen> createState() => _TodoHomeScreenState();
}

class _TodoHomeScreenState extends State<TodoHomeScreen> {
  late TodoManager _todoManager = TodoManager();

  @override
  void initState() {
    super.initState();
    _todoManager = TodoManager();
    _loadData();
  }

  Future<void> _loadData() async {
    await _todoManager.loadTodos();
    setState(() {});
  }

  void _handleTodoTap(ToDo todo) {
    setState(() {
      _todoManager.handleTodoTap(todo);
    });
  }

  void _handleAddTodo(String toDo) {
    setState(() {
      _todoManager.handleAddTodo(toDo);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const LogoComponent(firstPartText: 'Todo'),
      ),
      body: Stack(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: GlobalInputField(
              onAddItem: (String newTodo) {
                _handleAddTodo(newTodo);
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            margin: const EdgeInsets.only(top: 100),
            child: ListView.builder(
              itemCount: _todoManager.todosList.length,
              itemBuilder: (context, index) {
                return TodoItem(
                  todo: _todoManager.todosList[index],
                  onTodoChanged: _handleTodoTap,
                );
              },
              physics: const BouncingScrollPhysics(),
            ),
          ),
        ],
      ),
    );
  }
}
