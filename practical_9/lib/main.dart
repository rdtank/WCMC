import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Practical 9',
      home: MyAppHome(),
    );
  }
}

class MyAppHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Practical 9'),
          backgroundColor: Colors.deepPurpleAccent,
        ),
        body: Center(
          child: SingleChildScrollView(
              child: RaisedButton(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text(
                        'Google  ',
                        style: TextStyle(fontSize: 18.0),
                      ),
                      Icon(Icons.open_in_new)
                    ],
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SecondScreen()),
                    );
                  })),
        ));
  }
}

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(
      url: "https://www.google.com/",
      appBar: new AppBar(
        title: new Text("Google"),
        backgroundColor: Colors.deepPurpleAccent,
      ),
    );
  }
}
