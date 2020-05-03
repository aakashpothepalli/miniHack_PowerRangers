import 'package:flutter/material.dart';
class EE extends StatelessWidget {
  const EE({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.network('https://www.simonsaysstampblog.com/wp-content/uploads/2018/07/MG_4524-735x518.jpg'),
          Text('SURPRISE!! wait for the image to load')
        ],
      ) ,
    );
  }
}