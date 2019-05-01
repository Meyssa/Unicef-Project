import 'package:flutter/material.dart';
import 'package:unicef/components/menuButton.dart';
import 'package:unicef/screens/scenario.dart';
import 'package:unicef/screens/parameters.dart';
import 'package:unicef/screens/scoreBoard.dart';

menu(context) {
  void _story() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => Scenario()));
  }

  void _params() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => Parameters()));
  }

  void _scores() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => ScoreBoard()));
  }

  return Container(
    padding: EdgeInsets.symmetric(vertical: 12.0),
    width: MediaQuery.of(context).size.width - 100 / 2,
    margin: EdgeInsets.all(28.0),
    decoration: BoxDecoration(
        color: Colors.white, borderRadius: BorderRadius.circular(24.0)),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        menuButton("قصة", Color(0xff2ecc71), context, _story),
        SizedBox(
          height: 12.0,
        ),
        menuButton("مساعدة", Color(0xffe74c3c), context, () => print('hi')),
        SizedBox(
          height: 12.0,
        ),
        menuButton("اعلى نتيجة", Color(0xfff1c40f), context, _scores),
        SizedBox(
          height: 12.0,
        ),
        menuButton("الاعدادات", Color(0xff3498db), context, _params),
      ],
    ),
  );
}
