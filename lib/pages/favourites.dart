import 'package:flutter/material.dart';

import '../widgets/recipie_card.dart';

class Favourites extends StatelessWidget {
  final _favouriteMeals;

  Favourites(this._favouriteMeals);

  @override
  Widget build(BuildContext context) {
    return _favouriteMeals.isEmpty?Center(
      child: Text('Favourite Meals'),
    ):
    ListView.builder(
      itemBuilder: (ctx, idx) {
        return RecipeCard(
          _favouriteMeals[idx].id,
          _favouriteMeals[idx].title,
          _favouriteMeals[idx].imageUrl,
          _favouriteMeals[idx].duration,
          _favouriteMeals[idx].complexity,
          _favouriteMeals[idx].affordability,
        );
      },
      itemCount: _favouriteMeals.length,
    );
  }
}