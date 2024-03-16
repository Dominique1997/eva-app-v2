import 'package:flutter/material.dart';
import 'package:ncc_app/utilities/base/base_translations.dart';

class BaseWidgetTextField extends StatelessWidget {
  final String shownHintText;
  final bool enabled;
  final bool obscureText;
  final ValueChanged<String> changedValueAction;
  final TextInputType typeOfInput;
  final String defaultText;
  const BaseWidgetTextField({
    super.key,
    required this.shownHintText,
    required this.enabled,
    required this.obscureText,
    required this.changedValueAction,
    required this.typeOfInput,
    required this.defaultText,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: BaseTranslations.findTranslation(shownHintText),
        builder: (context, AsyncSnapshot<String?> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            return TextField(
              controller: TextEditingController(text: defaultText),
              decoration: InputDecoration(
                enabled: enabled,
                border: const OutlineInputBorder(),
                hintText: snapshot.data,
              ),
              onChanged: changedValueAction,
              obscureText: obscureText,
              keyboardType: typeOfInput,
            );
          }
        });
  }
}
