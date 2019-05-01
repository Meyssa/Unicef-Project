import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';

menuButton(text, color, context, action) {
  return Container(
    width: (MediaQuery.of(context).size.width - 200) / 2,
    child: Material(
      borderRadius: BorderRadius.circular(32.0),
      color: color,
      child: InkWell(
        onTap: action,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: AutoSizeText(text,
              maxLines: 1,
              style: Theme.of(context).textTheme.button,
              textAlign: TextAlign.center),
        ),
      ),
    ),
  );
}
