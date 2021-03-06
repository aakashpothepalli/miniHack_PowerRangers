import 'package:flutter/material.dart';
import 'package:msrit_power_rangers/pages/dashboard/home.dart';
import 'package:msrit_power_rangers/pages/send_to_trainer.dart';
import 'package:provider/provider.dart';
import 'users.dart';
class Menu extends StatefulWidget{


  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  GlobalKey<ScaffoldState> key = new GlobalKey();

 Widget build(BuildContext context) {

  _increaseCalorieCount(double count,String mealName,String imgurl){
    
    key.currentState.showSnackBar(SnackBar(content: Text("$count Calories Consumed"),));
    Navigator.push(context, new MaterialPageRoute(builder: (context)=>SendToTrainer(mealName: mealName,calories: count,imgurl:imgurl)));
    Provider.of<User>(context,listen: false).increaseCalorieCount(count);
  }

    return Scaffold(
      key: key,
      appBar: AppBar(
        title: Text('Menu'),
        backgroundColor: Colors.red,
      ), 
      body: ListView(
        children: <Widget> [
      Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget> [

          Card(
            child: Column(
              children: <Widget>[
              Image.network('https://www.indianhealthyrecipes.com/wp-content/uploads/2013/01/idli-recipe-1-500x500.jpg',fit: BoxFit.fitWidth,),
                ListTile(
                title: Text('Idli'),
                subtitle:Text('Calorie Count : 156'),
                trailing:  IconButton (
                 icon:Icon(Icons.add_circle),
                 tooltip: "send rating to trainer",
                //  color:Colors.blue,
                 onPressed: (){
                    _increaseCalorieCount(156,'Idli','https://www.indianhealthyrecipes.com/wp-content/uploads/2013/01/idli-recipe-1-500x500.jpg');
                 }
                ),
                ),
              ],
            ),
          ),
          Card(
            child: Column(
              children: <Widget>[
              Image.network('https://www.indianhealthyrecipes.com/wp-content/uploads/2020/03/chicken-curry-recipe-500x500.jpg',fit: BoxFit.fitWidth,),
                ListTile(
                title: Text('Chicken curry'),
                subtitle:Text('Calorie Count : 163'),
                trailing:  IconButton (
                 icon:Icon(Icons.add_circle),
                 tooltip: "send rating to trainer",
                //  color:Colors.blue,
                 onPressed: (){
                   //Increases users' calorie count
                    _increaseCalorieCount(163,'Chicken Curry','https://www.indianhealthyrecipes.com/wp-content/uploads/2020/03/chicken-curry-recipe-500x500.jpg');

                 }
                ),
                ),
              ],
            ),
          ),
          Card(
            child: Column(
              children: <Widget>[
              Image.network('https://i2.wp.com/www.vegrecipesofindia.com/wp-content/uploads/2018/12/paneer-tikka-1a.jpg',fit: BoxFit.fitWidth,),
                ListTile(
                title: Text('Paneer tikka'),
                subtitle:Text('Calorie Count : 420'),
                trailing:  IconButton (
                 icon:Icon(Icons.add_circle),
                 tooltip: "send rating to trainer",
                //  color:Colors.blue,
                 onPressed: (){
                   //Increases users' calorie count
                    _increaseCalorieCount(420,'Paneer Tikka','https://i2.wp.com/www.vegrecipesofindia.com/wp-content/uploads/2018/12/paneer-tikka-1a.jpg');
                 }
                ),
                ),
              ],
            ),
          ),
          Card(
            child: Column(
              children: <Widget>[
              Image.network('https://www.cubesnjuliennes.com/wp-content/uploads/2020/01/South-Indian-Rava-Upma-Recipe.jpg',fit: BoxFit.fitWidth,),
                ListTile(
                title: Text('Upma'),
                subtitle:Text('Calorie Count : 171'),
                trailing:  IconButton (
                 icon:Icon(Icons.add_circle),
                 tooltip: "check with trainer",
                //  color:Colors.blue,
                 onPressed: (){
                  _increaseCalorieCount(171,'Upma','https://www.cubesnjuliennes.com/wp-content/uploads/2020/01/South-Indian-Rava-Upma-Recipe.jpg');

                   //Increases users' calorie count
                 }
                ),
                ),
              ],
            ),
          ),
          Card(
            child: Column(
              children: <Widget>[
              Image.network('https://food.fnr.sndimg.com/content/dam/images/food/fullset/2011/5/27/0/CC_Summer-Corn-Salad_s4x3.jpg.rend.hgtvcom.826.620.suffix/1387569422363.jpeg',fit: BoxFit.fitWidth,),
                ListTile(
                title: Text('Corn Salad'),
                subtitle:Text('Calorie Count : 202'),
                trailing:  IconButton (
                 icon:Icon(Icons.add_circle),
                 tooltip: "check with trainer",
                //  color:Colors.blue,
                 onPressed: (){
                   //Increases users' calorie count
                                       _increaseCalorieCount(202,'Corn Salad','https://food.fnr.sndimg.com/content/dam/images/food/fullset/2011/5/27/0/CC_Summer-Corn-Salad_s4x3.jpg.rend.hgtvcom.826.620.suffix/1387569422363.jpeg');

                 }
                ),
                ),
              ],
            ),
          ),
          Card(
            child: Column(
              children: <Widget>[
              Image.network('https://img.taste.com.au/Zrnjx_6a/taste/2016/11/beetroot-and-carrot-soup-45708-1.jpeg',fit: BoxFit.fitWidth,),
                ListTile(
                title: Text('Beetroot and Carrot Soup'),
                subtitle:Text('Calorie Count : 196'),
                trailing:  IconButton (
                 icon:Icon(Icons.add_circle),
                 tooltip: "check with trainer",
                //  color:Colors.blue,
                 onPressed: (){
                   //Increases users' calorie count
                                       _increaseCalorieCount(196,'Beetroot and Carrot Soup','https://img.taste.com.au/Zrnjx_6a/taste/2016/11/beetroot-and-carrot-soup-45708-1.jpeg');

                 }
                ),
                ),
              ],
            ),
          ),
          
        //    RaisedButton(
        //     child: Text('Go Back'),
        //      onPressed: () {
        //        Navigator.pop(
        //          context,
        //           MaterialPageRoute(builder: (context) => Home()),
        //         );
        //   },
        // ),
         

        ]
      ),
       ]
      )
    );
  }
}
