import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:zships/component/progress_indicator.dart';
import 'package:zships/component/rounded_button.dart';
import 'package:zships/constants/colors.dart';
import 'package:zships/constants/decorations.dart';
import 'package:zships/core/model/shipment.dart';
import 'package:zships/globals.dart';
import 'package:zships/home/component/home_appbar.dart';
import 'package:zships/home/component/shipment_card.dart';
import 'package:zships/home/controller/home_controller.dart';
import 'package:zships/home/model/testing_model.dart';
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
    controller = HomeController(context);
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
          : SingleChildScrollView(
              padding: EdgeInsets.all(15),
              child: Column(
                children: List.generate(allShipments.length, (index) => ShipmentCard(shipment: allShipments[index])),
              ),
            ),
    );
  }
}
