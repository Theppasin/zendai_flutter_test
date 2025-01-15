import 'package:flutter/material.dart';
import 'package:zendai_flutter_test/meal.dart';
import 'package:zendai_flutter_test/meal_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  static final Meal _mealData = Meal(
      title: 'Fruit nutrition meal',
      description:
          'The pasta in the picture USES alkaline noodles, which many people are not very familiar with. The sauce is also very popular with the local people. If Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
      star: 9,
      commentCount: 1287,
      level: MealLevel.normal,
      distance: 1.7,
      period: 32,
      price: 14.0,
      image: 'assets/image/meal.jpg');

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.teal,
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.teal,
        brightness: Brightness.dark,
      ),
      home: MealScreen(meal: _mealData),
    );
  }
}
