import 'package:flutter/material.dart';
class Filters extends StatefulWidget {
  final Function SaveFilters;
  final Map<String,bool> Current;
  const Filters(this.Current,this.SaveFilters);
  @override
  _FiltersState createState() => _FiltersState();
}

class _FiltersState extends State<Filters> {
  bool isGlutenFree = false;
  bool isVegan = false;
  bool isVegetarian = false;
  bool isLactoseFree = false;
  @override
  initState(){
    isGlutenFree = widget.Current['Gluten'];
    isVegan = widget.Current['Vegan'];
    isVegetarian = widget.Current['Vegeterian'];
    isLactoseFree = widget.Current['Lactose'];
    super.initState();
  }

  Widget buildSwitch(String text,String descreption,bool currValue,Function x){
    return SwitchListTile(title: Text(text,),subtitle: Text(descreption),value:currValue , onChanged: x);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Filters'),actions: [
        IconButton(icon: Icon(Icons.save), onPressed:(){
          Map<String,bool> _filter ={
            'Gluten' : isGlutenFree,
            'Lactose' : isLactoseFree,
            'Vegan' : isVegan,
            'Vegeterian' : isVegetarian,
          };
          widget.SaveFilters(_filter);
        },)
      ],),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Text('Adjust your meal selection.',style: Theme.of(context).textTheme.headline2,),
          ),
           Expanded(child: ListView(
             children: [
               buildSwitch('Gluten-free', 'Included meals without Gluten', isGlutenFree, (value){
                 setState(() {
                   isGlutenFree = value;
                 });
               }),
               buildSwitch('Lactose-free', 'Included meals without lactose', isLactoseFree, (value){
                 setState(() {
                   isLactoseFree = value ;
                 });
               }),
               buildSwitch('Vegan', 'Included vegan meals', isVegan, (value){
                 setState(() {
                   isVegan = value;
                 });
               }),
               buildSwitch('Vegeterian', 'Included vegeterian meals', isVegetarian, (value){
                 setState(() {
                   isVegetarian = value;
                 });
               }),
             ],
           ))
        ],
      ),
    );
  }
}
