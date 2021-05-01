import 'package:flutter/material.dart';
import 'package:meal_app/Widgets/CategoryItem.dart';
import 'package:meal_app/dummy_data.dart';
class CategoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: EdgeInsets.all(25),
      children:DUMMY_CATEGORIES.map((e) => CategoryItem(title: e.title,color: e.color,id: e.id,)).toList() ,
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          mainAxisSpacing:20,
          crossAxisSpacing: 20,
          maxCrossAxisExtent: 200,
          childAspectRatio: 3/2,
      ));
  }
}
