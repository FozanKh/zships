import 'package:flutter/material.dart';
import 'package:zships/constants/validate.dart';
import 'app_localization.dart';

final supportedLanguages = ['en', 'ar'];
final Iterable<Locale> appSupportedLocales = [Locale("en", "US"), Locale("ar", "SA")];
final languagesPath = 'assets/languages';

String getText(BuildContext context, String key, {List<String> arguments}) {
  if (safeListIsNotEmpty(arguments)) {
    String baseText = AppLocalization.of(context).translate(key) ?? key;
    for (var i = 0; i < arguments.length; i++) {
      baseText = baseText.replaceFirst("^[]", AppLocalization.of(context).translate(arguments[i])?.toLowerCase() ?? arguments[i]);
    }
    return baseText;
  } else
    return AppLocalization.of(context).translate(key) ?? key;
}

Alignment customAlignment(context, {bool flip = false, top = false, bottom = false}) {
  if (top) {
    if (flip)
      return isArabic(context) ? Alignment.topLeft : Alignment.topRight;
    else
      return isArabic(context) ? Alignment.topRight : Alignment.topLeft;
  } else if (bottom) {
    if (flip)
      return isArabic(context) ? Alignment.bottomLeft : Alignment.bottomRight;
    else
      return isArabic(context) ? Alignment.bottomRight : Alignment.bottomLeft;
  } else if (flip)
    return isArabic(context) ? Alignment.centerLeft : Alignment.centerRight;
  else
    return isArabic(context) ? Alignment.centerRight : Alignment.centerLeft;
}

bool isArabic(BuildContext context) {
  return AppLocalization.of(context).locale.languageCode == 'ar' ? true : false;
}
