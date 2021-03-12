import 'package:zships/auth/model/user.dart';
import 'package:zships/auth/view/update_api_key.dart';
import 'package:zships/component/diffuser.dart';
import 'package:zships/constants/colors.dart';
import 'package:zships/constants/fz_icons.dart';
import 'package:zships/constants/helper_methods.dart';
import 'package:zships/home/component/home_appbar.dart';
import 'package:zships/service/api/api_service.dart';
import 'package:zships/settings/component/setting_card.dart';
import 'package:zships/localization/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zships/settings/controller/setting_controller.dart';
import 'package:zships/ship_engine/service/se_services.dart';

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
    return Scaffold(
      backgroundColor: kTransparent,
      appBar: CustomAppBar(
        context,
        title: 'Settings',
        trailingIcon: false,
        textStyle: TextStyle(fontSize: 30, color: kWhite),
      ),
      body: Diffuser(
        child: SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(20, 0, 20, 100),
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
              SettingCard(
                title: getText(context, 'Sample rate'),
                icon: FzIcons.privacy_policy,
                onTap: () => ApiService.instance.rateByShipmentId(),
              ),
              SettingCard(
                title: getText(context, 'Getting Shipments'),
                icon: FzIcons.privacy_policy,
                onTap: () => ApiService.instance.fetchAllShipment(),
              ),
              SettingCard(
                title: getText(context, 'Estimate Rate'),
                icon: FzIcons.privacy_policy,
                onTap: () => ApiService.instance.estimateRate(),
              ),
              SettingCard(
                title: getText(context, 'Track by label'),
                icon: FzIcons.privacy_policy,
                onTap: () => ShipEngineServices.instance.trackByLabelId('se-47032648'),
              ),
              SettingCard(
                title: getText(context, 'Shipment Label'),
                icon: FzIcons.privacy_policy,
                onTap: () => ShipEngineServices.instance.getLabelByShipmentId(shipmentId: 'se-88294276').then((value) => print(value.first.labelId)),
              ),
              // SettingCard(
              //   title: getText(context, 'helloF'),
              //   icon: FzIcons.privacy_policy,
              //   onTap: () => ApiService.instance.buyShipment(),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
