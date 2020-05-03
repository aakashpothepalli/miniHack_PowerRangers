import 'package:flutter/material.dart';
import 'package:msrit_power_rangers/pages/dashboard/users.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:msrit_power_rangers/pages/dashboard/menu.dart';
import 'package:msrit_power_rangers/pages/dashboard/meal_plan.dart';
import 'package:provider/provider.dart';
import 'package:gradient_text/gradient_text.dart';

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
}

init(){
 Provider.of<User>(context).getWaterCount().then((count){
    setState(() {
      waterCount = count;
    });
  });
  setState(() {
    calorieCount= Provider.of<User>(context).calorieCount;
  });
  // Provider.of<User>(context).getCalorieCount().then((count){
  //   setState(() {
  //     calorieCount =count;
  //   });
  // });
}

Widget getListView() {
  var listView =ListView(
    children: <Widget>[
      Card(
      child: Container(
        decoration: new BoxDecoration(
             gradient:LinearGradient(colors: [Colors.yellow,Colors.orangeAccent,Colors.red])
           ),
       padding:EdgeInsets.all(10) ,
       child: ListTile(
        leading: Icon(Icons.favorite ,size :30,color:Colors.red),
        title: GradientText("Calories : $calorieCount",
           gradient:LinearGradient(colors:[ Colors.deepPurple,Colors.deepOrange,Colors.pink]),
            style:TextStyle(fontSize:20)),
        subtitle: Text("Calories Consumed for the Day")
      ),
       ),
      ),
      Card(
        child:Column(
          children: <Widget>[
           Container(
             decoration: new BoxDecoration(
             gradient:LinearGradient(colors: [Colors.white,Colors.pink[50],Colors.blue[200]])
           ),
           child:ListTile(
           contentPadding: EdgeInsets.fromLTRB(25, 25, 15, 0),
           leading: Icon(Icons.invert_colors,size: 30,color:Colors.indigo),
           title: GradientText("Water",
           gradient:LinearGradient(colors:[ Colors.deepPurple,Colors.deepOrange,Colors.pink]),
            style:TextStyle(fontSize:20)),
          

           trailing: IconButton (
             icon:Icon(Icons.add_circle,size:30,color: Colors.indigo),
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
           ),
         Container(
           padding: EdgeInsets.all(25),
           decoration: new BoxDecoration(
             gradient:LinearGradient(colors: [Colors.white,Colors.pink[50],Colors.blue[200]])
           ),
           child:LinearPercentIndicator(
             animation:true,
             animationDuration: 1000,
                width: 140.0,
                lineHeight: 20.0,
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
          Container(
            decoration: new BoxDecoration(
             gradient:LinearGradient(colors: [Colors.yellow,Colors.green[200],Colors.blue[200]])
               ),
           child: ListTile(
           leading: Icon(Icons.album,color:Colors.red),
            contentPadding: EdgeInsets.fromLTRB(25,10 , 0, 0),
            title: GradientText("Plan your diet",
            gradient:LinearGradient(colors:[ Colors.deepPurple,Colors.deepOrange,Colors.pink]),
            style:TextStyle(fontSize:20)),
            subtitle: Text('Choose your Menu for the day',style:TextStyle(color:Colors.black),),
          ),
          ),
          Container(
            decoration: new BoxDecoration(
             gradient:LinearGradient(colors: [Colors.yellow,Colors.green[200],Colors.blue[200]])
               ),
           child: ButtonBar(
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
     init();

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
 