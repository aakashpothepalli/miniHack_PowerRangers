import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../product_page.dart';

class Shop extends StatelessWidget {
  
  final List<String> _listItem = [
    'assets/images/Avacado.jpeg',
    'assets/images/Bitter Gourd.jpeg',
    'assets/images/broccoli.jpeg',
    'assets/images/Cap.jpeg',
    'assets/images/Gym Gloves.jpeg',
    'assets/images/rasberry.jpeg',
    'assets/images/socks.jpeg',
    'assets/images/Zucchini.jpeg',

  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.white,
      // appBar: AppBar(
      //   backgroundColor: Colors.transparent,
      //   elevation: 0,
      //   leading: Icon(Icons.menu),
      //   title: Text("Home"),
      //   // actions: <Widget>[
      //   //   Padding(
      //   //     padding: EdgeInsets.all(10),
      //   //     child: Container(
      //   //       width: 36,
      //   //       height: 30,
      //   //       decoration: BoxDecoration(
      //   //           color: Colors.grey[800],
      //   //           borderRadius: BorderRadius.circular(10)
      //   //       ),
      //   //       child: Center(child: Text("0")),
      //   //     ),
      //   //   )
      //   // ],
      // ),
      body: NestedScrollView(
       // mainAxisAlignment: MainAxisAlignment.start,
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {

        return <Widget>[
          SliverAppBar(
              expandedHeight: 200.0,
              floating: false,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                  centerTitle: true,
                  title:Text("Lifestyle Sale"),
                  background: Image.asset(
                    "assets/images/blueberry.jpeg",
                    fit: BoxFit.cover,
                  )),
            ),
            
          // Container(
          //   width: double.infinity,
          //   height: 200,
          //   decoration: BoxDecoration(
          //       borderRadius: BorderRadius.circular(20),
          //       image: DecorationImage(
          //           image: AssetImage('assets/images/blueberry.jpeg'),
          //           fit: BoxFit.cover
          //       )
          //   ),
          //   child: Container(
          //     decoration: BoxDecoration(
          //         borderRadius: BorderRadius.circular(10),
          //         gradient: LinearGradient(
          //             begin: Alignment.bottomRight,
          //             colors: [
          //               Colors.black.withOpacity(.4),
          //               Colors.black.withOpacity(.2),
          //             ]
          //         )
          //     ),
          //     child: Column(
          //       mainAxisAlignment: MainAxisAlignment.center,
          //       children: <Widget>[
          //         Text("Lifestyle Sale", style: TextStyle(color: Colors.white, fontSize: 35, fontWeight: FontWeight.bold),),
          //         SizedBox(height: 30,),
          //         Container(
          //           height: 50,
          //           margin: EdgeInsets.symmetric(horizontal: 40),
          //           decoration: BoxDecoration(
          //               borderRadius: BorderRadius.circular(10),
          //               color: Colors.white
          //           ),
          //           child: Center(child: Text("Shop Now", style: TextStyle(color: Colors.grey[900], fontWeight: FontWeight.bold),)),
          //         ),
          //         SizedBox(height: 30,),
          //       ],
          //     ),
          //   ),
          // ),
          ];},
          body:GridView.count(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            children: _listItem.map((item) => Card(
              color: Colors.transparent,
              elevation: 0,
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                        image: AssetImage(item),
                        fit: BoxFit.cover
                    )
                ),
                child: FlatButton(
                  onPressed: (){
                    Navigator.push(context, new MaterialPageRoute(builder: (context)=>ProductPage(imagePath: item,itemName: 'Avacado',)));
                  },
                  child: Transform.translate(
                    offset: Offset(50, -50),
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 65, vertical: 63),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.black54
                      ),
                      child: Center(child: Text("15% Off",style: TextStyle(color: Colors.green),))
                    ),
                  ),
                ),
              ),
            )).toList(),
          )
      ),
    );
  }

}
