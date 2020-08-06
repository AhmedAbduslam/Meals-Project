import 'package:deli_meals/models/meal.dart';
import 'package:deli_meals/widgets/meal_item.dart';
import 'package:flutter/material.dart';

class FavouritesScreen extends StatelessWidget {
  static List<Meal> favouritesList = [];
  @override
  Widget build(BuildContext context) {
    return favouritesList.isEmpty
        ? Center(child: Text('list is empty'))
        : ListView.builder(
            itemBuilder: (context, index) {
              return MealItem(
                meal: favouritesList[index],
              );
            },
            itemCount: favouritesList.length,
            itemExtent: 320.0,
          );
  }
}
