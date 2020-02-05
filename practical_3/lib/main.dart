import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Practical 3',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Practical 3'),
          backgroundColor: Colors.greenAccent,
        ),
        body: ShowToast(),
      ),
    );
  }
}

class ShowToast extends StatefulWidget {
  @override
  _ShowToastState createState() => _ShowToastState();
}

class _ShowToastState extends State<ShowToast> with WidgetsBindingObserver {
  int hrs = 0, min = 0, sec = 0;
  var h = "00", m = "00", s = "00";

  void createToast() {
    Fluttertoast.showToast(msg: '$sec sec passed');
  }

  void timer() {
    Timer.periodic(
        Duration(seconds: 1),
        (Timer t) => setState(() {
              sec++;
              min += (sec ~/ 60);
              hrs += (min ~/ 60);
              sec = sec % 60;
              min = min % 60;
              hrs = hrs % 60;
              h = hrs.toString().padLeft(2, '0');
              m = min.toString().padLeft(2, '0');
              s = sec.toString().padLeft(2, '0');
            }));
    Timer.periodic(Duration(seconds: 5), (Timer t) => createToast());
  }

  @override
  void initState() {
    super.initState();
    timer();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "$h:$m:$s",
        style: TextStyle(fontSize: 40.0),
      ),
    );
  }
}
