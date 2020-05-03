import 'package:flutter/material.dart';
import 'package:msrit_power_rangers/pages/dashboard/leaderboard.dart';
import 'package:msrit_power_rangers/pages/dashboard/shop.dart';
import 'package:msrit_power_rangers/pages/dashboard/trainer.dart';
import 'package:msrit_power_rangers/pages/dashboard/home.dart';
import 'package:msrit_power_rangers/pages/dashboard/meal_plan.dart';

class Dashboard extends StatefulWidget {

  @override
  _DashboardState createState() => _DashboardState();

}

class _DashboardState extends State<Dashboard> {

  int _counter = 0;
  

  final List<Widget> _children= [
      Home(),
      Trainer(),
      Shop(),
      Leaderboard(),
    ];
  int _currentIndex=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        items:[
          BottomNavigationBarItem(
            icon: IconButton(icon: Icon(Icons.home),
          //  alignment: Alignment.bottomCenter,
            onPressed: () {
              setState( () {
                _counter ++ ;
                if(_counter==5)
                {
                   Navigator.push(context, MaterialPageRoute(builder: (context) => MealPlan()), );
                   _counter=0;
                  
                }
              }
              );
            },

            ),
            title:Text('Home'),
            backgroundColor:Colors.blue
          ),
          
          BottomNavigationBarItem(
            icon: IconButton(icon: Icon(Icons.accessibility),
          //  alignment: Alignment.bottomCenter,
            onPressed: () {},),
            title:Text('Tainer'),
            backgroundColor:Colors.blue
          ),

          BottomNavigationBarItem(
            icon: IconButton(icon : Icon(Icons.add_shopping_cart),
           // alignment:Alignment.bottomCenter,
            onPressed: () {}),
            title:Text('Shop'),
            backgroundColor:Colors.blue
          
          ),
          BottomNavigationBarItem(
            icon: IconButton(icon: Icon(Icons.group),
           // alignment: Alignment.bottomCenter,
            onPressed: () {}),
            title:Text('LeaderBoard'),
            backgroundColor:Colors.blue
          
          ),

        ],
        onTap: (int index) {
          setState(() {
            _currentIndex=index;
          });
        }
      )
  
    );
  
  }
}