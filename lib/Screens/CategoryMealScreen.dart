import 'package:flutter/material.dart';
import 'package:meal_app/Modules/meal.dart';
import 'package:meal_app/Widgets/MealItem.dart';
import 'package:meal_app/dummy_data.dart';

class CatMealScreen extends StatefulWidget {
  final List avalaibleMeals;

  const CatMealScreen(this.avalaibleMeals);
  @override
  _CatMealScreenState createState() => _CatMealScreenState();
}

class _CatMealScreenState extends State<CatMealScreen> {
  String ArgTitle;
  List MealCat;

  @override
  void didChangeDependencies() {
    final ArgRoute =
    ModalRoute
        .of(context)
        .settings
        .arguments as Map<String, Object>;
    final ArgId = ArgRoute['id'];
    ArgTitle = ArgRoute['title'];
    MealCat =
        widget.avalaibleMeals.where((meal) => meal.categories.contains(ArgId)).toList();
    super.didChangeDependencies();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(ArgTitle)),
      body: ListView.builder(itemBuilder: (_, index) {
        return MealItem(
          title: MealCat[index].title,
          complexity: MealCat[index].complexity,
          affordability: MealCat[index].affordability,
          duration: MealCat[index].duration,
          imageUrl: MealCat[index].imageUrl,
          id: MealCat[index].id,
        );
      }, itemCount: MealCat.length,),
    );
  }
}
