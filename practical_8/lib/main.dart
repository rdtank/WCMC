import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Carousel',
      home: MyCarousel(),
    );
  }
}

class MyCarousel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Practical 8'),
        backgroundColor: Colors.deepPurpleAccent,
      ),
      body: SingleChildScrollView(child: Column(
        children: <Widget>[
          Container(
            height: 400.0,
            child: Carousel(
              images:[
              ExactAssetImage('assets/1.jpg'),
              ExactAssetImage('assets/2.jpg'),
              ExactAssetImage('assets/3.jpg'),
              ExactAssetImage('assets/4.jpg'),
              ExactAssetImage('assets/5.jpg'),
              ],
              dotSize: 7,
              dotSpacing: 20.0,
              showIndicator: true,
              dotBgColor: Colors.transparent,
              overlayShadow: true,
              overlayShadowColors: Colors.white,
              overlayShadowSize: 0.2,
            ),
          ),
          SizedBox(height: 20.0,),
          Container(
              height: 350.0,
              child: ListView.builder(
                    itemCount: 10,
                    itemBuilder: ((context, index) => ListTile(
                          title: Text('index $index',style: TextStyle(color: Colors.redAccent,fontSize: 18.0),),
                          
                        ))),
              )
        ],
      ),)
    );
  }
}