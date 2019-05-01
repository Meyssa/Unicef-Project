import 'package:flutter/material.dart';
import 'package:unicef/components/dialog.dart';
import 'package:unicef/model/story.dart';
import 'package:unicef/model/stories.dart';
import 'package:unicef/screens/quizView.dart';
import 'package:unicef/model/page.dart';

class Scenario extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
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

  Widget _pageScenario(Page page) {
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
              InkWell(
                onTap: () {
                  controller.jumpToPage(controller.page.floor() - 1);
                },
                child: Icon(
                  Icons.arrow_left,
                  size: 48.0,
                ),
              ),
              InkWell(
                onTap: () {
                  controller.jumpToPage(controller.page.floor() + 1);
                },
                child: Icon(
                  Icons.arrow_right,
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
        _pages.add(_pageScenario(_story.pages[j]));
        j++;
      }
      _pages.add(QuizView(
          _story.questionId, _story.pages[j - 1].background, controller));
      j = 0;
      i++;
    }

    return PageView(controller: controller, children: _pages);

/*    return Material(
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
              margin: EdgeInsets.only(left: 32.0),
              child: dialog(_story.dialog, context),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Icon(
                  Icons.arrow_left,
                  size: 48.0,
                ),
                Icon(
                  Icons.arrow_right,
                  size: 48.0,
                )
              ],
            )
          ],
        ),
      ),
    );*/
  }
}
