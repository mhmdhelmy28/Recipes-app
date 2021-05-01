import 'package:flutter/material.dart';
class MainDrawer extends StatefulWidget {
  @override
  _MainDrawerState createState() => _MainDrawerState();
}

class _MainDrawerState extends State<MainDrawer> {
  Widget buildList(BuildContext ctx,String text,IconData icon,Function z){
    return ListTile(
      leading: Icon(icon),
      title: Text(text,style: TextStyle(fontSize: 26,fontFamily: 'RobotoCondensed',fontWeight: FontWeight.bold),),
      onTap: z,
    );
  }
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 150,
            width: double.infinity,
            color: Theme.of(context).accentColor,
            child: Align(
              alignment: Alignment.centerLeft,
                child: Text('Cooking Up!',style: TextStyle(fontSize: 30,fontFamily: 'RobotoCondensed',fontWeight: FontWeight.w900,color: Colors.red))),
          ),
          buildList(context, 'Meal', Icons.restaurant, (){Navigator.of(context).pushReplacementNamed('/B');}),
          buildList(context, 'Filters', Icons.settings, (){Navigator.of(context).pushReplacementNamed('/F');}),

        ],
      ),
    );
  }
}
