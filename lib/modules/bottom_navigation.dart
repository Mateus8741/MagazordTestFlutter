import 'package:flutter/material.dart';
import 'package:magazordtestf/modules/todo_app/screens/todo_home.dart';
import 'package:magazordtestf/modules/weather_app/screens/weather_home.dart';

class BottomTabsNavigation extends StatefulWidget {
  const BottomTabsNavigation({Key? key}) : super(key: key);

  @override
  State<BottomTabsNavigation> createState() => _BottomTabsNavigationState();
}

class _BottomTabsNavigationState extends State<BottomTabsNavigation> {
  int _currentIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  List _pages<Widget>() {
    const TodoHomeScreen();
    const WeatherHome();
    return [
      [const TodoHomeScreen()],
      [const WeatherHome()],
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: newMethod(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onItemTapped,
        selectedItemColor: _currentIndex == 0 ? Colors.blue : Colors.orange,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.list_alt_outlined,
            ),
            label: 'Todo',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.cloud),
            label: 'Weather',
          ),
        ],
      ),
    );
  }

  IndexedStack newMethod() {
    return IndexedStack(
      index: 0,
      children: _pages()[_currentIndex],
    );
  }
}
