import 'package:flutter/material.dart';

class MessageTile extends StatelessWidget {
  String message;
  bool isSender;
  int type;//1 sender 2 reciever 3 rating
  MessageTile({this.message,this.isSender});  
  bool isdark;
  @override
  Widget build(BuildContext context) {
var brightness = MediaQuery.of(context).platformBrightness;
  if(brightness==Brightness.dark)
    isdark=true;
  else
    isdark = false;

    return this.isSender?
     Wrap(
       alignment: WrapAlignment.end,
       children: <Widget>[
         Card(
          color:isdark?Colors.deepPurple:Colors.cyan,
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Text(this.message,style: TextStyle(fontSize: 14,color: isdark?Colors.white:Colors.black),),
              ],
            ),
        ),  
       ),
       ],
           
     ):Wrap(
       alignment: WrapAlignment.start,
       children: <Widget>[
         Card(
          color:isdark?Colors.black54: Colors.white,
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