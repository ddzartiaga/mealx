import 'package:flutter/material.dart';
import '../widgets/category_item.dart';
import '../dummy_data.dart';

class CategoriesScreen extends StatelessWidget {
  static const route = "/categories";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: GridView(
          children: DUMMY_CATEGORIES.map((cat) {
            return CategoryItem(
              id: cat.id,
              title: cat.title,
              color: cat.color,
            );
          }).toList(),
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            childAspectRatio: 3 / 2,
            maxCrossAxisExtent: 250,
            mainAxisSpacing: 15,
            crossAxisSpacing: 15,
          ),
        ),
      ),
    );
  }
}
