import 'package:flutter/material.dart';

import './categories.dart';
import './favourites.dart';
import '../widgets/drawer.dart';

class Tabs extends StatefulWidget {
  final _favouriteMeals;

  Tabs(this._favouriteMeals);

  @override
  _TabsState createState() => _TabsState();
}

class _TabsState extends State<Tabs> {
  List<Map<String,Object>> _pages;

  @override
  void initState(){
    _pages = [
      {'page': Categories(),'title': 'Categories'},
      {'page': Favourites(widget._favouriteMeals),'title': 'Your Favourites'},
    ];
    
    super.initState();
  }

  int _selectedIdx = 0;

  void _selectedPage(int idx){
    setState(() {
      _selectedIdx = idx;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(_pages[_selectedIdx]['title']),
        ),
        drawer: AppDrawer(),
        body: _pages[_selectedIdx]['page'],
        bottomNavigationBar: BottomNavigationBar(
          onTap: _selectedPage,
          backgroundColor: Theme.of(context).primaryColor,
          unselectedItemColor: Colors.white,
          selectedItemColor: Theme.of(context).accentColor,
          currentIndex: _selectedIdx,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.category),
              title: Text('Category'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.star),
              title: Text('Favourites'),
            ),
          ],
        ),
    );
    //DefaultTabController( // This is used to add tabs at the bottom of appBar
    //   length: 2,         // It does not require stateful widget
    //   child: Scaffold(
    //     appBar: AppBar(
    //       title: Text('Meals'),
    //       bottom: TabBar(
    //         tabs: [
    //           Tab(
    //             icon: Icon(Icons.category),
    //             text: 'Meals',
    //           ),
    //           Tab(
    //             icon: Icon(Icons.star),
    //             text: 'Favourites',
    //           ),
    //         ],
    //       ),
    //     ),
    //     body: TabBarView(
    //       children: [
    //         Categories(),
    //         Favourites(),
    //       ],
    //     )
    //   ),
    // );
  }
}