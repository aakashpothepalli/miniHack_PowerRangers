import 'package:flutter/material.dart';
import 'package:msrit_power_rangers/pages/dashboard/leaderboard.dart';
import 'package:msrit_power_rangers/pages/dashboard/shop.dart';
import 'package:msrit_power_rangers/pages/dashboard/trainer.dart';
import 'package:msrit_power_rangers/pages/dashboard/home.dart';
import 'package:msrit_power_rangers/pages/dashboard/meal_plan.dart';
import 'package:msrit_power_rangers/pages/easteregg.dart';


 int counter = 0;

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
            icon: IconButton(icon: Icon(Icons.home),
          //  alignment: Alignment.bottomCenter,
            onPressed: () {
              setState( () {
                counter ++ ;
                if(counter==5)
                {
                   Navigator.push(context, MaterialPageRoute(builder: (context) => EasterBunny(),) );
                   counter=0;
                  
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
          ),
            title:Text('Tainer'),
            backgroundColor:Colors.blue
          ),

          BottomNavigationBarItem(
            icon: IconButton(icon : Icon(Icons.add_shopping_cart),
           // alignment:Alignment.bottomCenter,
            // onPressed: () {}
            ),
            title:Text('Shop'),
            backgroundColor:Colors.blue
          
          ),
          BottomNavigationBarItem(
            icon: IconButton(icon: Icon(Icons.group),
           // alignment: Alignment.bottomCenter,
            // onPressed: () {}
            ),
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

class EasterBunny extends StatelessWidget{
  @override
  Widget build(BuildContext context)
  {
    return Scaffold(

      appBar: AppBar(backgroundColor: Colors.pink,
         title: Text('Easter Bunny!!'),
         centerTitle: true,),
         body: Row(
           mainAxisSize: MainAxisSize.max,
          
           mainAxisAlignment: MainAxisAlignment.center,
           crossAxisAlignment:CrossAxisAlignment.end,
           children: <Widget> [
             Container(
               height: 150,
               width: 150,
             decoration: new BoxDecoration(
               
               image: DecorationImage(
                 image: new AssetImage('assets/images/bunny.jpg'),
                fit:BoxFit.fill),

             
             shape: BoxShape.circle,
             ),
             ),
             RaisedButton(
               onPressed: (){
                 Navigator.pop(context);
                 counter=0;},
                 child:Text('Back'),
               )
           ]
             
             ),
    );
  }


}