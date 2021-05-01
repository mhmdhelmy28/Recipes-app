import 'package:flutter/material.dart';
class CategoryItem extends StatelessWidget {
  final String title;
  final String id;
  final Color color;

  const CategoryItem({this.title, this.id, this.color});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){Navigator.pushNamed(context, '/Cat',arguments: {'id': id,'title':title});},
      child: Container(
        padding: EdgeInsets.all(10),
        child: Text(title,style: Theme.of(context).textTheme.headline2,),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
