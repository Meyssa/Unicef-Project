import 'package:flutter/material.dart';
import 'package:unicef/components/paramMenu.dart';

class Parameters extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Image.asset(
            "assets/menu.png",
            centerSlice: Rect.largest,
          ),
          ParamMenu()
        ],
      ),
    );
  }
}
