import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'components/dialog.dart';
import 'screens/quizView.dart';
import 'screens/scenario.dart';

void main() {
  SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeRight])
      .then((_) {
    runApp(new MyApp());
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
      theme: ThemeData(
          textTheme: TextTheme(
              title: TextStyle(
                  fontSize: 20.0,
                  color: Colors.black,
                  fontWeight: FontWeight.normal),
              body1: TextStyle(fontSize: 20.0, color: Colors.black87)),
          primaryColor: Colors.greenAccent[400]),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Scenario(0),
    );
  }
}
