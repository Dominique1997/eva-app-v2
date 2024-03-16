import 'package:flutter/material.dart';

class BaseWidgetMainTitle extends StatelessWidget {
  final String mainTitle;
  final double sizeOfText;
  const BaseWidgetMainTitle(
      {super.key, required this.mainTitle, required this.sizeOfText});

  @override
  Widget build(BuildContext context) {
    return Text(mainTitle, style: TextStyle(fontSize: sizeOfText));
  }
}
