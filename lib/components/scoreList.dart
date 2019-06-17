import 'package:flutter/material.dart';
import 'package:unicef/components/scoreTile.dart';
import 'package:unicef/screens/mainMenu.dart';
import 'package:unicef/model/player.dart';
import 'package:unicef/model/database_helper.dart';
import 'package:unicef/model/globalVar.dart' as globals;

class ScoreList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
            //TODO : make this look like the score Tile or the opposite
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text("النتيجة "),
              Text("إسم المستخدم"),
              Text("المركز ")
            ],
          ),
          Expanded(
            child: FutureBuilder<List<Player>>(
              future: DBProvider.db.getAllPlayers(),
              builder:
                  (BuildContext context, AsyncSnapshot<List<Player>> snapshot) {
                if (snapshot.hasData) {
                  snapshot.data.sort((a, b) => a.score.compareTo(b.score));
                  snapshot.data.reversed;
                  return ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (BuildContext context, int index) {
                      Player item =
                          snapshot.data[snapshot.data.length - 1 - index];
                      print(item);
                      return Dismissible(
                          key: UniqueKey(),
                          background: Container(color: Colors.red),
                          onDismissed: (direction) {
                            DBProvider.db.deletePlayer(item.id);
                          },
                          child: scoreTile(
                              (index + 1).toString(), item.name, item.score));
                    },
                  );
                } else {
                  return Center(child: CircularProgressIndicator());
                }
              },
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
