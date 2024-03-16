import 'package:flutter/material.dart';

class BaseWidgetSizedBox extends StatelessWidget {
  final double sizedBoxWidth;
  final Widget childElement;
  const BaseWidgetSizedBox(
      {super.key, required this.sizedBoxWidth, required this.childElement});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: sizedBoxWidth,
      child: childElement,
    );
  }
}
