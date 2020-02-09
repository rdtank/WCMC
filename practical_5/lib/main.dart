import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Practical 5',
        home: Scaffold(
          appBar: AppBar(
            title: Text('Practical 5'),
            backgroundColor: Colors.orangeAccent,
          ),
          body: Login(),
        ));
  }
}

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final user = TextEditingController(), pass = TextEditingController();
  bool tVisible, buttonDisabled;
  int maxTry = 3;
  Color tColor;
  String msg = "";

  bool compare(u, p) {
    if (u.text == '17it114' && p.text == '1234') {
      return true;
    }
    return false;
  }

  void check(u, p) {
    if (compare(u, p)) {
      setState(() {
        msg = 'Successful';
        tColor = Colors.greenAccent;
        tVisible = true;
      });
    } else {
      setState(() {
        msg = 'Failed';
        tColor = Colors.redAccent;
        tVisible = true;
      });
      maxTry--;
      buttonDisabled = maxTry == 0 ? true : false;
    }
  }

  @override
  void initState() {
    super.initState();
    tVisible = false;
    buttonDisabled = false;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
      margin: EdgeInsets.all(40.0),
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Text(
              'Login',
              style: TextStyle(color: Colors.blue, fontSize: 25.0),
            ),
            SizedBox(
              height: 50.0,
            ),
            TextField(
              controller: user,
              decoration: InputDecoration(
                  icon: Icon(Icons.person),
                  labelText: 'Username',
                  hintText: 'Enter Username',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  )),
            ),
            SizedBox(
              height: 15.0,
            ),
            TextField(
              controller: pass,
              obscureText: true,
              decoration: InputDecoration(
                  icon: Icon(Icons.lock),
                  labelText: 'Password',
                  hintText: 'Enter Password',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  )),
            ),
            SizedBox(
              height: 20.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                RaisedButton(
                    child: Text('Login'),
                    color: Colors.amberAccent,
                    onPressed: buttonDisabled
                        ? null
                        : () {
                            check(user, pass);
                          }),
                Padding(padding: EdgeInsets.only(left: 30.0, right: 30.0)),
                RaisedButton(
                    child: Text('Cancel'),
                    color: Colors.amberAccent,
                    onPressed: () {
                      SystemChannels.platform
                          .invokeMethod("SystemNavigator.pop");
                    }),
              ],
            ),
            SizedBox(height: 35.0,),
            Visibility(
              visible: tVisible,
              child: Text(msg,style: TextStyle(color: tColor,fontSize: 30.0),),
            )
          ],
        ),
      ),
    ));
  }
}
