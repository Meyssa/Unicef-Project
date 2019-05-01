import 'package:flutter/material.dart';

scoreTile(rank, name, score) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: <Widget>[
      Container(
        width: 64.0,
        child: Text(
          score,
          textAlign: TextAlign.center,
          textDirection: TextDirection.rtl,
        ),
      ),
      Container(
        width: 64.0,
        child: Text(
          name,
          textAlign: TextAlign.center,
          textDirection: TextDirection.rtl,
        ),
      ),
      Container(
        width: 64.0,
        child: Text(
          rank,
          textAlign: TextAlign.center,
          textDirection: TextDirection.rtl,
        ),
      )
    ],
  );
}
