import 'package:flutter/material.dart';
import 'package:unicef/model/globalVar.dart' as globals;
import 'package:unicef/screens/mainMenu.dart';
import 'package:unicef/model/stories.dart';
import 'package:unicef/model/globalVar.dart' as globals;
import 'package:unicef/model/database_helper.dart';
import 'package:unicef/model/player.dart';

finalScore(context) {
  return Material(
    color: Colors.transparent,
    child: Container(
      padding: EdgeInsets.symmetric(vertical: 12.0),
      width: MediaQuery.of(context).size.width - 100 / 2,
      margin: EdgeInsets.all(28.0),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(24.0)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            height: 12.0,
          ),
          Text(
            "النتيجة النهائية",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 12.0,
          ),
          Text(" : حصلت على "),
          SizedBox(
            height: 12.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            textDirection: TextDirection.rtl,
            children: <Widget>[
              Text("${globals.correctAnswers}/${stories.length}"),
              Text(
                " إجابة الصحيحة ",
              ),
            ],
          ),
          Expanded(
            child: Container(),
          ),
          Text(
            "  المجموع ",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            textDirection: TextDirection.rtl,
            children: <Widget>[
              Text(" ${globals.currentPlayer.score}  "),
              Text(" نقطة")
            ],
          ),
          Expanded(
            child: Container(),
          ),
          Container(
            width: 100,
            child: Material(
              borderRadius: BorderRadius.circular(20.0),
              color: Theme.of(context).primaryColor,
              child: InkWell(
                onTap: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MainMenu())),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("الرجوع",
                      style: Theme.of(context).textTheme.button,
                      textAlign: TextAlign.center),
                ),
              ),
            ),
          )
        ],
      ),
    ),
  );
}
