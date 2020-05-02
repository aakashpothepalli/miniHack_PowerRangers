import 'package:flutter/material.dart';

import 'dashboard/dashboard.dart';

class Signup extends StatefulWidget {
  Signup({Key key}) : super(key: key);

  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(
        child: RaisedButton(
          onPressed: ()=>Navigator.push(context,new MaterialPageRoute(builder: (context)=>Dashboard())),),),
    );
  }
}