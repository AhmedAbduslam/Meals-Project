import 'dart:ui';

import 'package:flutter/material.dart';

import '../screens/category_meal_screen.dart';

class CategoryItem extends StatelessWidget {
  final Color color;
  final String title;
  final String id;

  const CategoryItem({this.color, this.title, this.id});
  void selectCategory(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (_) => CategoryMealScreen(
                  categoryTitle: title,
                  mealColor: color,
                  categoryId: id,
                )));
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectCategory(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(25),
      child: Container(
        padding: const EdgeInsets.all(20),
        child: Text(title,
            style: Theme.of(context)
                .textTheme
                .title
                .copyWith(color: Color.fromRGBO(255, 254, 229, 1))),
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [color.withOpacity(0.7), color],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight),
            borderRadius: BorderRadius.circular(15)),
      ),
    );
  }
}
