import 'package:flutter/material.dart';

finalScore(context) {
  return Material(
    color: Colors.transparent,
    child: Container(
      padding: EdgeInsets.symmetric(vertical: 12.0),
      width: MediaQuery.of(context).size.width - 100 / 2,
      margin: EdgeInsets.all(28.0),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(24.0)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            height: 12.0,
          ),
          Text("Final Score"),
          SizedBox(
            height: 12.0,
          ),
          Text("you got :"),
          SizedBox(
            height: 12.0,
          ),
          Text("2/3 questions right")
        ],
      ),
    ),
  );
}
