import 'package:flutter/material.dart';

class Trainer extends StatefulWidget {
  Trainer({Key key}) : super(key: key);

  @override
  _TrainerState createState() => _TrainerState();
}

class _TrainerState extends State<Trainer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
            body: Center(child: Text('trainer')),
    );
  }
}