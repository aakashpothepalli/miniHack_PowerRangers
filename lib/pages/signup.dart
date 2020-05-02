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
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Text(
              'Sign Up',
              style: TextStyle(fontSize: 20),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Your Email',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Name',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                ),
              ),
            ),
            Container(
                width: 300,
                height: 45,
                child: RaisedButton(
                  onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => Dashboard()));
                  },
                  child: Text('SIGN UP'),
                  textColor: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  color: Colors.grey[800],
                )),
            Text('or sign up with social Account'),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: 120,
                  height: 40,
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25)),
                    onPressed: () {},
                    color: Colors.blue[900],
                    textColor: Colors.white,
                    child: Text('Facebook'),
                  ),
                ),
                SizedBox(width: 20),
                Container(
                  width: 120,
                  height: 40,
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25)),
                    onPressed: () {},
                    color: Colors.blue,
                    textColor: Colors.white,
                    child: Text('Twitter'),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}