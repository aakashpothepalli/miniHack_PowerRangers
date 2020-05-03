import 'package:flutter/material.dart';

import 'dashboard/dashboard.dart';
import 'package:shared_preferences/shared_preferences.dart';
class Signup extends StatefulWidget {
  Signup({Key key}) : super(key: key);

  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  
  int gender=1;
  TextEditingController name= new TextEditingController();
  TextEditingController age= new TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  
  void saveData()async{
    var prefs = await SharedPreferences.getInstance();
    prefs.setInt('age', int.parse(age.text));
    prefs.setString('name', name.text);
    prefs.setInt('gender',gender ); 

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Form(
        key: _formKey,
              child: ListView(
          children: <Widget>[

           Image.asset('assets/images/ProFitLogo.jpeg',height:200),
            
            SizedBox(height: 20,),

                Center(
                  child: Text(
                    'Sign Up',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                SizedBox(height: 40,),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: name,
                    decoration: InputDecoration(
                      labelText: 'Name',
                    ),
                    validator: (String arg) {
                      if(arg.length < 3)
                        return 'Name must be more than 2 character';
                      else
                        return null;
                    },

                  ),
                ),
            SizedBox(height: 40,),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: age,
                    keyboardType: TextInputType.number,

                    decoration: InputDecoration(
                      labelText: 'Age',
                    ),
                    validator: (String arg) {
                      if(arg.length < 1)
                        return 'Age must not be empty';
                      else
                        return null;
                    },
                  ),
                ),
            SizedBox(height: 40,),

                Padding(
                  
                  padding: const EdgeInsets.all(8.0),
                  child:DropdownButton(
                    value: gender,
                    items: [
                    DropdownMenuItem(child: Text('Male'),value: 1,),
                    DropdownMenuItem(child: Text('Female'),value: 2,),
                  ], onChanged: (index){
                    setState(() {
                      gender = index;
                    });
                  })
                ),
            SizedBox(height: 40,),

                Container(
                    width: 300,
                    height: 45,
                    child: RaisedButton(
                      onPressed: () async{
                        if(_formKey.currentState.validate()){
                          saveData();
                          Navigator.push(context, MaterialPageRoute(builder: (context) => Dashboard()));
                       }
                      },
                      child: Text('SIGN UP'),
                      textColor: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                      color: Colors.grey[800],
                    )),
          ],
        ),
      ),
    );
  }
}