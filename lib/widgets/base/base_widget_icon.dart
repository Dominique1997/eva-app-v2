import 'package:flutter/material.dart';

class BaseWidgetIcon extends StatelessWidget {
  final IconData iconData;
  const BaseWidgetIcon({super.key, required this.iconData});

  @override
  Widget build(BuildContext context) {
    return Icon(iconData);
  }
}
