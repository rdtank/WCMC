import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          brightness: Brightness.light,
          primaryColor: Colors.blue,
          accentColor: Colors.cyan),
      home: MyApp(),
    ));

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String stdName, stdID, stdBranch;
  double stdCGPA;

  getStudentName(name) {
    this.stdName = name;
  }

  getStudentId(id) {
    this.stdID = id;
  }

  getStudentBranch(branch) {
    this.stdBranch = branch;
  }

  getStudentCgpa(cgpa) {
    this.stdCGPA = double.parse(cgpa);
  }

  createData() {
    DocumentReference documentReference =
        Firestore.instance.collection("Students").document(stdName);
    Map<String, dynamic> students = {
      "stdName": stdName,
      "stdID": stdID,
      "stdBranch": stdBranch,
      "stdCGPA": stdCGPA
    };
    documentReference.setData(students).whenComplete(() {
      print("$stdName Created");
    });
  }

  readData() {
    DocumentReference documentReference =
        Firestore.instance.collection("Students").document(stdName);
    documentReference.get().then((datasnapshot) {
      print(datasnapshot.data["stdName"]);
      print(datasnapshot.data["stdID"]);
      print(datasnapshot.data["stdBranch"]);
      print(datasnapshot.data["stdCGPA"]);
    });
  }

  updateData() {
    DocumentReference documentReference =
        Firestore.instance.collection("Students").document(stdName);
    Map<String, dynamic> students = {
      "stdName": stdName,
      "stdID": stdID,
      "stdBranch": stdBranch,
      "stdCGPA": stdCGPA
    };
    documentReference.setData(students).whenComplete(() {
      print("$stdName Updated");
    });
  }

  deleteData() {
    DocumentReference documentReference =
        Firestore.instance.collection("Students").document(stdName);
    documentReference.delete().whenComplete(() {
      print("$stdName Deleted");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("17IT114-Firebase"),
        ),
        body: Padding(
          padding: EdgeInsets.all(16.0),
          child: SingleChildScrollView(
              child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(bottom: 10.0),
                child: TextFormField(
                  decoration: InputDecoration(
                      labelText: "Name",
                      fillColor: Colors.white,
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.blue, width: 2.0))),
                  onChanged: (String name) {
                    getStudentName(name);
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 10.0),
                child: TextFormField(
                  decoration: InputDecoration(
                      labelText: "Student ID",
                      fillColor: Colors.white,
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.blue, width: 2.0))),
                  onChanged: (String id) {
                    getStudentId(id);
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 10.0),
                child: TextFormField(
                  decoration: InputDecoration(
                      labelText: "Branch",
                      fillColor: Colors.white,
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.blue, width: 2.0))),
                  onChanged: (String branch) {
                    getStudentBranch(branch);
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 10.0),
                child: TextFormField(
                  decoration: InputDecoration(
                      labelText: "CGPA",
                      fillColor: Colors.white,
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.blue, width: 2.0))),
                  onChanged: (String cgpa) {
                    getStudentCgpa(cgpa);
                  },
                ),
              ),
              Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      RaisedButton(
                        color: Colors.green,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16)),
                        child: Text("Create"),
                        textColor: Colors.white,
                        onPressed: () {
                          createData();
                        },
                      ),
                      RaisedButton(
                        color: Colors.blue,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16)),
                        child: Text("Read"),
                        textColor: Colors.white,
                        onPressed: () {
                          readData();
                        },
                      ),
                    ],
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        RaisedButton(
                          color: Colors.orange,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16)),
                          child: Text("Update"),
                          textColor: Colors.white,
                          onPressed: () {
                            updateData();
                          },
                        ),
                        RaisedButton(
                          color: Colors.red,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16)),
                          child: Text("Delete"),
                          textColor: Colors.white,
                          onPressed: () {
                            deleteData();
                          },
                        )
                      ])
                ],
              ),
            ],
          )),
        ));
  }
}
