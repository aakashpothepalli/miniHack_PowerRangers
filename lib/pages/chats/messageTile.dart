import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
class MessageTile extends StatefulWidget {
  String message;
  bool isSender;
  int type;
  String roomId;
  int rating;
  String imgurl;
  String id;
  MessageTile({this.message,this.isSender,this.rating,this.type,this.imgurl,this.id,this.roomId});  

  @override
  _MessageTileState createState() => _MessageTileState();
}

class _MessageTileState extends State<MessageTile> {
  bool isdark;
  
  buildRatingCard(){
    print(widget.rating);
    return Wrap(
       alignment: WrapAlignment.end,
       
      children: <Widget>[
        Card(
          color:widget.isSender?isdark?Colors.deepPurple:Colors.blue:isdark?Colors.black54: Colors.white,
          margin: EdgeInsets.all(10),
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: widget.isSender?CrossAxisAlignment.end:CrossAxisAlignment.start,
              children: <Widget>[
                Image.network(widget.imgurl),
                Text(this.widget.message,style: TextStyle(fontSize: 14,color: isdark?Colors.white:Colors.black),),
              RatingBar(
                initialRating: widget.rating?.toDouble()??0,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                itemBuilder: (context, _) => Icon(
                      Icons.star,
                      color: Colors.amber,
                ),
                ignoreGestures: widget.isSender,
                onRatingUpdate: (rating) {
                  if(!widget.isSender){
                  Firestore.instance.collection('chats').document(widget.roomId).collection('messages')
                  .document(widget.id).updateData({'rating':(rating.round())});}
                },
              ),
              ],
            ),
        ),  
       ),
        
      ],
    );

  }

  @override
  Widget build(BuildContext context) {
var brightness = MediaQuery.of(context).platformBrightness;
  if(brightness==Brightness.dark)
    isdark=true;
  else
    isdark = false;

    return this.widget.isSender?
    (widget.type==1)?buildRatingCard():
     Wrap(
       alignment: WrapAlignment.end,
       children: <Widget>[
         Card(
          color:isdark?Colors.deepPurple:Colors.blue,
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Text(this.widget.message,style: TextStyle(fontSize: 14,color: isdark?Colors.white:Colors.black),),
              ],
            ),
        ),  
       ),
       ],
           
     ):
  (widget.type==1)?buildRatingCard():

      Wrap(
       alignment: WrapAlignment.start,
       children: <Widget>[
         Card(
          color:isdark?Colors.black54: Colors.white,
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Text(this.widget.message,style: TextStyle(fontSize: 14),),
              ],
            ),
        ),  
       ),
       ],
           
     );
  }
}