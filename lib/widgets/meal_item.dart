import 'package:flutter/material.dart';
import '../screens/meal_detail_screen.dart';
import '../models/meal.dart';

class MealItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  final int duration;
  final Affordability affordability;

  const MealItem({
    @required this.id,
    @required this.title,
    @required this.imageUrl,
    @required this.duration,
    @required this.affordability,
  });

  String get affordabilityText {
    switch (affordability) {
      case Affordability.Affordable:
        return "Affordable";

      case Affordability.Pricey:
        return "Pricey";

      case Affordability.Luxurious:
        return "Expensive";

      default:
        return "Unknown";
    }
  }

  void _showMealdetail(BuildContext context) {
    Navigator.of(context).pushNamed(MealDetailScreen.route, arguments: id);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: InkWell(
        onTap: () => _showMealdetail(context),
        child: Card(
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            children: <Widget>[
              Container(
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(15),
                    topLeft: Radius.circular(15),
                  ),
                  child: Stack(
                    children: <Widget>[
                      Image.network(
                        imageUrl,
                        fit: BoxFit.cover,
                        height: 100,
                        width: double.infinity,
                      ),
                      Positioned(
                        bottom: 2,
                        right: 2,
                        child: Container(
                          padding: const EdgeInsets.all(5),
                          color: Colors.black54,
                          width: 120,
                          child: Text(
                            "$title",
                            style: TextStyle(color: Colors.white),
                            softWrap: true,
                            overflow: TextOverflow.fade,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              FittedBox(
                child: Padding(
                  padding: const EdgeInsets.all(5),
                  child: Row(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Icon(Icons.timer),
                          Text("$duration mins"),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Icon(Icons.money_off),
                          Text("$affordabilityText"),
                        ],
                      ),
                      // Row(
                      //   children: <Widget>[
                      //     Icon(Icons.timer),
                      //     Text("$duration mins"),
                      //   ],
                      // ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
