import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zships/constants/colors.dart';
import 'package:zships/globals.dart';
import 'package:zships/home/view/home_view.dart';
import 'package:zships/localization/constants.dart';
import 'package:zships/settings/view/setting_view.dart';

class TabBarScreen extends StatefulWidget {
  static const String route = 'TabBarScreen';

  @override
  _TabBarScreenState createState() => _TabBarScreenState();
}

class _TabBarScreenState extends State<TabBarScreen> {
  List<Widget> _pages;
  Widget _homePage;
  Widget _morePage;
  Widget _cartPage;
  Widget _myOrdersPage;
  Widget _testScreen;

  int _currentIndex;

  @override
  void initState() {
    super.initState();
    _homePage = HomeView();
    _cartPage = HomeView();
    // _testScreen = HomeView();
    _myOrdersPage = HomeView();
    _morePage = SettingView();
    _pages = [_homePage, _cartPage, _myOrdersPage, _morePage];

    _currentIndex = 0;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {},
      child: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          key: navBarKey,
          type: BottomNavigationBarType.fixed,
          unselectedItemColor: kDark3,
          selectedItemColor: kDark1,
          currentIndex: _currentIndex,
          iconSize: 20,
          items: <BottomNavigationBarItem>[
            // TODO: Translate these
            BottomNavigationBarItem(icon: Icon(Icons.home), label: getText(context, 'Home')),
            BottomNavigationBarItem(icon: Icon(CupertinoIcons.cart), label: getText(context, 'Cart')),
            BottomNavigationBarItem(icon: Icon(Icons.history), label: getText(context, 'Orders')),
            BottomNavigationBarItem(icon: Icon(Icons.more_horiz), label: getText(context, 'More')),
          ],
          onTap: (index) => setState(() => _currentIndex = index),
        ),
        body: IndexedStack(index: _currentIndex, children: _pages),
      ),
    );
  }
}
