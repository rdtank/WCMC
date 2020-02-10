import 'package:flutter/material.dart';
import 'package:torch/torch.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Practical 6',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Practical 6'),
          backgroundColor: Colors.lightGreen,
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Container(
              child: Column(
                children: <Widget>[
                  RaisedButton(
                      child: Text(
                        'ON',
                        style: TextStyle(fontSize: 20.0),
                      ),
                      color: Colors.blueAccent,
                      textColor: Colors.white,
                      onPressed: () {
                        Torch.turnOn();
                      }),
                  SizedBox(
                    height: 50.0,
                  ),
                  RaisedButton(
                      child: Text(
                        'OFF',
                        style: TextStyle(fontSize: 20.0),
                      ),
                      color: Colors.blueAccent,
                      textColor: Colors.white,
                      onPressed: () {
                        Torch.turnOff();
                      }),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
