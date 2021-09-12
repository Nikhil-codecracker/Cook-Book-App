import 'package:flutter/material.dart';

import '../dummy_data.dart';
import '../widgets/recipie_card.dart';
import '../models/recipe.dart';

class CategoryItemsList extends StatefulWidget {
  // final String id;
  // final String category;

  // CategoryItemsList(this.category,this.id);

  static const routeName = '/category-items';

  final List<Recipe> _availableMeals;

  CategoryItemsList(this._availableMeals);

  @override
  _CategoryItemsListState createState() => _CategoryItemsListState();
}

class _CategoryItemsListState extends State<CategoryItemsList> {
  String category;
  List<Recipe> recipes;
  var _loading = false;

  void initState() {
   
   super.initState();
  }

  void didChangeDependencies() {

    if(!_loading){
      final routeArgs =ModalRoute.of(context).settings.arguments as Map<String, String>;
      category = routeArgs['title'];
      final categoryId = routeArgs['id'];
      recipes = widget._availableMeals.where((recipe) {
        return recipe.categories.contains(categoryId);
      }).toList();

      _loading = true;
    }
     
    super.didChangeDependencies();
  }

  void _removeRecipe(String mealId) {
    setState(() {
      recipes.removeWhere((recipe) => recipe.id == mealId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(category),
        ),
        body: ListView.builder(
          itemBuilder: (ctx, idx) {
            return RecipeCard(
              recipes[idx].id,
              recipes[idx].title,
              recipes[idx].imageUrl,
              recipes[idx].duration,
              recipes[idx].complexity,
              recipes[idx].affordability,
            );
          },
          itemCount: recipes.length,
        )
      );
  }
}
