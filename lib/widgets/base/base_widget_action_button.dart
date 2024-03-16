import 'package:flutter/material.dart';
import 'package:ncc_app/utilities/base/base_translations.dart';
import 'package:ncc_app/utilities/base/base_widgets/base_widget_icon.dart';
import 'package:ncc_app/utilities/base/base_actions.dart';

class BaseWidgetActionButton extends StatelessWidget {
  final IconData iconData;
  final String nonTranslatedText;
  final BaseActions appAction;
  const BaseWidgetActionButton(
      {super.key,
      required this.iconData,
      required this.nonTranslatedText,
      required this.appAction});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: BaseTranslations.findTranslation(nonTranslatedText),
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
