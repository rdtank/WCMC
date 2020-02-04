import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SumState();
  }
}

class _SumState extends State<MyApp> {
  double firstnum, secondnum, sum;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Practical 2',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Practical 2'),
        ),
        body: Container(
            margin: EdgeInsets.all(20.0),
            child: Center(
              child: SingleChildScrollView(
                  child: Column(
                children: <Widget>[
                  TextField(
                    keyboardType: TextInputType.number,
                    decoration:
                        InputDecoration(labelText: 'Enter First Number'),
                    onChanged: (String value) {
                      setState(() {
                        firstnum = double.parse(value);
                      });
                    },
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  TextField(
                    keyboardType: TextInputType.number,
                    decoration:
                        InputDecoration(labelText: 'Enter Second Number'),
                    onChanged: (String value) {
                      setState(() {
                        secondnum = double.parse(value);
                      });
                    },
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  RaisedButton(
                    child: Text('Sum'),
                    color: Colors.deepOrange,
                    textColor: Colors.white,
                    onPressed: () {
                      sum = firstnum + secondnum;
                      Fluttertoast.showToast(
                          msg: 'Sum of two num is $sum',
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          timeInSecForIos: 3,
                          backgroundColor: Colors.deepPurpleAccent,
                          textColor: Colors.white,
                          fontSize: 16.0);
                    },
                  )
                ],
              )),
            )),
      ),
    );
  }
}
