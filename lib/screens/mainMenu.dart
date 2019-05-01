import 'package:flutter/material.dart';
import 'package:unicef/components/menu.dart';

class MainMenu extends StatelessWidget {
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
          margin: EdgeInsets.only(left: MediaQuery.of(context).size.width / 2),
          child: menu(context),
        )
      ],
    );
  }
}
