import 'package:flutter/material.dart';
import 'package:msrit_power_rangers/pages/dashboard/leaderboard.dart';
import 'package:msrit_power_rangers/pages/dashboard/shop.dart';
import 'package:msrit_power_rangers/pages/dashboard/trainer.dart';
import 'package:msrit_power_rangers/pages/dashboard/home.dart';

class Dashboard extends StatefulWidget {

  @override
  _DashboardState createState() => _DashboardState();




}

class _DashboardState extends State<Dashboard> {


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
            icon: Icon(Icons.home),
            title:Text('Home'),
            backgroundColor:Colors.blue
          
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_box),
            title:Text('Tainer'),
            backgroundColor:Colors.blue
          
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_shopping_cart),
            title:Text('Cart'),
            backgroundColor:Colors.blue
          
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.group),
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