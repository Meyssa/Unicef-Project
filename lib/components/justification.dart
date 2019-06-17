import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

Widget justification(context, text, onPressed, {link}) {
  return AlertDialog(
    content: Container(
      width: MediaQuery.of(context).size.width / 3,
      height: MediaQuery.of(context).size.height / (1.8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "التفسير",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    text,
                    textDirection: TextDirection.rtl,
                  ),
                  link != null
                      ? Padding(
                          padding: EdgeInsets.all(8.0),
                          child: InkWell(
                            child: Text(
                              "اضغط للمعرفة المزيد ",
                              style: TextStyle(color: Colors.blue),
                            ),
                            onTap: () => launch(link),
                          ),
                        )
                      : Container(),
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 20.0),
            width: 100,
            child: Material(
              borderRadius: BorderRadius.circular(20.0),
              color: Theme.of(context).primaryColor,
              child: InkWell(
                onTap: onPressed,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("اكمل اللعب",
                      style: Theme.of(context).textTheme.button,
                      textAlign: TextAlign.center),
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
