import 'package:flutter/material.dart';

class LocaleWeather extends StatelessWidget {
  final String name;
  final String region;

  const LocaleWeather({
    Key? key,
    required this.name,
    required this.region,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          '$name, ',
          style: const TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          region,
          style: const TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w300,
          ),
        ),
      ],
    );
  }
}
