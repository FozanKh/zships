import 'package:flutter/material.dart';
import 'package:zships/main.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:ui' as ui;

class AppSharedPreferences {
  static AppSharedPreferences _instance;
  static AppSharedPreferences get instance {
    if (_instance == null) {
      _instance = AppSharedPreferences();
      return _instance;
    } else
      return _instance;
  }

  Future<bool> save(String key, String value) async {
    final prefs = await SharedPreferences.getInstance();
    return await prefs.setString(key, value);
  }

  Future<dynamic> read(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(key);
  }

  void remove(String key) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove(key);
  }

  void setUid(String uid) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('user-id', uid);
  }

  Future<String> getUid() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('user-id');
  }

  getLocale(context) async {
    String locale = await read('locale');
    if (locale != null && ui.window.locale.languageCode != locale) switchLocale(context);
  }

  setLocale(String locale) async {
    save('locale', locale);
  }

  switchLocale(context) async {
    MyApp.currentLocale = MyApp.currentLocale.languageCode == 'ar' ? Locale('en') : Locale('ar');
    setLocale(MyApp.currentLocale.languageCode);
    MyApp.setLocale(context);
  }

  switchLocaleToArabic(context) async {
    MyApp.currentLocale = Locale('ar');
    setLocale(MyApp.currentLocale.languageCode);
    MyApp.setLocale(context);
  }

  switchLocaleToEnglish(context) async {
    MyApp.currentLocale = Locale('en');
    setLocale(MyApp.currentLocale.languageCode);
    MyApp.setLocale(context);
  }

  Future<bool> saveKey(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.setString('privateKey', key);
  }

  Future<String> getKey() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('privateKey');
  }

  void clearUserData() {
    remove("user-id");
    remove("privateKey");
  }
}
