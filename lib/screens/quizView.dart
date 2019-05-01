import 'package:flutter/material.dart';
import 'package:unicef/components/question.dart';
import 'package:unicef/components/answer.dart';
import 'package:unicef/components/timerPainer.dart';
import 'package:unicef/model/quiz.dart';
import 'package:unicef/model/quizzes.dart';
import 'package:auto_size_text/auto_size_text.dart';

class QuizView extends StatefulWidget {
  final int quizId;
  final String background;
  final pageViewController;
  QuizView(this.quizId, this.background, this.pageViewController);
  @override
  State<StatefulWidget> createState() {
    return QuizViewState();
  }
}

class QuizViewState extends State<QuizView>
    with TickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  var myGroup = AutoSizeGroup();
  Color _defaultColor = Colors.transparent;
  bool _answered = false;
  AnimationController _controller;
  Quiz _quiz;

  QuizView get widget => super.widget;

  String get timeRemaining {
    Duration duration = _controller.duration * _controller.value;
    return '${duration.inMinutes} ${(duration.inSeconds % 60).toString().padLeft(2, '0')}';
  }

  @override
  void initState() {
    super.initState();
    _controller = new AnimationController(
        vsync: this, duration: const Duration(seconds: 45))
      ..reverse();
    _controller.reverse(
        from: _controller.value == 0.0 ? 1.0 : _controller.value);
    _quiz = quizzes[widget.quizId];
  }

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    int _index = -1;
    //Timer Widget
    Widget _timer = Padding(
        padding: const EdgeInsets.all(10.0),
        child: new Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
          AnimatedBuilder(
              animation: _controller,
              builder: (BuildContext context, Widget child) {
                return new Text(
                  timeRemaining,
                  style: Theme.of(context)
                      .textTheme
                      .body1
                      .copyWith(color: Theme.of(context).primaryColor),
                );
              }),
          Center(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 75.0, vertical: 10.0),
              child: AspectRatio(
                aspectRatio: (MediaQuery.of(context).size.width / 4) / 1.0,
                child: AnimatedBuilder(
                    animation: _controller,
                    builder: (BuildContext context, Widget child) {
                      return new CustomPaint(
                        painter: new ProgressPainter(
                          animation: _controller,
                          color: Theme.of(context).primaryColor,
                          backgroundColor: Colors.white,
                        ),
                      );
                    }),
              ),
            ),
          ),
        ]));

    //Answer Widget
    Widget _answerButton(text, index) {
      Color _answerColor;
      bool correct = _quiz.correctIndex == index;
      correct ? _answerColor = Colors.green : _answerColor = Colors.red;
      var color = _answered == true ? _answerColor : _defaultColor;
      Icon icon;
      if (_answered && correct)
        icon = new Icon(
          Icons.thumb_up,
          color: color,
        );
      else
        icon = new Icon(
          Icons.thumb_down,
          color: color,
        );
      return Stack(
          alignment: AlignmentDirectional.bottomStart,
          children: <Widget>[
            Material(
              borderRadius: BorderRadius.all(Radius.circular(18.0)),
              //color: Colors.white,
              //borderOnForeground: true,
              child: InkWell(
                child: answer(context, index, text, myGroup, color),
                onTap: () {
                  setState(() {
                    _answered = true;
                    _controller.stop();
                  });
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: icon,
            )
          ]);
    }

    //QuizView Widget
    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        Image.asset(
          widget.background,
          centerSlice: Rect.largest,
          color: Colors.black54,
          colorBlendMode: BlendMode.darken,
        ),
        Material(
          color: Colors.transparent,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              InkWell(
                onTap: () {
                  widget.pageViewController
                      .jumpToPage(widget.pageViewController.page.floor() - 1);
                },
                child: Icon(
                  Icons.arrow_left,
                  color: Colors.white,
                  size: 48.0,
                ),
              ),
              InkWell(
                onTap: () {
                  widget.pageViewController
                      .jumpToPage(widget.pageViewController.page.floor() + 1);
                },
                child: Icon(
                  Icons.arrow_right,
                  color: Colors.white,
                  size: 48.0,
                ),
              )
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 36.0, vertical: 12.0),
          child: Column(
            children: <Widget>[
              Expanded(
                flex: 1,
                child: question(context, widget.quizId, _timer),
              ),
              SizedBox(
                height: 12.0,
              ),
              Expanded(
                flex: 1,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: _quiz.answers.map((text) {
                      _index = _index + 1;
                      return Container(
                        child: _answerButton(text, _index),
                      );
                    }).toList()),
              )
            ],
          ),
        ),

        /*_answered
            ? Material(
                color: Colors.transparent,
                child: InkWell(onTap: () {
                  if (widget.quizId + 2 <= quizzes.length) {
                    print(widget.quizId);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Scenario(
                                quizzes[widget.quizId].nextStoryIndex)));
                  } else {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => MainMenu()));
                  }
                }),
              )
            : Container(height: 0)*/
      ],
    );
  }
}
