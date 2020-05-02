import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
class ChatLogic{
  
  ChatLogic(){

  }
  String _getChatId(String id1,String id2){
    if(id1.compareTo(id2)==-1){
      return id1+id2;
    }
    else{
      return id2+id1;
    }
  }

  createChats()async {
    FirebaseUser user = await _getUser();
    QuerySnapshot chatsSnaps = await Firestore.instance.collection('users').getDocuments();
    var docs = chatsSnaps.documents;

    for(int i=0;i<docs.length;i++){
      if(docs[i].data['uid']!=user.uid){
        Firestore.instance.collection('chats')
        .document(_getChatId(user.uid,docs[i].data['uid']))
        .setData({
          'uid1':user.uid,
          'uid2':docs[i].data['uid'],
          'name1':user.displayName,
          'name2':docs[i].data['name'],
          'messages':[]
        });
      }
    }
  }

  _getUser()async{
    return await FirebaseAuth.instance.currentUser();
  }

}