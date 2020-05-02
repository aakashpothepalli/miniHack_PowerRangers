import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../login.dart';
class Home extends StatefulWidget {


  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final GoogleSignIn googleSignIn = new GoogleSignIn(scopes: ['email']);


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
           //trailing: IconButton (Icons.add_circle,size:40,color:Colors.blue,),
        
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
                  "$water",
                  style: new TextStyle(fontSize: 12.0),
              ),
)
         ),
          ],
  
        /* IconButton(
            icon: Icon(Icons.volume_down),

            onPressed: () {
              setState(() {
                water+=8.0;
              
              });
            }
          ),*/

            
       )
      )


    
    ]
  );

      return listView;
      
}






