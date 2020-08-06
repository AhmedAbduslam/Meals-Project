import 'package:deli_meals/screens/filters_screen.dart';
import 'package:deli_meals/screens/tabs_screen.dart';
import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 120.0,
            width: double.infinity,
            padding: const EdgeInsets.all(20.0),
            color: Theme.of(context).accentColor,
            child: Text(
              'Cooking Up!',
              style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 30.0,
                  color: Theme.of(context).primaryColor),
            ),
          ),
          SizedBox(height: 20.0),
          buildListTile(
              text: 'Meals',
              icon: Icons.restaurant,
              onTap: () => Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => TabsScreen()))),
          buildListTile(
            text: 'Filters',
            icon: Icons.settings,
            onTap: () => Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => FiltersScreen())),
          ),
        ],
      ),
    );
  }
}

ListTile buildListTile({String text, IconData icon, Function onTap}) {
  return ListTile(
    leading: Icon(icon),
    title: Text(
      text,
      style: TextStyle(
        fontFamily: 'RobotoCondensed',
        fontWeight: FontWeight.bold,
        fontSize: 26.0,
      ),
    ),
    onTap: onTap,
  );
}
