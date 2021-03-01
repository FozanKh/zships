import 'dart:convert';
import 'dart:developer';
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

  isFirstLaunch() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool('firstLaunch') ?? true;
  }

  setFirstLaunch() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.setBool('firstLaunch', false);
  }

  removeFirstLaunch() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.setBool('firstLaunch', false);
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

  Future<String> getHash(String to) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('hash:$to');
  }

  void setHash({String hash, String to}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("hash:$to", hash);
  }

  // Future<ThemeType> getTheme() async {
  //   String themeType = await getString('themeType');
  //   log('loading saved theme: $themeType');
  //   return themeType == 'Dark' ? ThemeType.Dark : ThemeType.Light;
  // }

  // Future<void> setTheme(ThemeType newType) async {
  //   if (await setString('themeType', newType == ThemeType.Dark ? 'Dark' : 'Light')) log('Theme saved to $newType');
  //   return;
  // }

  Future<String> getUserPhoto() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String data = prefs.getString('profile-image');
    // globals.profilePhotoValueNotifier.value = data;
    return data;
  }

  void setUserPhoto(String url) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // globals.profilePhotoValueNotifier.value = url;
    prefs.setString('profile-image', url);
  }

  void clearUserData() {
    remove("user-university");
    remove("gpa-system");
    remove("courses");
    remove("user-id");
    remove("profile-image");
    remove("hash:user-university");
  }
}
