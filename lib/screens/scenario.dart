import 'package:flutter/material.dart';
import 'package:unicef/components/dialog.dart';
import 'package:unicef/model/story.dart';
import 'package:unicef/model/stories.dart';
import 'package:unicef/screens/quizView.dart';
import 'package:unicef/model/page.dart';
import 'package:unicef/screens/finalScore.dart';
import 'package:unicef/model/player.dart';
import 'package:unicef/model/globalVar.dart' as globals;

class Scenario extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    if (globals.currentPlayer == null) {
      globals.currentPlayer = new Player(score: 0);
    }
    globals.correctAnswers = 0;
    globals.currentPlayer.score = 0;
    return ScenarioState();
  }
}

class ScenarioState extends State<Scenario> {
  final controller = PageController(initialPage: 0);
  Story _story;
  void initState() {
    super.initState();
    _story = stories[0];
  }

  Widget _pageScenario(Page page, int index) {
    return Material(
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Image.asset(
            page.background,
            centerSlice: Rect.largest,
          ),
          Container(
            margin: EdgeInsets.only(left: 32.0),
            child: dialog(page.dialog, context),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              index != 0
                  ? InkWell(
                      onTap: () {
                        controller.jumpToPage(controller.page.floor() - 1);
                      },
                      child: Icon(
                        Icons.chevron_left,
                        size: 48.0,
                      ),
                    )
                  : Container(),
              InkWell(
                onTap: () {
                  controller.jumpToPage(controller.page.floor() + 1);
                },
                child: Icon(
                  Icons.chevron_right,
                  size: 48.0,
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> _pages = [];
    int i = 0;
    int j = 0;
    while (i < stories.length) {
      _story = stories[i];
      while (j < _story.pages.length) {
        _pages.add(_pageScenario(_story.pages[j], i + j));
        j++;
      }
      _pages.add(QuizView(
          _story.questionId, _story.pages[j - 1].background, controller));
      j = 0;
      i++;
    }
    _pages.add(FinalScore());

    return PageView(controller: controller, children: _pages);
  }
}
