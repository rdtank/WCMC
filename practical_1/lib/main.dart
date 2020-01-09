import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Practical 1',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Practical 1'),
        ),
        backgroundColor: Colors.yellow,
        body: Center(
          child: Text('17IT114',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20.0)),
        ),
      ),
    );
  }
}
