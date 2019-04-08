import 'package:flutter/material.dart';
import 'package:unicef/components/dialog.dart';
import 'package:unicef/story.dart';
import 'package:unicef/stories.dart';
import 'package:unicef/screens/quizView.dart';

class Scenario extends StatefulWidget {
  final int id;
  Scenario(this.id);
  @override
  State<StatefulWidget> createState() {
    return ScenarioState();
  }
}

class ScenarioState extends State<Scenario> {
  Scenario get widget => super.widget;
  int _currentId;
  Story _story;
  void initState() {
    super.initState();
    _currentId = widget.id;
    _story = stories[_currentId];
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: () {
          setState(() {
            if (!_story.hasNext)
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      QuizView(_story.questionId, _story.background),
                ),
              );
            else {
              print('hi');
              _currentId = _currentId + 1;
              _story = stories[_currentId];
            }
          });
        },
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Image.asset(
              _story.background,
              centerSlice: Rect.largest,
            ),
            Container(
              margin: EdgeInsets.only(left: 42.0),
              child: dialog(_story.dialog),
            )
          ],
        ),
      ),
    );
  }
}
