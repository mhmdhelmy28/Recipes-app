import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meal_app/Modules/meal.dart';

import '../dummy_data.dart';

class MealItem extends StatelessWidget {
  final String imageUrl;
  final String title;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;
  final String id;

  const MealItem(
      {this.id,
      this.imageUrl,
      this.title,
      this.duration,
      this.complexity,
      this.affordability});
  String get complexityget{
    switch(complexity){
      case Complexity.Simple: return ' Simple';break;
      case Complexity.challenging: return 'Challenging';break;
      case Complexity.Hard: return 'Hard';break;
      default: return 'Unknown';break;
    }
  }
  String get affordabilityget{
    switch(affordability){
      case Affordability.Pricey: return 'Pricey';break;
      case Affordability.Affordable: return 'Affordable';break;
      case Affordability.Luxurious: return'Luxurious';break;
      default: return 'Unknown';break;
    }
  }

void Selectcreen(BuildContext ctx){
  Navigator.pushNamed(ctx, '/D',arguments:id );
}
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){Selectcreen(context);},
      child: Card(
        elevation: 4,
        margin: EdgeInsets.all(10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(15),
                      topLeft: Radius.circular(15)),
                  child: Image.network(imageUrl,height: 300,width: double.infinity,fit: BoxFit.cover,),
                ),
                Positioned(
                    bottom: 40,
                    right: 10,
                    child: Container(
                      color: Colors.black54,
                      width: 300,
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 40),
                      child: Text(
                        title,
                        style: TextStyle(
                            fontSize: 26,
                            fontFamily: 'RobotoCondensed',
                            color: Colors.white),
                      ),
                    ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      Icon(Icons.alarm),
                      Text('${duration} min',style: ThemeData.light().textTheme.headline2,),
                    ],
                  ),
                  SizedBox(width: 4,),
                  Row(
                    children: [
                      Icon(Icons.work),
                      Text('${complexityget}',style: ThemeData.light().textTheme.headline2,),
                    ],
                  ),
                  SizedBox(width: 4,),
                  Row(
                    children: [
                      Icon(CupertinoIcons.money_dollar),
                      Text('${affordabilityget}',style: ThemeData.light().textTheme.headline2,),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
