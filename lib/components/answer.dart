import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';

answer(context, index, text, myGroup, color) {
  return Container(
    decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(18.0)),
        border: Border.all(
          width: 2.0,
          color: color,
        )),
    padding: EdgeInsets.all(10.0),
    width: MediaQuery.of(context).size.width / 3 - 40,
    child: Column(
      children: <Widget>[
        AutoSizeText(
          " ${3 - index} الاجابة ",
          style: TextStyle(fontSize: 20.0),
        ),
        Divider(
          height: 10,
          color: Colors.black,
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: AutoSizeText(
              text,
              group: myGroup,
              textDirection: TextDirection.rtl,
              style: TextStyle(fontSize: 20.0),
            ),
          ),
        ),
      ],
    ),
  );
}
