import 'package:flutter/material.dart';

class WeatherInfo extends StatelessWidget {
  final String celcius;
  final String weatherType;
  final String imageUrl; // URL da imagem vinda da API

  const WeatherInfo({
    Key? key,
    required this.celcius,
    required this.weatherType,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.network(
          imageUrl, // URL da imagem da API
          height: 100,
          width: 100,
          errorBuilder: (context, error, stackTrace) {
            return const Icon(
              Icons.error, // Ícone de erro caso a imagem não carregue
              size: 100,
              color: Colors.red,
            );
          },
        ),
        const SizedBox(height: 10),
        Text(
          weatherType,
          style: const TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w300,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '$celcius °C',
              style: const TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
