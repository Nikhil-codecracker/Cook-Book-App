import 'package:flutter/material.dart';

import '../widgets/category_list.dart';
import '../dummy_data.dart';

class Categories extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return GridView(
        children: DUMMY_CATEGORIES
              .map((category) => CategoryList(category.title, category.color,category.id))
              .toList(),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent:200, // to set the width of each element in the grid
          childAspectRatio: 3/2, // to the set the ratio between height ans width in the elemenst of a grid
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        padding: EdgeInsets.all(20),
    );
  }
}
