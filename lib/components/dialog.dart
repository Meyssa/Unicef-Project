import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';

dialog(text, context) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.end,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Container(
        constraints:
            BoxConstraints(maxHeight: MediaQuery.of(context).size.height - 180),
        padding: EdgeInsets.all(8.0),
        width: MediaQuery.of(context).size.width / 2,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(8.0))),
        child: AutoSizeText(
          text,
          textDirection: TextDirection.rtl,
          style: TextStyle(fontSize: 20.0),
        ),
      ),
      Image.asset("assets/chatTail.png"),
      Image.asset("assets/mostefai.png")
    ],
  );
}
