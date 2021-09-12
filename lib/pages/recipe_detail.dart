import 'package:flutter/material.dart';

import '../dummy_data.dart';

class RecipeDetail extends StatelessWidget {
  static const routeName = '/Recipie';
  
  final Function _isFavourite;
  final Function _toggleFavourite;

  RecipeDetail(this._isFavourite,this._toggleFavourite);

  Widget buildSectionTitle(BuildContext ctx,String title){
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(
        title,
        style: Theme.of(ctx).textTheme.title,
      ),
    );
  }

  Widget buildContainer(Widget child){
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 15,
      ),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey),
      ),
      height: 200,
      width: 300,
      child: child
    );
  }

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context).settings.arguments as String;
    final selectedMeal = DUMMY_RECIPE.firstWhere((meal) => meal.id == mealId);

    return Scaffold(
      appBar: AppBar(
        title: Text(selectedMeal.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 300,
              child: Image.network(
                selectedMeal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            buildSectionTitle(context, 'Ingredients'),
            buildContainer(ListView.builder(
                itemBuilder: (ctx, idx) => Card(
                  color: Theme.of(context).accentColor,
                  child: Padding(
                      padding: EdgeInsets.all(10),
                      child: Text(selectedMeal.ingredients[idx])
                  ),
                ),
                itemCount: selectedMeal.ingredients.length,
              )
            ),
            buildSectionTitle(context, 'Steps'),
            buildContainer(
              ListView.builder(
                itemBuilder: (ctx,idx) => Column(
                  children: [
                    ListTile(
                      leading: CircleAvatar(
                        child: Text('# ${idx+1}'),
                      ),
                      title: Text(
                        selectedMeal.steps[idx],
                      ),
                    ),
                    Divider(), //to add a horizontal line
                  ],
                ),
                itemCount: selectedMeal.steps.length,
              )
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          _isFavourite(mealId) ? Icons.star:Icons.star_border,
        ),
        onPressed: () {_toggleFavourite(mealId);},
      ),
    );
  }
}
