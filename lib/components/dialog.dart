import 'package:flutter/material.dart';

dialog(speech) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.end,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Container(
        padding: EdgeInsets.all(12.0),
        width: 200.0,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(8.0))),
        child: Text(speech),
      ),
      Image.asset("assets/chatTail.png"),
      Image.asset("assets/mostefai.png")
    ],
  );
}
