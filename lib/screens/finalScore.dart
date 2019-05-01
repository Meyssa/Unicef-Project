import 'package:flutter/material.dart';
import 'package:unicef/components/finalScore.dart';

class FinalScore extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      alignment: Alignment.center,
      children: <Widget>[
        Image.asset(
          "assets/menu.png",
          centerSlice: Rect.largest,
        ),
        Container(
          margin: EdgeInsets.only(left: 300.0),
          child: finalScore(context),
        )
      ],
    );
  }
}
