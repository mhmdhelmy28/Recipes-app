import 'package:flutter/material.dart';
import 'package:meal_app/Modules/meal.dart';
import 'package:meal_app/Screens/CategoryMealScreen.dart';
import 'package:meal_app/Screens/CategoryScreen.dart';
import 'package:meal_app/Screens/Favourites.dart';
import 'package:meal_app/Screens/Filters.dart';
import 'package:meal_app/Screens/MealDetail.dart';
import 'package:meal_app/Widgets/BottomBar.dart';
import 'package:meal_app/dummy_data.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'Gluten': false,
    'Lactose': false,
    'Vegan': false,
    'Vegeterian': false,
  };
  List _avalaibleMeals = DUMMY_MEALS;
  List _FavoriteMeals = [];

  void _SetFilters(Map<String, bool> _filterData) {
    setState(() {
      _filters = _filterData;
      _avalaibleMeals = DUMMY_MEALS.where((meal) {
        if (_filters['Gluten'] && !meal.isGlutenFree) {
          return false;
        }
        if (_filters['Lactose'] && !meal.isLactoseFree) {
          return false;
        }
        if (_filters['Vegan'] && !meal.isVegan) {
          return false;
        }
        if (_filters['Vegeterian'] && !meal.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
    });
  }

 void _toggleFavorites(String MealId) {
    final ExistingIndex = _FavoriteMeals.indexWhere((meal) => meal.id == MealId);
    if (ExistingIndex >= 0) {
      setState(() {
        _FavoriteMeals.removeAt(ExistingIndex);
      });
    }
    else {
      setState(() {
        _FavoriteMeals.add(DUMMY_MEALS.firstWhere((meal) => meal.id == MealId ));
      });
    }

  }

  bool _isFavorite(String id) {
    return _FavoriteMeals.any((meal) => meal.id == id);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.pinkAccent,
        canvasColor: Color.fromRGBO(255, 249, 229, 1),
        accentColor: Colors.amber,
        textTheme: ThemeData.light().textTheme.copyWith(
            headline1: TextStyle(fontSize: 24, fontFamily: 'Raleway'),
            headline2: TextStyle(
                fontSize: 25,
                fontFamily: 'RobotoCondensed',
                fontWeight: FontWeight.bold,
                color: Color.fromRGBO(20, 20, 50, 1))),
      ),
      initialRoute: '/B',
      routes: {
        '/Cat': (context) => CatMealScreen(_avalaibleMeals),
        '/D': (context) => MealDetail(_isFavorite,_toggleFavorites),
        '/B': (context) => BottomBar(_FavoriteMeals),
        '/S': (context) => CategoryScreen(),
        '/F': (context) => Filters(_filters, _SetFilters),
      },
      home: Scaffold(
        body: BottomBar(_FavoriteMeals),
      ),
    );
  }
}
