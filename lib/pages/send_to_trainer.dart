import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:msrit_power_rangers/pages/chats/chatTile.dart';
class SendToTrainer extends StatefulWidget {
  SendToTrainer({Key key}) : super(key: key);

  @override
  _SendToTrainerState createState() => _SendToTrainerState();
}

class _SendToTrainerState extends State<SendToTrainer> {

  FirebaseUser user;
  @override
  void initState() {
    _init();
    super.initState();
  }
  _init()async{
    FirebaseUser usertemp = await FirebaseAuth.instance.currentUser();

    setState(() {
      this.user = usertemp;
    });

  }

  @override
  Widget build(BuildContext context) {

    return StreamBuilder<QuerySnapshot>(
        stream: Firestore.instance.collection('chats').snapshots(),
        builder: (context,snapshot) {
        
          if(snapshot.hasData){
            List<ChatTile> chats = new List();
            List<DocumentSnapshot> ds = snapshot.data.documents;
            
            
            if(this.user!=null){
              
              for(int i=0;i<ds.length;i++){
                if(ds[i].documentID.contains(this.user.uid)){
                  String profileName ;
                  String profileUid;
                  if(this.user.uid!=ds[i].data['uid1']){
                    profileName = ds[i].data['name1'];
                    profileUid = ds[i].data['uid1'];
                  }
                  else{
                    profileName = ds[i].data['name2'];
                    profileUid = ds[i].data['uid2'];

                  }

                  chats.add(
                    ChatTile(
                      messageCount: 0,
                      myUid: this.user.uid,
                      profileName: profileName,
                      profileUid: profileUid,
                      roomId: ds[i].documentID,
                    )
                  );
                }
              }
            }
            
            return Scaffold(
              appBar: AppBar(title: Text('Confirm Selection With Trainers'),),

              body: ListView(
                children: chats,
              ),);
          }
          else return Scaffold(
            appBar: AppBar(title: Text('Confirm Selection With Trainers'),),
            body: Center(
              child:CircularProgressIndicator() ,),
          );
        }
      );
  }
}