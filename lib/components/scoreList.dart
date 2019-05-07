import 'package:flutter/material.dart';
import 'package:unicef/model/scores.dart';
import 'package:unicef/components/scoreTile.dart';
import 'package:unicef/screens/mainMenu.dart';

class ScoreList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget _buildScoreTile(BuildContext context, int index) {
      return scoreTile(scores[index].rank.toString(), scores[index].name,
          scores[index].score.toString());
    }

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24.0),
        color: Colors.white,
      ),
      margin: EdgeInsets.all(32),
      padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            child: Container(
              width: 200.0,
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "اعلى نتيجة",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.button,
              ),
            ),
            decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(24.0)),
          ),
          SizedBox(
            height: 18.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text("النتيجة "),
              Text("إسم المستخدم"),
              Text("المركز ")
            ],
          ),
          Expanded(
            child: ListView.builder(
              itemBuilder: _buildScoreTile,
              itemCount: scores.length,
            ),
          ),
          Container(
            child: Container(
              width: 100.0,
              margin: const EdgeInsets.all(8.0),
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
            ),
          ),
        ],
      ),
    );
  }
}
