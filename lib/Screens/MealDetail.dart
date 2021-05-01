import 'package:flutter/material.dart';
import 'package:meal_app/dummy_data.dart';

class MealDetail extends StatelessWidget {
  final Function _toggleFavorites;
  final Function _isFavorite;

  const MealDetail(this._toggleFavorites, this._isFavorite);
  Widget buildContainer(BuildContext ctx, String text) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(
        text,
        style: Theme.of(ctx).textTheme.headline2,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final MealId = ModalRoute.of(context).settings.arguments as String;
    final SelectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == MealId);
    return Scaffold(
      appBar: AppBar(
        title: Text(SelectedMeal.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
              child: Image.network(
                SelectedMeal.imageUrl,
                height: 300,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            buildContainer(context,'Ingredients'),
        Container(
          height: 200,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              color: Colors.grey,
            ),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
            ),
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.all(10),
            height: 150,
            width: 300,
            child: ListView.builder(
              itemBuilder: (ctx, index) {
                return Card(
                  color: Theme.of(context).accentColor,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(SelectedMeal.ingredients[index]),
                  ),
                );
              },
              itemCount: SelectedMeal.ingredients.length,
            ),),
        ),
        buildContainer(context, 'Steps'),
        Container(
          height: 200,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              color: Colors.grey,
            ),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
            ),
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.all(10),
            height: 150,
            width: 300,
            child: ListView.builder(
              itemBuilder: (ctx, index) {
                return ListTile(
                    leading: Icon(Icons.arrow_right),
                    title: Text(SelectedMeal.steps[index]),
                  );
              },
              itemCount: SelectedMeal.steps.length,
            ),),
        ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed:() => _toggleFavorites(MealId),
        child: Icon(
          _isFavorite(MealId) ? Icons.star : Icons.star_border,
        ),

      ),
    );
  }
}
