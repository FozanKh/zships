import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zships/constants/colors.dart';
import 'package:zships/globals.dart';
import 'package:zships/home/component/home_fab.dart';
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
  Widget _settingsPage;

  int _currentIndex;

  @override
  void initState() {
    super.initState();
    _homePage = HomeView();
    // _cartPage = HomeView();
    // _testScreen = HomeView();
    // _myOrdersPage = HomeView();
    _settingsPage = SettingView();
    // _pages = [_homePage, _homePage, _homePage, _morePage];
    _pages = [_homePage, _homePage, _settingsPage];

    _currentIndex = 0;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {},
      child: Scaffold(
        floatingActionButton: HomeFAB(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
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
            BottomNavigationBarItem(icon: Icon(Icons.calculate, color: kTransparent), label: getText(context, 'Rate Calculator')),
            BottomNavigationBarItem(icon: Icon(Icons.more_horiz), label: getText(context, 'More')),
          ],
          onTap: (index) => setState(() {
            if (index != 1) return _currentIndex = index;
          }),
        ),
        body: IndexedStack(index: _currentIndex, children: _pages),
      ),
    );
  }
}
