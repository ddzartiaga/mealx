import 'package:flutter/material.dart';

import '../screens/meals_screen.dart';

class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final Color color;

  const CategoryItem({
    @required this.id,
    @required this.title,
    this.color = Colors.orangeAccent,
  });

  void _showMeals(BuildContext context) {
    Navigator.of(context).pushNamed(MealsScreen.route, arguments: {
      "id": id,
      "title": title,
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _showMeals(context),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            gradient: LinearGradient(
              colors: [color.withOpacity(0.5), color],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            )),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text(title),
        ),
      ),
    );
  }
}
