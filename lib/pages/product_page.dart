import 'package:flutter/material.dart';

class ProductPage extends StatefulWidget {
  String imagePath;
  String itemName;
  ProductPage({this.imagePath,this.itemName});

  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  bool isdark;
  
  @override
  Widget build(BuildContext context) {
    var brightness = MediaQuery.of(context).platformBrightness;
  if(brightness==Brightness.dark)
    isdark=true;
  else
    isdark = false;
    return Scaffold(
      body: NestedScrollView(

       headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return <Widget>[
        SliverAppBar(

              expandedHeight: 300.0,
              floating: true,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                  centerTitle: true,
                  title:Text(widget.itemName??"Product"),
                  background: Image.asset(
                    widget.imagePath,
                    fit: BoxFit.cover,
                  )),
            ),    
            
        ];
        },
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            
            FlatButton(child: Text('buy now'),onPressed: (){},),
          ],
        ),
      ),
    );
  }
}