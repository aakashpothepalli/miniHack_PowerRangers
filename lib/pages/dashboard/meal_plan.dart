import 'package:flutter/material.dart';


class MealPlan extends StatefulWidget{
  @override
  _MealPlanState createState() => _MealPlanState();
}
  
class _MealPlanState extends State<MealPlan> {
int _counter=0;
bool checkBoxValue=false;
void _incrementCounter(){
  setState(() {
    _counter++;
  });
}

 Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Meal Plan'),
      
      ), 
      body: Column(
        children:<Widget>[ Card(
          child: CheckboxListTile(
            title: Text('North Indian Cuisine',style:TextStyle(fontWeight:FontWeight.bold),),
             value: checkBoxValue,
              onChanged:(bool value) {
              setState(() {
                  checkBoxValue=!value;
                    }); 
                      },
                ),
  
           ),
        Card(
          child: CheckboxListTile(
            title: Text('South Indian Cuisine',style:TextStyle(fontWeight:FontWeight.bold),),
             value: checkBoxValue,
                   onChanged:(bool value) {
                    setState(() {
                       checkBoxValue=!value;
                    }); 
                  },
             ),

           ),


        ]
      ),


  );


 }
}