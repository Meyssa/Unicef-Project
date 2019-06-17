import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'screens/mainMenu.dart';

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
                  fontSize: 18.0,
                  color: Colors.black,
                  fontWeight: FontWeight.normal),
              body1: TextStyle(fontSize: 22.0, color: Colors.black87),
              button: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                  fontWeight: FontWeight.normal),
              subhead: TextStyle(
                fontSize: 20.0,
              ),
              body2: TextStyle(fontSize: 22.0)),
          primaryColor: Colors.greenAccent[400]),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: MainMenu(),
    );
  }
}
