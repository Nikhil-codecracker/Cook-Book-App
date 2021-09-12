import 'package:flutter/material.dart';

import '../pages/filters.dart';

class AppDrawer extends StatelessWidget {
  Widget buildList(String title, IconData icon, Function tapHandler) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        title,
        style: TextStyle(
          fontFamily: 'Roboto',
          fontSize: 24,
          fontWeight: FontWeight.bold, // bold = w700
        ),
      ),
      onTap: tapHandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Column(
      children: [
        Container(
          height: 120,
          width: double.infinity,
          padding: EdgeInsets.all(20),
          alignment: Alignment.centerLeft,
          color: Theme.of(context)
              .accentColor, // Vertically center Horizontally Left
          child: Text('Cooking Up!',
              style: TextStyle(
                fontWeight: FontWeight.w900,
                color: Theme.of(context).primaryColor,
                fontSize: 30,
              )),
        ),
        SizedBox(
          height: 20,
        ),
        buildList(
          'Meals',
          Icons.restaurant,
          () {
            Navigator.of(context).pushReplacementNamed('/');
          },
        ),
        buildList(
          'Filter', 
          Icons.settings, 
          () {
            Navigator.of(context).pushReplacementNamed(Filters.routeName);
          },
        ),
      ],
    ));
  }
}
