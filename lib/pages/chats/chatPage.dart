import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
class ChatPage extends StatefulWidget {
  String roomId;
  String profileName;
  String myUid;
  ChatPage({this.roomId,this.profileName,this.myUid});
  
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {

  String roomId ;
  TextEditingController messageController = new TextEditingController();

  @override
  void initState() {
    roomId = widget.roomId;
    super.initState();
  }

  _onSend()async {

    Firestore.instance.collection('chats').document(this.roomId).collection('messages')
    .add({
      'senderId':widget.myUid,
      'message':messageController.text,
      "timestamp":new DateTime.now()
    });
    messageController.text="";
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance.collection('chats').document(this.roomId).collection('messages').orderBy("timestamp").snapshots(),
      builder: (context, snapshot) {
        if(snapshot.hasData){
          List<DocumentSnapshot> messagest = snapshot.data.documents;
          List<ListTile> messages= new List();
          
          for(int i=0;i<messagest.length;i++){
            messages.insert(0,
              ListTile(title: Text(messagest[i].data['message']),));
          }
          return Scaffold(
            appBar: AppBar(
              title: Text(widget.profileName),
            ),
            body: Column(
              children: <Widget>[
                Expanded(
                  child: ListView(
                    shrinkWrap: true,
                    reverse: true,
                    children:messages)),
                Row(
                  children: <Widget>[
                    Expanded(
                        child: TextFormField(
                          controller: messageController,
                          keyboardType: TextInputType.multiline,
                          maxLines: null,
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.send),
                      onPressed: _onSend,)
                  ],
                )
              ],),
          );
        }
        else return Scaffold(body: Text("no messages"),);
      }
    );
  }
}