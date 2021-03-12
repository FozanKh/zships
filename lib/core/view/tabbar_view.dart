import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zships/auth/model/user.dart';
import 'package:zships/constants/colors.dart';
import 'package:zships/home/component/home_fab.dart';
import 'package:zships/home/view/home_view.dart';
import 'package:zships/localization/constants.dart';
import 'package:zships/service/api/api_service.dart';
import 'package:zships/service/database.dart';
import 'package:zships/settings/view/setting_view.dart';
import 'package:zships/ship/view/ship_view.dart';
import 'package:zships/track/view/track_view.dart';

class TabBarScreen extends StatefulWidget {
  static const String route = 'TabBarScreen';
  static GlobalKey navBarKey = new GlobalKey(debugLabel: 'btm_app_bar');

  static switchTab(int page) {
    (navBarKey.currentWidget as BottomNavigationBar).onTap(page);
  }

  @override
  _TabBarScreenState createState() => _TabBarScreenState();
}

class _TabBarScreenState extends State<TabBarScreen> {
  GlobalKey navBarKey = new GlobalKey(debugLabel: 'btm_app_bar');
  List<Widget> _pages;
  Widget _homePage;
  Widget _settingsPage;
  Widget _trackingPage;
  Widget _shipPage;

  int _currentIndex;

  @override
  void initState() {
    _homePage = HomeView();
    _settingsPage = SettingView();
    _trackingPage = TrackView();
    _shipPage = ShipView();
    _pages = [_homePage, _shipPage, Container(), _trackingPage, _settingsPage];
    _currentIndex = 0;
    getKey();
    super.initState();
  }

  getKey() async {
    String key = await DatabaseService.instance.getUserKey(newUid: Provider.of<User>(context, listen: false).uid);
    ApiService.instance.key = key;
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
            BottomNavigationBarItem(icon: Icon(Icons.home), label: getText(context, 'Home')),
            BottomNavigationBarItem(icon: Icon(Icons.local_shipping), label: getText(context, 'ship')),
            BottomNavigationBarItem(icon: Icon(Icons.calculate, color: kTransparent), label: getText(context, 'Calculator')),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: getText(context, 'track')),
            BottomNavigationBarItem(icon: Icon(Icons.more_horiz), label: getText(context, 'More')),
          ],
          onTap: (index) => setState(() {
            if (index != 2) return _currentIndex = index;
          }),
        ),
        body: IndexedStack(index: _currentIndex, children: _pages),
      ),
    );
  }
}
