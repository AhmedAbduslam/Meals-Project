import 'package:deli_meals/models/meal.dart';
import 'package:deli_meals/screens/meal_detail_screen.dart';
import 'package:flutter/material.dart';

class MealItem extends StatelessWidget {
  // final String mealTitle;
  // final Complexity mealComplexity;
  // final Affordability mealAffordability;
  // final int mealDuration;
  // final String imageUrl;
  final Meal meal;

  const MealItem({
    this.meal,
    //   this.mealTitle,
    // this.mealComplexity,
    // this.mealAffordability,
    // this.mealDuration,
    // this.imageUrl
  });

  String parse(enumItem) {
    if (enumItem == null) return null;
    return enumItem.toString().split('.')[1];
  }

  void selectMeal(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (_) => MealDetailScreen(theMeal: meal,)));
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectMeal(context),
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Card(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          elevation: 4.0,
          margin: EdgeInsets.all(10.0),
          child: Column(
            children: [
              Expanded(
                flex: 4,
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: NetworkImage(meal.imageUrl),
                    ),
                  ),
                  child: Stack(
                    children: [
                      Positioned(
                        bottom: 20.0,
                        right: 10.0,
                        child: Container(
                          width: 320.0,
                          color: Colors.black54,
                          padding: const EdgeInsets.symmetric(
                            vertical: 5.0,
                            horizontal: 20.0,
                          ),
                          child: Text(
                            meal.title,
                            style:
                                TextStyle(fontSize: 22.0, color: Colors.white),
                            overflow: TextOverflow.fade,
                            softWrap: true,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.schedule),
                        SizedBox(width: 6.0),
                        Text('${meal.duration} min')
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.work),
                        SizedBox(width: 6.0),
                        Text('${parse(meal.complexity)}'),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.attach_money),
                        SizedBox(width: 6.0),
                        Text('${parse(meal.affordability)}')
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
