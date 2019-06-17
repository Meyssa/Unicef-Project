import 'package:flutter/material.dart';
import 'package:unicef/components/finalScore.dart';
import 'package:unicef/screens/mainMenu.dart';
import 'package:unicef/model/globalVar.dart' as globals;
import 'package:unicef/model/stories.dart';
import 'package:unicef/model/player.dart';
import 'package:unicef/model/database_helper.dart';

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
          child: globals.update
              ? FutureBuilder<Player>(
                  future: DBProvider.db.updatePlayer(globals.currentPlayer),
                  builder:
                      (BuildContext context, AsyncSnapshot<Player> snapshot) {
                    if (snapshot.hasData) {
                      print(snapshot.data.score);
                      return finalScore(context);
                    } else
                      return new CircularProgressIndicator();
                  })
              : finalScore(context),
        )
      ],
    );
  }
}
