import 'package:flutter/material.dart';
import 'package:unicef/model/quizzes.dart';
import 'package:unicef/model/quiz.dart';

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
          padding: const EdgeInsets.only(top: 8.0),
          child: Text(
            "${id + 1} السؤال ",
            style: Theme.of(context).textTheme.title,
            textDirection: TextDirection.rtl,
          ),
        ),
        Text(
          question.question,
          style: Theme.of(context).textTheme.headline,
        ),
        timer
      ],
    ),
  );
}
