import 'package:flutter/material.dart';
import 'package:unicef/components/question.dart';
import 'package:unicef/components/answer.dart';
import 'package:unicef/components/timerPainer.dart';
import 'package:unicef/quiz.dart';
import 'package:unicef/quizzes.dart';

class QuizView extends StatefulWidget {
  final int quizzId;
  final String background;
  QuizView(this.quizzId, this.background);
  @override
  State<StatefulWidget> createState() {
    return QuizViewState();
  }
}

class QuizViewState extends State<QuizView> with TickerProviderStateMixin {
  Color _color = Colors.white;
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
    _quiz = quizzes[widget.quizzId];
  }

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
      _quiz.correctIndex == index
          ? _answerColor = Colors.green
          : _answerColor = Colors.red;

      return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(18.0)),
            border: Border.all(
              width: 2.0,
              color: _answered == true ? _answerColor : _color,
            )),
        child: Material(
          borderRadius: BorderRadius.all(Radius.circular(18.0)),
          color: Colors.white,
          borderOnForeground: true,
          child: InkWell(
            child: answer(context, index, text),
            onTap: () {
              setState(() {
                _answered = true;
                _controller.stop();
              });
            },
          ),
        ),
      );
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
        Container(
          margin: EdgeInsets.symmetric(horizontal: 36.0, vertical: 12.0),
          child: Column(
            children: <Widget>[
              Expanded(
                flex: 1,
                child: question(context, widget.quizzId, _timer),
              ),
              SizedBox(
                height: 12.0,
              ),
              Expanded(
                flex: 1,
                child: Row(
                    children: _quiz.answers.map((text) {
                  _index = _index + 1;
                  double _rightMargin = 18;
                  if (_index == 2) {
                    _rightMargin = 0;
                  }
                  return Container(
                    margin: EdgeInsets.only(right: _rightMargin),
                    child: _answerButton(text, _index),
                  );
                }).toList()),
              )
            ],
          ),
        ),
      ],
    );
  }
}
