import 'package:flutter/material.dart';
import 'package:zships/component/diffuser.dart';
import 'package:zships/component/rounded_button.dart';
import 'package:zships/component/rounded_text_field.dart';
import 'package:zships/constants/colors.dart';
import 'package:zships/constants/decorations.dart';
import 'package:zships/home/component/home_appbar.dart';
import 'package:zships/ship_engine/models/se_shipment.dart';
import 'package:zships/shipments/component/shipment_card.dart';
import 'package:zships/home/controller/home_controller.dart';
import 'package:zships/localization/constants.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  ShipmentSE shipment;
  HomeController controller;
  @override
  void initState() {
    controller = HomeController(context);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      controller.loadShipments().then((x) => setState(() {}));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(context),
      body: controller.allShipments.length <= 0
          ? Padding(
              padding: EdgeInsets.all(40.0),
              child: !controller.shipmentsLoaded
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(getText(context, 'No Shipments Loaded'), textAlign: TextAlign.center, style: TextStyle(fontSize: 24, color: kDark4)),
                        SizedBox(height: 50),
                        RoundedButton(title: 'Load Shipments', buttonColor: kButtonColor, onTap: () => controller.loadShipments(force: true)),
                        kProgressIndicator,
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
                    hint: getText(context, 'Names or Track number'),
                    margin: EdgeInsets.only(top: 10),
                    trailingIcon: Icons.search,
                    onChanged: (value) => controller.search(value).then((_) => setState(() {})),
                  ),
                ),
                if (controller.filteredShipments.length > 0)
                  Expanded(
                    child: Diffuser(
                      child: RefreshIndicator(
                        onRefresh: () => controller.loadShipments().then((_) => setState(() {})),
                        child: ListView.builder(
                          padding: EdgeInsets.fromLTRB(15, 0, 15, 100),
                          itemCount: controller.filteredShipments.length,
                          itemBuilder: (context, index) => ShipmentCard(shipment: controller.filteredShipments[index]),
                        ),
                      ),
                    ),
                  ),
              ],
            ),
    );
  }
}
