import 'package:flutter/material.dart';

extension Iterables<E> on Iterable<E> {
  Map<K, List<E>> groupBy<K>(K Function(E) keyFunction) =>
      fold(<K, List<E>>{}, (Map<K, List<E>> map, E element) => map..putIfAbsent(keyFunction(element), () => <E>[]).add(element));
}

extension TimeExtension on TimeOfDay {
  bool operator >(TimeOfDay o) => (this.hour * 60 + this.minute) > (o.minute * 60 + o.minute);
  bool operator <(TimeOfDay o) => (this.hour * 60 + this.minute) > (o.minute * 60 + o.minute);
  bool operator >=(TimeOfDay o) => (this.hour * 60 + this.minute) > (o.minute * 60 + o.minute);
  bool operator <=(TimeOfDay o) => (this.hour * 60 + this.minute) > (o.minute * 60 + o.minute);
  TimeOfDay operator +(TimeOfDay o) =>
      this.replacing(hour: ((((this.hour + o.hour) * 60 + this.minute + o.minute) % 1440) / 60).floor(), minute: (this.minute + o.minute) % 60);

  TimeOfDay add({int hours = 0, int minutes = 0}) {
    return this.replacing(hour: ((((this.hour + hours) * 60 + this.minute + minutes) % 1440) / 60).floor(), minute: (this.minute + minutes) % 60);
  }

  int getMinutes() => this == null ? null : (this.hour) * 60 + this.minute;
}

extension HexColor on Color {
  static Color fromHex(String hexString) {
    if (hexString == null) return null;
    hexString = hexString.replaceAll("#", "");
    if (hexString.length == 6) {
      hexString = "FF" + hexString;
    }
    if (hexString.length == 8) {
      return Color(int.parse("0x$hexString"));
    } else
      return Colors.amber;
  }

  String toHex() => '#${this.value.toRadixString(16).substring(2)}';

  Color edit(int value) {
    if (this == null) return null;
    int r = this.red + value;
    int g = this.green + value;
    int b = this.blue + value;
    r = r > 255
        ? 255
        : r < 0
            ? 0
            : r;
    g = g > 255
        ? 255
        : g < 0
            ? 0
            : g;
    b = b > 255
        ? 255
        : b < 0
            ? 0
            : b;

    return Color.fromRGBO(r, g, b, 1);
  }
}

extension StringFormatter on String {
  get titleCase {
    return this
        .replaceAllMapped(RegExp(r'[A-Z]{2,}(?=[A-Z][a-z]+[0-9]*|\b)|[A-Z]?[a-z]+[0-9]*|[A-Z]|[0-9]+'),
            (Match m) => "${m[0][0].toUpperCase()}${m[0].substring(1).toLowerCase()}")
        .replaceAll(RegExp(r'(_|-)+'), ' ');
  }
}
