import 'package:flutter/material.dart';
import 'package:unicef/quizzes.dart';
import 'package:unicef/quiz.dart';

question(context, id, timer) {
  Quiz question = quizzes[id];
  return Container(
    decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(width: 0.10, color: Colors.black54),
        borderRadius: BorderRadius.all(Radius.circular(22.0))),
    child: Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "el sou2al el ${id + 1}",
            style: Theme.of(context).textTheme.title,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            question.question,
            style: Theme.of(context).textTheme.headline,
          ),
        ),
        timer
      ],
    ),
  );
}
