import 'package:flutter/material.dart';

import '../pages/category_items_list.dart';

class CategoryList extends StatelessWidget {
  final String id;
  final String title;
  final Color color;

  CategoryList(this.title,this.color,this.id);

  void selectCategory(BuildContext ctx){
    // Navigator.of(ctx).push(MaterialPageRoute(builder: (_){
    //   return CategoryItemsList(title,catId);
    // }),);

    // Instead of using this we can directly push the Page to a route(defined in main.dart) and pass the variables as arguments to it

    Navigator.of(ctx).pushNamed(
      CategoryItemsList.routeName,
      arguments: {
        'id':id,
        'title': title,
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectCategory(context),
      splashColor: Theme.of(context).primaryColor,
      child: Container(
        child: Text(
          title,
          style: Theme.of(context).textTheme.title
        ),
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              color.withOpacity(0.7),
              color,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(15),
        )
      ),
    );
  }
}