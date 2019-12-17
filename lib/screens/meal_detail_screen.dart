import 'package:flutter/material.dart';

import '../models/meal.dart';
import '../dummy_data.dart';

class MealDetailScreen extends StatelessWidget {
  static const route = "meal-detail";

  @override
  Widget build(BuildContext context) {
    var mealId = ModalRoute.of(context).settings.arguments as String;

    // TODO: Put this in a lifecycle method
    final Meal _meal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);
    final mediaQuery = MediaQuery.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("${_meal.title}"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Image.network(
              _meal.imageUrl,
              height: mediaQuery.size.height * 0.3,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: EdgeInsets.only(top: 10),
              child: Text(
                "Ingredients",
                style: Theme.of(context).textTheme.title,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                height: (mediaQuery.size.height * 0.7) * 0.4,
                child: ListView.separated(
                  separatorBuilder: (ctx, idx) {
                    return Divider(
                      color: Colors.grey,
                    );
                  },
                  itemCount: _meal.ingredients.length,
                  itemBuilder: (ctx, idx) {
                    return Text(_meal.ingredients[idx]);
                  },
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(2),
              child: Text(
                "Steps",
                style: Theme.of(context).textTheme.title,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                height: (mediaQuery.size.height * 0.7) * 0.6,
                child: ListView.builder(
                  itemCount: _meal.steps.length,
                  itemBuilder: (ctx, idx) {
                    return ListTile(
                      leading: CircleAvatar(child: Text("#${idx + 1}")),
                      title: Text(_meal.steps[idx]),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
