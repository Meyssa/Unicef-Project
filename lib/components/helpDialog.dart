import 'package:flutter/material.dart';

Widget help(context) {
  return AlertDialog(
    content: Container(
      width: MediaQuery.of(context).size.width / 3,
      child: Text(
        "إقرأ القصة بتمعن وحاول الإجابة على الأسئلة التي تظهر في الشاشة",
        textDirection: TextDirection.rtl,
      ),
    ),
  );
}
