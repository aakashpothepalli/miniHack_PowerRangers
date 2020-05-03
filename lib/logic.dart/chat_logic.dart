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

  _createUserIfNotPresent(FirebaseUser user)async {
        DocumentSnapshot userSnap = await Firestore.instance.collection('users').document(user.uid).get();
        if(!userSnap.exists || userSnap==null){
          await Firestore.instance.collection('users').document(user.uid)
          .setData({
            'name':user.displayName,
            'uid':user.uid
          });
        }
  }
  createChats()async {
    
    FirebaseUser user = await _getUser();
    await _createUserIfNotPresent(user);
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

  sendRatingCardToTrainer({String foodItemName,String roomId,double calories,String imgurl})async {
    FirebaseUser user = await FirebaseAuth.instance.currentUser();
    Firestore.instance.collection('chats').document(roomId).collection('messages').add({
      'senderId':user.uid,
      'message':'Planning to eat $foodItemName now',
      'type':1,
      'rating ':0,
      'timestamp':DateTime.now(),
      'imgurl':imgurl
    });
  }

}