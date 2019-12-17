import 'package:flutter/material.dart';

import '../widgets/meal_item.dart';
import '../models/meal.dart';
import '../dummy_data.dart';

class MealsScreen extends StatelessWidget {
  static const route = "/meals";

  @override
  @override
  Widget build(BuildContext context) {
    final cat =
        ModalRoute.of(context).settings.arguments as Map<String, String>;

    // TODO: Put this in a lifecycle method
    final List<Meal> _meals = DUMMY_MEALS
        .where((meal) => meal.categories.contains(cat["id"]))
        .toList();

    return Scaffold(
        appBar: AppBar(
          title: Text("${cat["title"]} Meals"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(5.0),
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 300,
              childAspectRatio: 3 / 2.8,
            ),
            itemCount: _meals.length,
            itemBuilder: (ctx, idx) {
              return MealItem(
                id: _meals[idx].id,
                title: _meals[idx].title,
                imageUrl: _meals[idx].imageUrl,
                duration: _meals[idx].duration,
                affordability: _meals[idx].affordability,
              );
            },
          ),
        ));
  }
}
