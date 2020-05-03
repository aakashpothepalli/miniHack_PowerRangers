import 'package:flutter/material.dart';
import 'package:msrit_power_rangers/pages/dashboard/home.dart';

class Menu extends StatelessWidget{


 Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Menu'),
      ), 
      body: ListView(
        children: <Widget> [Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget> [
          Card(
            child: ListTile(
            leading: CircleAvatar(
                 backgroundColor: Colors.brown.shade800,
                  child: Text('AH'),
              ),
            title: Text('Food_Item'),
            subtitle:Text('CalorieCount'),
            trailing:  IconButton (
             icon:Icon(Icons.add_circle),
             color:Colors.blue,
             onPressed: (){
               //Increases users' calorie count
             }


          ),
            ),
          ),
          Card(
            child: ListTile(
            leading: CircleAvatar(
                 backgroundImage: NetworkImage('https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__340.jpg'),
               //  backgroundColor: Colors.brown.shade800,
               //   child: Text('LH'),
              ),
            title: Text('Food_Item2'),
            subtitle:Text('CalorieCount'),
            trailing:  IconButton (
             icon:Icon(Icons.add_circle),
             color:Colors.blue,
             onPressed: (){
               //Increases users' calorie count
             }


          ),
            ),
          ),
           RaisedButton(
            child: Text('Go Back'),
             onPressed: () {
               Navigator.pop(
                 context,
                  MaterialPageRoute(builder: (context) => Home()),
                );
          },
        ),
         

        ]
      ),
       ]
      )
    );
  }
}
