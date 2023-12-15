import 'package:flutter/material.dart';
import 'package:magazordtestf/modules/bottom_navigation.dart';
import 'package:magazordtestf/modules/shared/api/weather_state.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => WeatherState(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: BottomTabsNavigation(),
      ),
    );
  }
}
