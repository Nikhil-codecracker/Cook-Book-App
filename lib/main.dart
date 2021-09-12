import 'package:flutter/material.dart';

import 'pages/categories.dart';
import 'pages/category_items_list.dart';
import 'pages/recipe_detail.dart';
import 'pages/tabs.dart';
import 'pages/filters.dart';
import '../dummy_data.dart';
import 'models/recipe.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String,bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };

  List<Recipe> _availableMeals = DUMMY_RECIPE;
  List<Recipe> _favouriteMeals = [];

  void _setFilters(Map<String,bool> filterData){
    setState(() {
      _filters = filterData;
      _availableMeals = DUMMY_RECIPE.where((recipe) {
        if(_filters['gluten'] && !recipe.isGlutenFree){
          return false;
        }
        if(_filters['lactose'] && !recipe.isLactoseFree){
          return false;
        }
        if(_filters['vegan'] && !recipe.isVegan){
          return false;
        }
        if(_filters['vegetarian'] && !recipe.isVegetarian){
          return false;
        }
        return true;
      }).toList();
    });
  }

  void _toggleFavourite(String mealId){
    final idx = _favouriteMeals.indexWhere((meal) => meal.id==mealId);
    if(idx>=0){
      setState(() {
        _favouriteMeals.removeAt(idx);
      });
    }
    else{
      setState(() {
        _favouriteMeals.add(DUMMY_RECIPE.firstWhere((meal) => meal.id==mealId));
      });
    }
  }

  bool _isFavourite(String mealId){
    return _favouriteMeals.any((meal) => meal.id==mealId);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp( 
      title: 'DeliMeals',
      theme: ThemeData(
        fontFamily: 'Raleway',
        primarySwatch: Colors.pink,
        accentColor: Colors.amber, 
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        textTheme: ThemeData.light().textTheme.copyWith(
          body1: TextStyle(
            color: Color.fromRGBO(20,51,51,1),
          ),
          body2: TextStyle(
            color: Color.fromRGBO(20,51,51,1),
          ),
          title: TextStyle(
            fontSize: 20,
            fontFamily: 'Roboto',
            fontWeight: FontWeight.bold,
          )
        )
      ),
      //home: Categories(),
      initialRoute: '/', // default value is '/' but we can change it
      routes: {
        '/' : (ctx) => Tabs(_favouriteMeals), // same as home: Categories()
        CategoryItemsList.routeName : (ctx) => CategoryItemsList(_availableMeals),
        RecipeDetail.routeName: (ctx) => RecipeDetail(_isFavourite,_toggleFavourite),
        Filters.routeName: (ctx) => Filters(_filters,_setFilters),
      },
      // onGenerateRoute: (settings){
      //   print(settings.arguments);
      //   if(settings.none == '/meal-details'){
      //     return ...;
      //   }
      //   else if(settings.name == '/someting-else'){
      //     return ...,
      //   }
      //   else{
      //     return MaterialPageRoute(builder: (ctx) => Categories())
      //   }
      // },
      onUnknownRoute: (settings){ //used to handle error
        return MaterialPageRoute(builder: (ctx) => Categories());
      },
    );
  }
}