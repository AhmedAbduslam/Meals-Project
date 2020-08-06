import 'package:deli_meals/models/meal.dart';
import 'package:deli_meals/screens/favorites_screen.dart';
import 'package:flutter/material.dart';

class MealDetailScreen extends StatefulWidget {
  final Meal theMeal;

  const MealDetailScreen({this.theMeal});

  @override
  _MealDetailScreenState createState() => _MealDetailScreenState();
}

class _MealDetailScreenState extends State<MealDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.theMeal.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            buildImageContainer(context),
            buildTitle(context, 'Ingredients'),
            buildConstrainedBox(context, buildIngredientsList()),
            buildTitle(context, 'Steps'),
            buildConstrainedBox(context, buildStepListView()),
          ],
        ),
      ),
      floatingActionButton: FavouritesScreen.favouritesList
              .contains(widget.theMeal)
          ? FloatingActionButton(
              onPressed: () {
                setState(() =>
                    FavouritesScreen.favouritesList.remove(widget.theMeal));
              },
              child: Icon(Icons.star))
          : FloatingActionButton(
              onPressed: () {
                setState(
                    () => FavouritesScreen.favouritesList.add(widget.theMeal));
              },
              child: Icon(Icons.star_border),
            ),
    );
  }

  ListView buildStepListView() {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: widget.theMeal.steps.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              ListTile(
                leading: CircleAvatar(child: Text('${index + 1}')),
                title: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 5.0, horizontal: 10.0),
                  child: Text(widget.theMeal.steps[index]),
                ),
              ),
              Divider()
            ],
          );
        });
  }

  ConstrainedBox buildConstrainedBox(BuildContext context, Widget child) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxWidth: MediaQuery.of(context).size.width * 0.75,
        maxHeight: MediaQuery.of(context).size.height * 0.25,
      ),
      child: DecoratedBox(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            border: Border.all(color: Colors.grey),
            color: Colors.white),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
          child: child,
        ),
      ),
    );
  }

  ListView buildIngredientsList() {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: widget.theMeal.ingredients.length,
        itemBuilder: (context, index) {
          return Card(
            color: Theme.of(context).accentColor,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
              child: Text(widget.theMeal.ingredients[index]),
            ),
          );
        });
  }

  Container buildImageContainer(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.35,
      child: Image.network(widget.theMeal.imageUrl, fit: BoxFit.cover),
    );
  }

  Padding buildTitle(BuildContext context, String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Text(title, style: Theme.of(context).textTheme.title),
    );
  }
}
