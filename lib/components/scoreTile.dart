import 'package:flutter/material.dart';

scoreTile(rank, name, score) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: <Widget>[
      Container(
        width: 64.0,
        child: Text(
          score.toString(),
          textAlign: TextAlign.center,
          textDirection: TextDirection.rtl,
        ),
      ),
      Container(
        width: 64.0,
        child: Text(
          name.toString(),
          textAlign: TextAlign.center,
          textDirection: TextDirection.rtl,
        ),
      ),
      Container(
        width: 64.0,
        child: Text(
          rank.toString(),
          textAlign: TextAlign.center,
          textDirection: TextDirection.rtl,
        ),
      )
    ],
  );
}
