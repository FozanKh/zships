import 'package:flutter/material.dart';
import 'package:zships/component/diffuser.dart';
import 'package:zships/component/rounded_button.dart';
import 'package:zships/component/rounded_text_field.dart';
import 'package:zships/constants/colors.dart';
import 'package:zships/core/model/shipment.dart';
import 'package:zships/globals.dart';
import 'package:zships/home/component/home_appbar.dart';
import 'package:zships/shipments/component/shipment_card.dart';
import 'package:zships/home/controller/home_controller.dart';
import 'package:zships/localization/constants.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  Shipment shipment;
  HomeController controller;
  @override
  void initState() {
    controller = HomeController(context, this);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      controller.loadShipments().then((x) => setState(() {}));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeAppBar(),
      body: allShipments.length <= 0
          ? Padding(
              padding: EdgeInsets.all(40.0),
              child: !controller.shipmentsLoaded
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(getText(context, 'No Shipments Loaded'), textAlign: TextAlign.center, style: TextStyle(fontSize: 24, color: kDark4)),
                        SizedBox(height: 50),
                        RoundedButton(title: 'Load Shipments', buttonColor: kButtonColor, onTap: () => controller.loadShipments()),
                      ],
                    )
                  : Text(getText(context, 'No Shipments on Your Account'),
                      textAlign: TextAlign.center, style: TextStyle(fontSize: 24, color: kDark4)),
            )
          : Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: RoundedTextField(
                    hint: getText(context, 'Track Number or ID'),
                    margin: EdgeInsets.only(top: 10),
                    trailingIcon: Icons.search,
                    onChanged: controller.search,
                  ),
                ),
                if (controller.filteredShipments.length > 0)
                  Expanded(
                    child: Diffuser(
                      child: SingleChildScrollView(
                        padding: EdgeInsets.fromLTRB(15, 0, 15, 100),
                        child: Column(
                          children: List.generate(
                              10, (index) => ShipmentCard(shipment: controller.filteredShipments[index % controller.filteredShipments.length])),
                        ),
                      ),
                    ),
                  ),
              ],
            ),
    );
  }
}
