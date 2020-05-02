import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
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
      Card(
      child: Container(
       padding:EdgeInsets.all(25) ,
       child: ListTile(
        leading: Icon(Icons.favorite ,size :30,color:Colors.red),
        title: Text('Calories :'),
        subtitle: Text("Calories Consumed for the Day")
      ),
       ),
      ),
      Card(
        child:Column(
          children: <Widget>[
          const ListTile(
           contentPadding: EdgeInsets.fromLTRB(35, 25, 15, 15),
          leading: Icon(Icons.invert_colors,size: 30,color:Colors.blue),
          title: Text('Water '),
          trailing: Icon(Icons.add_circle,size:40,color:Colors.blue,),
        
        ),
         Container(
           padding: EdgeInsets.all(25),
           child:LinearPercentIndicator(
                width: 140.0,
                lineHeight: 14.0,
                percent: 0.5,
                backgroundColor: Colors.grey,
                progressColor: Colors.blue,
                center: Text(
                  "50.0%",
                  style: new TextStyle(fontSize: 12.0),
              ),
)
         ),

            
          ],)
      )


    
    ]
  );

      return listView;
      
}






