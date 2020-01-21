import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var _number1;
    return MaterialApp(
      title: 'addition',
      home: Scaffold(
          appBar: AppBar(
            title: Text('Practical 1'),
          ),
          body: new Column(
            Center(
              child: Padding(
                padding: EdgeInsets.only(top: 0.0),
                child: TextField(
                  decoration: InputDecoration(hintText: 'Enter First number'),
                  controller: _number1,
                  keyboardType: TextInputType.number,
                ),
              ),
            ),
            
          )),
    );
  }
}
