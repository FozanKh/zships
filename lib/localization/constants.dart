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

String searchable(BuildContext context, String text, {bool removeSpaces = false}) {
  if (isArabic(context)) {
    String temp = '';
    text.characters.forEach((letter) {
      temp += arLetters.contains(letter) || enLetters.contains(letter)
          ? letter
          : removeSpaces
              ? ''
              : ' ';
    });
    text = temp;
  } else {
    text = removeSpaces ? text.replaceAll(' ', '') : text;
  }
  return text.toLowerCase();
}

bool isArabic(BuildContext context) {
  return AppLocalization.of(context).locale.languageCode == 'ar' ? true : false;
}

List<String> enLetters = [
  "A",
  "B",
  "C",
  "D",
  "E",
  "F",
  "G",
  "H",
  "I",
  "J",
  "K",
  "L",
  "M",
  "N",
  "O",
  "P",
  "Q",
  "R",
  "S",
  "T",
  "U",
  "V",
  "W",
  "X",
  "Y",
  "Z",
  "a",
  "b",
  "c",
  "d",
  "e",
  "f",
  "g",
  "h",
  "i",
  "j",
  "k",
  "l",
  "m",
  "n",
  "o",
  "p",
  "q",
  "r",
  "s",
  "t",
  "u",
  "v",
  "w",
  "x",
  "y",
  "z",
  "0",
  "1",
  "2",
  "3",
  "4",
  "5",
  "6",
  "7",
  "8",
  "9"
];
List<String> arLetters = [
  'ض',
  'ص',
  'ث',
  'ق',
  'ف',
  'غ',
  'ع',
  'ه',
  'خ',
  'ح',
  'ج',
  'ش',
  'س',
  'ي',
  'ب',
  'ل',
  'ا',
  'ت',
  'ن',
  'م',
  'ك',
  'ظ',
  'ط',
  'ذ',
  'د',
  'ز',
  'ر',
  'و',
  'َ',
  'ً',
  'ِ',
  'ٍ',
  'ُ',
  'ٌ',
  'ْ',
  'ّ',
  'ى',
  'آ',
  'ئ',
  'ء',
  'أ',
  'إ',
  'ؤ',
  '٠',
  '١',
  '٢',
  '٣',
  '٤',
  '٥',
  '٦',
  '٧',
  '٨',
  '٩'
];
