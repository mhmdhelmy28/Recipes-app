import 'package:flutter/material.dart';
import 'package:meal_app/Widgets/MealItem.dart';
class Favourites extends StatelessWidget {
  final List favoriteMeal;

  Favourites(this.favoriteMeal);
  @override
  Widget build(BuildContext context) {
    if (favoriteMeal.isEmpty){
    return Center(
      child: Text('You have no favorites yet - Start adding some'),
    );}
    else{
      return ListView.builder(itemBuilder: (_, index) {
        return MealItem(
          title: favoriteMeal[index].title,
          complexity: favoriteMeal[index].complexity,
          affordability: favoriteMeal[index].affordability,
          duration: favoriteMeal[index].duration,
          imageUrl: favoriteMeal[index].imageUrl,
          id: favoriteMeal[index].id,
        );
      }, itemCount: favoriteMeal.length,);
    }
  }
}
