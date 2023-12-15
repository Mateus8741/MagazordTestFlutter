import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

import '../model/weather.dart';

class WeatherManager {
  Future<WeatherData?> fetchWeatherData(String value) async {
    try {
      await dotenv.load(fileName: '.env');
      final String apiKey = dotenv.env['API_KEY']!;
      final String apiUrl = '${dotenv.env['BASE_URL']}key=$apiKey&q=$value';

      final response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        final Map<String, dynamic> json = jsonDecode(response.body);
        return WeatherData.fromJson(json);
      } else {
        return null;
      }
    } catch (error) {
      print('Erro: $error');
      return null;
    }
  }
}
