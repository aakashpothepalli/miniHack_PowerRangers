import 'package:flutter/material.dart';


class MealPlan extends StatefulWidget{
  @override
  _MealPlanState createState() => _MealPlanState();
}
  
class _MealPlanState extends State<MealPlan> {
int _counter=0;
bool checkBoxValue=false;
bool checkBoxNonValue=true;
void _incrementCounter(){
  setState(() {
    _counter++;
  });
}

 Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Meal Plan'),
        backgroundColor: Colors.red,
      
      ), 
      body: Column(
        children:<Widget>[ Card(
          color:Colors.amber,
          child: CheckboxListTile(
            activeColor:Colors.red,
            title: Text('North Indian Cuisine',style:TextStyle(fontWeight:FontWeight.bold),),
             value: checkBoxValue,
                   onChanged:(bool value) {
                    setState(() {
                       checkBoxValue=value;
                          }); 
                           },
                     ),

           ),
          Card(
          color: Colors.amber,
          child: CheckboxListTile(
              activeColor:Colors.red,
            title: Text('South Indian Cuisine',style:TextStyle(fontWeight:FontWeight.bold),),
             value: checkBoxNonValue,
                   onChanged:(bool value) {
                    setState(() {
                       checkBoxNonValue=value;
                          }); 
                           },
                     ),
           ),


        ]
      ),


  );


 }
}