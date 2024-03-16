import 'dart:convert';
import 'package:ncc_app/utilities/base/base_values.dart';
import 'package:flutter/services.dart' show rootBundle;

class BaseTranslations {
  static Future<String> findTranslation(text) async {
    BaseValues appvalue = BaseValues();
    String language = await appvalue.getDefaultLanguage();
    if (language == "English") {
      return text;
    }

    String translationsContent =
        await rootBundle.loadString("translations/$language.json");
    var jsonData = json.decode(translationsContent);
    if (jsonData[text] != null) {
      return jsonData[text];
    }
    return Future(() => "$text-not-translated");
  }
}
