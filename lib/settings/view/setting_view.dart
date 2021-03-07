import 'package:zships/auth/model/user.dart';
import 'package:zships/auth/view/update_api_key.dart';
import 'package:zships/component/action_button.dart';
import 'package:zships/constants/colors.dart';
import 'package:zships/constants/decorations.dart';
import 'package:zships/constants/fz_icons.dart';
import 'package:zships/constants/helper_methods.dart';
import 'package:zships/main.dart';
import 'package:zships/service/api/api_service.dart';
import 'package:zships/service/shared_preferences.dart';
import 'package:zships/settings/component/setting_card.dart';
import 'package:zships/localization/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zships/settings/controller/setting_controller.dart';

class SettingView extends StatefulWidget {
  static const String route = 'SettingView';

  @override
  _SettingViewState createState() => _SettingViewState();
}

class _SettingViewState extends State<SettingView> {
  SettingController controller;

  @override
  void initState() {
    controller = SettingController(context: context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    controller.user = Provider.of<User>(context);
    return Padding(
      padding: EdgeInsets.only(top: 20),
      child: Scaffold(
        backgroundColor: kTransparent,
        appBar: AppBar(
          centerTitle: false,
          automaticallyImplyLeading: false,
          backgroundColor: kTransparent,
          elevation: 0,
          title: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Text(getText(context, 'settings'), style: kTitle.copyWith(color: kFontsColor)),
          ),
          actions: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Center(
                child: ActionButton(
                  title: MyApp.currentLocale.languageCode == 'ar' ? 'English' : 'العربية',
                  onTap: () => AppSharedPreferences.instance.switchLocale(context),
                ),
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(20, 30, 20, 100),
          physics: BouncingScrollPhysics(),
          child: Column(
            children: <Widget>[
              if (controller.userExists)
                SettingCard(
                  title: getText(context, 'Update Profile'),
                  icon: Icons.person,
                  navigate: false,
                  color: kLight2,
                  onTap: () => navigateTo(context, UpdateApiKey.route),
                ),
              if (controller.userExists)
                SettingCard(
                  title: getText(context, 'logout'),
                  icon: FzIcons.logout,
                  navigate: false,
                  color: kLight2,
                  titleColor: kRed0,
                  onTap: () => controller.logout(),
                ),
              // SettingCard(
              //   title: getText(context, 'testApi'),
              //   icon: FzIcons.privacy_policy,
              //   onTap: () => ApiService.instance.createSampleShipment(Provider.of<User>(context, listen: false).apiKey),
              // ),
              // SettingCard(
              //   title: getText(context, 'gettingShipments'),
              //   icon: FzIcons.privacy_policy,
              //   onTap: () => ApiService.instance.retrieveAllShipment(Provider.of<User>(context, listen: false).apiKey),
              // ),
              // SettingCard(
              //   title: getText(context, 'gettingShipment'),
              //   icon: FzIcons.privacy_policy,
              //   onTap: () => ApiService.instance.retrieveShipment(Provider.of<User>(context, listen: false).apiKey),
              // ),
              // SettingCard(
              //   title: getText(context, 'helloF'),
              //   icon: FzIcons.privacy_policy,
              //   onTap: () => ApiService.instance.buyShipment(Provider.of<User>(context, listen: false).apiKey),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
