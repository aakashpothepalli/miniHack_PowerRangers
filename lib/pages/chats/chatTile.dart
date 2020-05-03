import "package:flutter/material.dart";
import 'package:msrit_power_rangers/logic.dart/chat_logic.dart';
import 'chatPage.dart';

class ChatTile extends StatefulWidget {
  String profilePic;
  String profileName;
  String mealName;
  double calories;
  int type;
  String recentMessage;
  int messageCount;
  String profileUid;
  String roomId;
  String myUid;
  String imgurl;
  String foodItemName;
  ChatTile({this.profileName,this.messageCount,this.imgurl,this.profilePic,this.type,this.mealName,this.calories,this.recentMessage,this.profileUid,this.myUid,this.roomId,this.foodItemName});
  @override
  _ChatTileState createState() => _ChatTileState();
}

class _ChatTileState extends State<ChatTile> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading:CircleAvatar(backgroundImage: NetworkImage(widget.profilePic??"https://www.searchpng.com/wp-content/uploads/2019/02/Deafult-Profile-Pitcher.png")) ,
      title: Text(widget.profileName?? "user name"),
      subtitle: Text(widget.recentMessage ?? "How are you doing ?"),
      onTap: (){
        if(widget.type==1)
        {
          ChatLogic().sendRatingCardToTrainer(foodItemName: widget.mealName,calories: widget.calories,roomId: widget.roomId,imgurl: widget.imgurl);
          
        Navigator.pushReplacement(context, new MaterialPageRoute(builder: (context)=>ChatPage(
          
          myUid: widget.myUid,
          profileName: widget.profileName,
          roomId: widget.roomId,
        ) ));
      }
      else{
        Navigator.push(context, new MaterialPageRoute(builder: (context)=>ChatPage(
          
          myUid: widget.myUid,
          profileName: widget.profileName,
          roomId: widget.roomId,
        ) ));
      }
      },
      // trailing: CircleAvatar(radius: 13, child : Text((widget.messageCount?? 0).toString()) )
    );
  }
}