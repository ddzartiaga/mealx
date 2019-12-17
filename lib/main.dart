import 'package:flutter/material.dart';
import './screens/categories_screen.dart';
import './screens/main_screen.dart';
import './screens/meals_screen.dart';
import './screens/meal_detail_screen.dart';

void main() => runApp(MainApp());

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Meals",
      theme: ThemeData(
          primaryColor: Colors.orange,
          canvasColor: Colors.grey[100],
          appBarTheme: AppBarTheme(),
          textTheme: ThemeData.light().textTheme),
      initialRoute: "/",
      routes: {
        '/': (ctx) => MainScreen(),
        CategoriesScreen.route: (ctx) => CategoriesScreen(),
        MealsScreen.route: (ctx) => MealsScreen(),
        MealDetailScreen.route: (ctx) => MealDetailScreen(),
      },
    );
  }
}
