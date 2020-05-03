import 'package:flutter/material.dart';
import 'package:msrit_power_rangers/pages/dashboard/users.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:msrit_power_rangers/pages/dashboard/menu.dart';
import 'package:msrit_power_rangers/pages/dashboard/meal_plan.dart';

import '../login.dart';
class Home extends StatefulWidget {


  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final GoogleSignIn googleSignIn = new GoogleSignIn(scopes: ['email']);
   double waterCount=0;
   double calorieCount=0;
@override
void initState() { 
  super.initState();
  User().getWaterCount().then((count){
    setState(() {
      waterCount = count;
    });
  });
  User().getCalorieCount().then((count){
    setState(() {
      calorieCount =count;
    });
  });
}

Widget getListView() {
  var listView =ListView(
    children: <Widget>[
      Card(
      child: Container(
       padding:EdgeInsets.all(25) ,
       child: ListTile(
        leading: Icon(Icons.favorite ,size :30,color:Colors.red),
        title: Text('Calories : $calorieCount'),
        subtitle: Text("Calories Consumed for the Day")
      ),
       ),
      ),
      Card(
        child:Column(
          children: <Widget>[
           ListTile(
           contentPadding: EdgeInsets.fromLTRB(35, 25, 15, 15),
           leading: Icon(Icons.invert_colors,size: 30,color:Colors.blue),
           title: Text('Water '),
           trailing: IconButton (
             icon:Icon(Icons.add_circle),
             color:Colors.blue,
             onPressed: (){
               setState(() {
                 if(waterCount>100)
                  waterCount =100.0;
                  else
                 waterCount = waterCount + 0.08;
               });
               User().setWaterCount(waterCount);
             }
             ),
        
        ),
         Container(
           padding: EdgeInsets.all(25),
           child:LinearPercentIndicator(
                width: 140.0,
                lineHeight: 14.0,
                percent: waterCount,
                backgroundColor: Colors.grey,
                progressColor: Colors.blue,
                center: Text(
                  "$waterCount",
                  style: new TextStyle(fontSize: 12.0),
              ),
            )
         ),
          ],
  
       )
      ),
      Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          const ListTile(
            leading: Icon(Icons.album),
            contentPadding: EdgeInsets.fromLTRB(35,10 , 0, 0),
            title: Text('Plan your Diet'),
            subtitle: Text('Choose your Menu for the day'),
          ),
          ButtonBar(
            children: <Widget>[
              FlatButton(
                child: const Text('Menu'),
                onPressed: () { 
                  Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Menu()),
            );
          },
              ),
               FlatButton(
                child: const Text('Meal Plan'),
                onPressed: () { 
                  Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MealPlan()),
            );
          },
              ),

            ],
          ),
        ],
      ),
    ),
      


    
    ]
  );

      return listView;
      
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: getListView()),
      appBar: AppBar(actions: <Widget>[

        IconButton(
          icon: Icon(Icons.exit_to_app),
          onPressed: (){
            FirebaseAuth.instance.signOut();
            googleSignIn.signOut();
            Navigator.pushReplacement(context, new MaterialPageRoute(builder: (context)=>Login()));
          },
        ),
        
      ],title: Text('Home'),)

    );
  }
}

 double water=0.0; // temporary declaration ,each time user presses icon button(200 ml water not 250) ,water % should increase by 8%
 