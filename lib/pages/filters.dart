import 'package:flutter/material.dart';

import '../widgets/drawer.dart';

class Filters extends StatefulWidget {
  static const routeName = '/filters';

  final Function saveFilters;
  final Map<String,bool> currentFilters;

  Filters(this.currentFilters,this.saveFilters);

  @override
  _FiltersState createState() => _FiltersState();
}

class _FiltersState extends State<Filters> {
  var _glutenFree = false;
  var _lactoseFree = false;
  var _isVegan = false;
  var _isVegetarian = false; 

  @override
  void initState(){
    _glutenFree = widget.currentFilters['gluten'];
    _lactoseFree = widget.currentFilters['lactose'];
    _isVegan = widget.currentFilters['vegan'];
    _isVegetarian = widget.currentFilters['vegetarian'];
    super.initState();
  }

  Widget buildSwitch(String title,String description,var val,Function changeSwitch){
    return SwitchListTile(
      title: Text(title),
      value: val,
      subtitle: Text(description),
      onChanged: changeSwitch,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filters'),
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: (){
              final filterData = {
                'gluten': _glutenFree,
                'lactose': _lactoseFree,
                'vegan': _isVegan,
                'vegetarian': _isVegetarian,
              };
              widget.saveFilters(filterData);  // to access props in stateful custom widget we use 'widget.'
            },
          )
        ],
      ),
      drawer: AppDrawer(),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Adjust your meal selection',
              style: Theme.of(context).textTheme.title,
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                buildSwitch(
                  'Gluten-free', 
                  'Only include gluten-free meals', 
                  _glutenFree, 
                  (val) {
                    setState(() {
                      _glutenFree = val;
                    });
                  }
                ),
                buildSwitch(
                  'Lactose-free', 
                  'Only include lactose-free meals', 
                  _lactoseFree, 
                  (val) {
                    setState(() {
                      _lactoseFree = val;
                    });
                  }
                ),
                buildSwitch(
                  'Vegan', 
                  'Only include vegan meals', 
                  _isVegan, 
                  (val) {
                    setState(() {
                      _isVegan = val;
                    });
                  }
                ),
                buildSwitch(
                  'Vegetarian', 
                  'Only include vegetarian meals', 
                  _isVegetarian, 
                  (val) {
                    setState(() {
                      _isVegetarian = val;
                    });
                  }
                ),
              ],
            ),
          )
        ],
      )
    );
  }
}