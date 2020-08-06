import 'package:deli_meals/dummy_data.dart';
import 'package:deli_meals/screens/filters_screen.dart';
import 'package:deli_meals/widgets/meal_item.dart';
import 'package:deli_meals/models/meal.dart';
import 'package:flutter/material.dart';

class CategoryMealScreen extends StatelessWidget {
  final String categoryTitle;
  final String categoryId;
  final Color mealColor;

  CategoryMealScreen({this.categoryTitle, this.mealColor, this.categoryId});
  @override
  Widget build(BuildContext context) {
    final List<Meal> categoryMeals = DUMMY_MEALS
        .where((meal) => meal.categories.contains(categoryId))
        .where((meal) {
      if (!meal.isGlutenFree && FiltersScreen.isGlutenFree) {
        return false;
      }
      if (!meal.isLactoseFree && FiltersScreen.isLactoseFree) {
        return false;
      }
      if (!meal.isVegan && FiltersScreen.isVegan) {
        return false;
      }
      if (!meal.isVegetarian && FiltersScreen.isVegetarian) {
        return false;
      }

      return true;
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
        backgroundColor: mealColor,
      ),
      body:
          // Container(
          //   decoration: BoxDecoration(
          //     gradient: LinearGradient(
          //       begin: Alignment.topLeft,
          //       end: Alignment.bottomRight,
          //       colors: [mealColor.withOpacity(0.6), mealColor],
          //     ),
          //   ),
          // child:
          ListView.builder(
        itemBuilder: (context, index) {
          return MealItem(
            meal: categoryMeals[index],
            // mealTitle: categoryMeals[index].title,
            // mealComplexity: categoryMeals[index].complexity,
            // mealDuration: categoryMeals[index].duration,
            // mealAffordability: categoryMeals[index].affordability,
            // imageUrl: categoryMeals[index].imageUrl,
          );
        },
        itemCount: categoryMeals.length,
        itemExtent: 320.0,
      ),
      // ),
    );
  }
}
