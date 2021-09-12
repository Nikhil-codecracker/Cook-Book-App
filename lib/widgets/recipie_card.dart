import 'package:flutter/material.dart';

import '../models/recipe.dart';
import '../pages/recipe_detail.dart';

class RecipeCard extends StatelessWidget {
  final String id;
  final String title;
  final int duration;
  final String imageUrl;
  final Complexity complexity;
  final Affordability affordability;

  RecipeCard(
    this.id,
    this.title,
    this.imageUrl,
    this.duration,
    this.complexity,
    this.affordability,
  );

  String get complexityText {
    if (complexity == Complexity.Simple) {
      return 'Simple';
    } else if (complexity == Complexity.Challenging) {
      return 'Challenging';
    } else if (complexity == Complexity.Hard) {
      return 'Hard';
    } else {
      return 'Unknown';
    }
  }

  String get affordabilityText {
    if (affordability == Affordability.Affordable) {
      return 'Affordable';
    } else if (affordability == Affordability.Pricey) {
      return 'Pricey';
    } else if (affordability == Affordability.Luxurious) {
      return 'Luxurious';
    } else {
      return 'Unknown';
    }
  }

  void selectRecipie(BuildContext ctx) {
    Navigator.pushNamed(
      ctx,
      RecipeDetail.routeName,
      arguments: id,
    ).then((result){ // this function is executed when we pop a page from the stack
      if(result!=null){
        //removeRecipe(result);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () => selectRecipie(context),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          elevation: 4,
          margin: EdgeInsets.all(10),
          child: Column(
            children: [
              Stack(
                // All the elements that are to be put on top of each other are put in stack
                children: [
                  ClipRRect(
                      // It is used to force the child into its shape or style
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15)),
                      child: Image.network(imageUrl,
                          height: 250,
                          width: double.infinity,
                          fit: BoxFit.cover)
                  ),
                  Positioned(
                    //can only be used inside Stack widget
                    bottom: 12,
                    right: 10,
                    child: Container(
                      color: Colors.black54,
                      width: 300,
                      child: Text(
                        title,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 26,
                        ),
                        softWrap: true,
                        overflow: TextOverflow.fade,
                      ),
                    ),
                  )
                ],
              ),
              Padding(
                padding: EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.schedule),
                        Text('$duration min'),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.work),
                        Text('$complexityText'),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.attach_money),
                        Text('$affordabilityText'),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
