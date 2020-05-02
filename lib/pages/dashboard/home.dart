import 'package:flutter/material.dart';
class Home extends StatefulWidget {


  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
            body: Center(child: getListView()),

    );
  }
}

 Widget getListView() {
  var listView =ListView(
    children: <Widget>[
      Container(
       padding:EdgeInsets.all(25) ,
       child: ListTile(
        leading: Icon(Icons.favorite ,size :20,color:Colors.red),
        title: Text('Calories :'),
        subtitle: Text("Calories Consumed for the Day")
      ),
       )
    ]
  );

      return listView;
      
}