import 'package:flutter/material.dart';
import 'package:unicef/components/menuButton.dart';
import 'package:unicef/screens/parameters.dart';
import 'package:unicef/screens/scoreBoard.dart';
import 'package:unicef/model/database_helper.dart';
import 'package:unicef/screens/scenario.dart';
import 'package:unicef/model/player.dart';
import 'package:unicef/model/globalVar.dart' as globals;
import 'package:unicef/components/helpDialog.dart';

class MainMenu extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MainMenuState();
  }
}

class MainMenuState extends State<MainMenu> {
  TextEditingController _controller = TextEditingController();

  Widget buildAboutDialog(BuildContext context) {
    var newPlayer = false;
    return new SingleChildScrollView(
      child: AlertDialog(
        title: Text(
          'مرحبا بك في لعبة جديدة',
          textDirection: TextDirection.rtl,
          textAlign: TextAlign.right,
        ),
        content: new Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            FlatButton(
              onPressed: () async {
                setState(() {
                  _controller.text.isEmpty
                      ? newPlayer = false
                      : newPlayer = true;
                });
                if (newPlayer) {
                  int id;
                  id = await DBProvider.db
                      .newPlayer(Player(name: _controller.text, score: 0));
                  globals.currentPlayer =
                      Player(name: _controller.text, score: 0, id: id);
                  globals.update = true;
                }

                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => Scenario()));
              },
              textColor: Theme.of(context).primaryColor,
              child: const Text('إبدأ'),
            ),
            Container(
              width: 240.0,
              child: Padding(
                padding: const EdgeInsets.all(6.0),
                child: TextField(
                    textAlign: TextAlign.center,
                    textDirection: TextDirection.rtl,
                    controller: _controller,
                    onSubmitted: (name) async {
                      if (name != "") {
                        int id;
                        id = await DBProvider.db.newPlayer(
                            Player(name: _controller.text, score: 0));
                        globals.currentPlayer =
                            Player(name: _controller.text, score: 0, id: id);
                        globals.update = true;
                      }
                      setState(() {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Scenario()));
                      });
                    },
                    decoration: InputDecoration.collapsed(hintText: "الإسم")),
              ),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24.0),
                  border: Border.all(color: Theme.of(context).primaryColor)),
            ),
          ],
        ),
      ),
    );
  }

  menu(context) {
    void _story() {
      showDialog(
        context: context,
        builder: (BuildContext context) => buildAboutDialog(context),
      );
    }

    void _params() {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Parameters()));
    }

    void _scores() {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => ScoreBoard()));
    }

    void _help() {
      showDialog(
        context: context,
        builder: (BuildContext context) => help(context),
      );
    }

    return Container(
      padding: EdgeInsets.symmetric(vertical: 12.0),
      width: MediaQuery.of(context).size.width - 100 / 2,
      margin: EdgeInsets.all(28.0),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(24.0)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          menuButton("قصة", Color(0xff2ecc71), context, _story),
          SizedBox(
            height: 12.0,
          ),
          menuButton("مساعدة", Color(0xffe74c3c), context, _help),
          SizedBox(
            height: 12.0,
          ),
          menuButton("اعلى نتيجة", Color(0xfff1c40f), context, _scores),
          SizedBox(
            height: 12.0,
          ),
          menuButton("الاعدادات", Color(0xff3498db), context, _params),
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: SingleChildScrollView(
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Image.asset(
              "assets/menu.png",
              centerSlice: Rect.largest,
            ),
            Container(
              margin:
                  EdgeInsets.only(left: MediaQuery.of(context).size.width / 2),
              child: menu(context),
            )
          ],
        ),
      ),
    );
  }
}
