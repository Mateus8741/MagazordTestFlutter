import 'package:flutter/material.dart';

import '../../shared/model/todo.dart';

class TodoItem extends StatelessWidget {
  final ToDo todo;
  final onTodoChanged;

  const TodoItem({Key? key, required this.todo, required this.onTodoChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Tarefa ${todo.id!}',
          style: const TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        Container(
          margin: const EdgeInsets.only(bottom: 20),
          child: ListTile(
            onTap: () {
              onTodoChanged(todo);
            },
            enabled: !todo.isDone!,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            tileColor: Colors.black87,
            contentPadding: const EdgeInsets.all(10),
            title: Text(
              todo.description!,
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
                fontStyle: todo.isDone! ? FontStyle.italic : FontStyle.normal,
                decoration: todo.isDone! ? TextDecoration.lineThrough : null,
                decorationThickness: 3,
              ),
            ),
            trailing: todo.isDone!
                ? const Icon(
                    Icons.check_circle,
                    color: Colors.white,
                  )
                : const SizedBox(),
          ),
        ),
      ],
    );
  }
}
