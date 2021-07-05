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
          children: [
            buildImageContainer(),
            _buildExpandedList('Ingredients', _buildIngredientsList),
            _buildExpandedList('Steps', buildStepListView),
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

  ListView get buildStepListView {
    return ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
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

  Container buildImageContainer() {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.35,
      child: Image.network(widget.theMeal.imageUrl, fit: BoxFit.cover),
    );
  }

  ListView get _buildIngredientsList {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: widget.theMeal.ingredients.length,
        physics: NeverScrollableScrollPhysics(),
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

  Widget _buildExpandedList(String title, ListView list) {
    return ExpansionTile(
      title: Text(title, style: Theme.of(context).textTheme.headline6),
      children: [list],
    );
  }
}
