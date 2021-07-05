import 'package:deli_meals/widgets/main_drawer.dart';
import 'package:flutter/material.dart';

class FiltersScreen extends StatefulWidget {
  static bool isGlutenFree = false;
  static bool isLactoseFree = false;
  static bool isVegan = false;
  static bool isVegetarian = false;
  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Filters')),
      drawer: MainDrawer(),
      body: Column(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Text('Adjust your meal selection.',
                  style: Theme.of(context).textTheme.headline6),
            ),
          ),
          buildSwitchListTile(
              text: 'Gluten-free',
              currentValue: FiltersScreen.isGlutenFree,
              function: (newValue) => setState(() {
                    FiltersScreen.isGlutenFree = newValue;
                  })),
          buildSwitchListTile(
              text: 'Lactose-free',
              currentValue: FiltersScreen.isLactoseFree,
              function: (newValue) => setState(() {
                    FiltersScreen.isLactoseFree = newValue;
                  })),
          buildSwitchListTile(
              text: 'Vegetarian-free',
              currentValue: FiltersScreen.isVegetarian,
              function: (newValue) => setState(() {
                    FiltersScreen.isVegetarian = newValue;
                  })),
          buildSwitchListTile(
              text: 'Vegan-free',
              currentValue: FiltersScreen.isVegan,
              function: (newValue) => setState(() {
                    FiltersScreen.isVegan = newValue;
                  })),
        ],
      ),
    );
  }

  SwitchListTile buildSwitchListTile(
      {String text, bool currentValue, Function function}) {
    return SwitchListTile(
        title: Text(text),
        subtitle: Text('Only include $text meals'),
        value: currentValue,
        onChanged: function);
  }
}
