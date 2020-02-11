import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _PopoupState createState() => _PopoupState();
}

class _PopoupState extends State<MyApp> {
  Color bgColor;
  void choiceAction(String choice) {
    if (choice == Constants.White) {
      setState(() {
        bgColor = Colors.white;
      });
    }
    if (choice == Constants.Black) {
      setState(() {
        bgColor = Colors.black;
      });
    }
    if (choice == Constants.Red) {
      setState(() {
        bgColor = Colors.red;
      });
    }
    if (choice == Constants.Blue) {
      setState(() {
        bgColor = Colors.blue;
      });
    }
    if (choice == Constants.Green) {
      setState(() {
        bgColor = Colors.green;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Practical 7',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Practical 7'),
          backgroundColor: Colors.deepPurpleAccent,
          actions: <Widget>[
            PopupMenuButton<String>(
              onSelected: choiceAction,
              itemBuilder: (BuildContext context) {
                return Constants.choices.map((String choice) {
                  return PopupMenuItem<String>(
                      value: choice, child: Text(choice));
                }).toList();
              },
            )
          ],
        ),
        backgroundColor: bgColor,
      ),
    );
  }
}

class Constants {
  static const String White = 'White';
  static const String Black = 'Black';
  static const String Red = 'Red';
  static const String Blue = 'Blue';
  static const String Green = 'Green';
  static const List<String> choices = <String>[White, Black, Red, Blue, Green];
}
