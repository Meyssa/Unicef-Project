import 'package:flutter/material.dart';
import 'package:unicef/screens/mainMenu.dart';
import 'package:unicef/model/database_helper.dart';

class ParamMenu extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ParamMenuState();
  }
}

class ParamMenuState extends State<ParamMenu> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24.0),
        color: Colors.white,
      ),
      margin: EdgeInsets.all(32),
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            child: Container(
              width: 200.0,
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "الاعدادات",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.button,
              ),
            ),
            decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(24.0)),
          ),
          Container(
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Container(
                          width: 100.0,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: Theme.of(context).primaryColor),
                              borderRadius: BorderRadius.circular(24.0)),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("Français",
                                style: TextStyle(
                                    fontSize: 16.0,
                                    color: Theme.of(context).primaryColor),
                                textAlign: TextAlign.center),
                          ),
                        ),
                        SizedBox(
                          width: 20.0,
                        ),
                        Container(
                          width: 100.0,
                          decoration: BoxDecoration(
                              color: Theme.of(context).primaryColor,
                              border: Border.all(
                                  color: Theme.of(context).primaryColor),
                              borderRadius: BorderRadius.circular(24.0)),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("عربية",
                                style: TextStyle(
                                    fontSize: 12.0, color: Colors.white),
                                textAlign: TextAlign.center),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Text(
                      "تغيير اللغة",
                    )
                  ],
                ),
              ],
            ),
          ),
          Container(
            child: FlatButton(
              onPressed: () async {
                await DBProvider.db.deleteAll();
              },
              child:
                  Text("حذف جميع النتائج", style: TextStyle(color: Colors.red)),
            ),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.red),
                borderRadius: BorderRadius.circular(24.0)),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
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
            ),
          ),
        ],
      ),
    );
  }
}
