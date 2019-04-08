import 'package:flutter/material.dart';
import 'package:unicef/components/timerPainer.dart';

answer(context, index, text) {
  return Container(
    padding: EdgeInsets.all(10.0),
    width: MediaQuery.of(context).size.width / 3 - 40,
    child: Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(18.0),
          child: Text(
            "el idjaba ${index + 1}",
            style: Theme.of(context).textTheme.headline,
          ),
        ),
        Divider(
          height: 10,
          color: Colors.black,
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              text,
              style: Theme.of(context).textTheme.headline,
            ),
          ),
        ),
      ],
    ),
  );
}
