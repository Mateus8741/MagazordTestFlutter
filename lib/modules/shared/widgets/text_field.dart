import 'package:flutter/material.dart';

class GlobalInputField extends StatefulWidget {
  final Function(String) onAddItem;
  final Color buttonColor;

  const GlobalInputField({
    Key? key,
    required this.onAddItem,
    this.buttonColor = Colors.blue,
  }) : super(key: key);

  @override
  _TodoInputFieldState createState() => _TodoInputFieldState();
}

class _TodoInputFieldState extends State<GlobalInputField> {
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
              hintText: 'Digite aqui...',
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
              String newItem = _textController.text;
              widget.onAddItem(newItem);
              _textController.clear();
            },
          ),
        )
      ],
    );
  }
}
