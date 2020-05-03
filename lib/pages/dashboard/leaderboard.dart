import 'package:flutter/material.dart';
import 'package:gradient_text/gradient_text.dart';
import 'package:msrit_power_rangers/pages/dashboard/users.dart';
class Leaderboard extends StatefulWidget {
  

  @override
  _LeaderboardState createState() => _LeaderboardState();
}

class _LeaderboardState extends State<Leaderboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(     
      appBar:AppBar(
        actions: <Widget>[
          IconButton(
           icon: Icon(Icons.menu)
          ),
        ],
        centerTitle:true,
         title: GradientText("LEADERBOARD",
           gradient:LinearGradient(colors:[ Colors.deepPurple,Colors.deepOrange,Colors.pink]),
            style:TextStyle(fontFamily:"Libre Baskerville",fontSize:20)),),
      body: ListView(
        children: <Widget> [
      Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget> [

          Card(
            child: Column(
              children: <Widget>[
                 CircleAvatar(
                 child: Text(" ",), //display initial name[0],
                 radius:35.0 ,
                

                ),
                ListTile(
                title: Text('Name'),
                subtitle:Text('Points: '),
                
                ),
              ]
                ),
          ),
              ],
            ),
        ],
      ),
      
    );
  }
}