import 'package:flutter/material.dart';
import 'package:magazordtestf/modules/shared/widgets/logo.dart';
import 'package:magazordtestf/modules/shared/widgets/text_field.dart';

import '../../shared/model/todo.dart';
import '../widgets/todo_item.dart';

class TodoHomeScreen extends StatefulWidget {
  const TodoHomeScreen({super.key});

  @override
  State<TodoHomeScreen> createState() => _TodoHomeScreenState();
}

class _TodoHomeScreenState extends State<TodoHomeScreen> {
  final todosList = ToDo.todoList();

  void _handleTodoTap(ToDo todo) {
    setState(() {
      todo.isDone = !todo.isDone!;
    });
  }

  void _handleAddTodo(String toDo) {
    setState(() {
      todosList.add(ToDo(
        id: todosList.length + 1,
        description: toDo,
        isDone: false,
      ));
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
                itemCount: todosList.length,
                itemBuilder: (context, index) {
                  return TodoItem(
                      todo: todosList[index], onTodoChanged: _handleTodoTap);
                },
                physics: const BouncingScrollPhysics(),
              ),
            ),
          ],
        ));
  }
}
