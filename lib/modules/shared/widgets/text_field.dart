import 'package:flutter/material.dart';

class TodoInputField extends StatefulWidget {
  final Function(String) onAddTodo;
  final Color buttonColor;

  const TodoInputField(
      {Key? key, required this.onAddTodo, this.buttonColor = Colors.blue})
      : super(key: key);

  @override
  _TodoInputFieldState createState() => _TodoInputFieldState();
}

class _TodoInputFieldState extends State<TodoInputField> {
  final TextEditingController _textController = TextEditingController();

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            textCapitalization: TextCapitalization.words,
            controller: _textController,
            decoration: const InputDecoration(
              hintText: 'Digite sua tarefa...',
              focusColor: Colors.blue,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(8),
                ),
              ),
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(left: 10),
          decoration: BoxDecoration(
            color: widget.buttonColor,
            borderRadius: BorderRadius.circular(8),
          ),
          child: IconButton(
            icon: const Icon(Icons.add, color: Colors.white, size: 30),
            onPressed: () {
              String newTodo = _textController.text;
              widget.onAddTodo(newTodo);
              _textController.clear();
            },
          ),
        )
      ],
    );
  }
}