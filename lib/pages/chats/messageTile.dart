import 'package:flutter/material.dart';

class MessageTile extends StatelessWidget {
  String message;
  bool isSender;
  MessageTile({this.message,this.isSender});  

  @override
  Widget build(BuildContext context) {

    return this.isSender?
     Wrap(
       alignment: WrapAlignment.end,
       children: <Widget>[
         Card(
          color: Colors.lightBlue,
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Text(this.message,style: TextStyle(fontSize: 14,color: Colors.white),),
              ],
            ),
        ),  
       ),
       ],
           
     ):Wrap(
       alignment: WrapAlignment.start,
       children: <Widget>[
         Card(
          color: Colors.white,
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Text(this.message,style: TextStyle(fontSize: 14),),
              ],
            ),
        ),  
       ),
       ],
           
     );
  }
}