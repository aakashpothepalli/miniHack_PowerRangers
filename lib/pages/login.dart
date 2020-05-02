import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:msrit_power_rangers/logic.dart/chat_logic.dart';
import 'package:msrit_power_rangers/pages/dashboard/dashboard.dart';

import 'dart:async';

import 'package:msrit_power_rangers/pages/signup.dart';



class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final FirebaseAuth auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = new GoogleSignIn(scopes: ['email']);

  @override
  void initState() {
    getUser().then((user) {
      if (user != null) {
        print('Already logged in as ' + user.uid);
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Dashboard()));
        // googleSignIn.signOut();
        // auth.signOut();
      } else {
        print("Not logged in");
      }
    });

    super.initState();
  }

  Future<void> signIn() async {
    try {
      final GoogleSignInAccount googleSignInAccount =
          await googleSignIn.signIn();
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;

      final AuthCredential credential = GoogleAuthProvider.getCredential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );

      final AuthResult authResult = await auth.signInWithCredential(credential);
      final FirebaseUser user = authResult.user;

      print('signed in as ' + user.displayName);
      await ChatLogic().createChats();
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Signup()));
     
    } catch (err) {
      print(err);
    }
  }

  Future<FirebaseUser> getUser() async {
    return auth.currentUser();
  }

  void showSnackbar(String text) {
    _scaffoldKey.currentState.showSnackBar(
      SnackBar(
        content: Text(text),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      key: _scaffoldKey,
      body: Center(
        child:FlatButton(
            child: Image.network("https://developers.google.com/identity/images/btn_google_signin_light_normal_web.png"),
            onPressed: signIn
        ),
      ),
    
    );
  }
}
