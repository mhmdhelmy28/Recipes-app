import 'package:flutter/material.dart';
import 'package:meal_app/Screens/CategoryScreen.dart';
import 'package:meal_app/Screens/Favourites.dart';
import 'package:meal_app/Widgets/MainDrawer.dart';
class BottomBar extends StatefulWidget {
  final List favoriteMeal;

  BottomBar(this.favoriteMeal);
  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int SelectedIndex = 0;
  List <Map<String, Object>> _Pages;
  @override
  void initState() {
    _Pages = [
      {
        'title': 'Category',
        'Page': CategoryScreen(),
      },
      {
        'title': 'Favorites',
        'Page': Favourites(widget.favoriteMeal),
      },
    ]   ; super.initState();
  }
  void Selected(int value) {
    setState(() {
      SelectedIndex = value;
    });
  }
    @override
    Widget build(BuildContext context) {

      return Scaffold(
        appBar: AppBar(title: Text(_Pages[SelectedIndex]['title']),),
        body: _Pages[SelectedIndex]['Page'],
        bottomNavigationBar: BottomNavigationBar(
          onTap: Selected,
          currentIndex: SelectedIndex,
          selectedItemColor: Colors.amber,
          unselectedItemColor: Colors.white,
          backgroundColor: Theme.of(context).primaryColor,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.category), label: 'Category'),
            BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Favorites'),
          ],
        ),
        drawer: MainDrawer(),
      );
    }
  }
