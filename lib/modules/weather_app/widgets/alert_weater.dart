import 'package:flutter/material.dart';

class AlertWeather extends StatelessWidget {
  final String titleText;
  final String contentText;

  const AlertWeather({
    Key? key,
    required this.titleText,
    required this.contentText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        titleText,
        style: const TextStyle(color: Colors.red),
        textAlign: TextAlign.center,
      ),
      content: Text(
        contentText,
        style: const TextStyle(color: Colors.red),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Ok'),
        ),
      ],
    );
  }
}
