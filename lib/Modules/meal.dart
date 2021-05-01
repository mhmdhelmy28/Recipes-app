import 'package:flutter/foundation.dart';
enum Complexity {
  Simple,
  challenging,
  Hard,
}
enum Affordability {
  Affordable,
  Pricey,
  Luxurious,
}

class Meal {
  final String id;
  final List<String> categories;
  final String title;
  final Affordability affordability;
  final Complexity complexity;
  final String imageUrl;
  final int duration;
  final List<String> ingredients;
  final List<String> steps;
  final bool isGlutenFree;
  final bool isVegan;
  final bool isVegetarian;
  final bool isLactoseFree;

  Meal({
      this.duration,
      this.id,
      this.categories,
      this.title,
      this.imageUrl,
      this.ingredients,
      this.steps,
      this.complexity,
      this.affordability,
      this.isGlutenFree,
      this.isLactoseFree,
      this.isVegan,
      this.isVegetarian});
}