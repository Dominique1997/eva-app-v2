import 'package:flutter/material.dart';
import 'package:ncc_app/utilities/base/base_translations.dart';
import 'package:ncc_app/utilities/base/base_actions.dart';
import 'package:ncc_app/utilities/base/base_widgets/base_widget_icon.dart';

class BaseWidgetActionIconButton extends StatelessWidget {
  final String notTranslatedText;
  final BaseActions appAction;
  final IconData iconData;

  const BaseWidgetActionIconButton(
      {super.key,
      required this.notTranslatedText,
      required this.appAction,
      required this.iconData});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: BaseTranslations.findTranslation(notTranslatedText),
        builder: (context, AsyncSnapshot<String?> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            return IconButton(
                onPressed: () => appAction,
                tooltip: snapshot.data,
                icon: BaseWidgetIcon(
                  iconData: iconData,
                ));
          }
        });
  }
}
