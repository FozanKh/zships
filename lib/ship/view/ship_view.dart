import 'package:flutter/material.dart';
import 'package:zships/component/rounded_button.dart';
import 'package:zships/component/rounded_text_field.dart';
import 'package:zships/component/titled.dart';
import 'package:zships/constants/colors.dart';
import 'package:zships/home/component/home_appbar.dart';
import 'package:zships/ship/controller/ship_controller.dart';

class ShipView extends StatefulWidget {
  @override
  _ShipViewState createState() => _ShipViewState();
}

class _ShipViewState extends State<ShipView> {
  ShipController controller;
  @override
  void initState() {
    controller = ShipController(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kTransparent,
      appBar: CustomAppBar(
        context,
        title: 'New Shipment',
        trailingIcon: false,
        textStyle: TextStyle(fontSize: 30, color: kWhite),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(20, 0, 20, 100),
        child: Column(
          children: [
            Titled(
              title: 'From Address',
              largeTitle: true,
            ),
            SizedBox(height: 10),
            Titled(
              title: 'Name',
              child: RoundedTextField(
                fillColor: kLight2,
                hint: 'Shipper Name',
                textController: controller.fromName,
              ),
            ),
            SizedBox(height: 10),
            Titled(
              title: 'Phone',
              child: RoundedTextField(
                fillColor: kLight2,
                hint: 'Shipper Phone',
                keyboardType: TextInputType.phone,
                textController: controller.fromPhone,
              ),
            ),
            SizedBox(height: 10),
            Titled(
              title: 'State',
              child: RoundedTextField(
                fillColor: kLight2,
                hint: 'Shipper State Code (e.g. NY)',
                keyboardType: TextInputType.number,
                textController: controller.fromStateCode,
              ),
            ),
            Titled(
              title: 'Postal Code',
              child: RoundedTextField(
                fillColor: kLight2,
                hint: 'Shipper Postal Code',
                keyboardType: TextInputType.number,
                textController: controller.fromPostalCode,
              ),
            ),
            SizedBox(height: 20),
            Divider(
              color: kFontsColor,
            ),
            Titled(
              title: 'To Address',
              largeTitle: true,
            ),
            SizedBox(height: 10),
            Titled(
              title: 'Name',
              child: RoundedTextField(
                fillColor: kLight2,
                hint: 'Receiver Name',
                textController: controller.toName,
              ),
            ),
            SizedBox(height: 10),
            Titled(
              title: 'Phone',
              child: RoundedTextField(
                fillColor: kLight2,
                hint: 'Receiver Phone',
                keyboardType: TextInputType.phone,
                textController: controller.toPhone,
              ),
            ),
            SizedBox(height: 10),
            Titled(
              title: 'State',
              child: RoundedTextField(
                fillColor: kLight2,
                hint: 'Receiver State Code (e.g. NY)',
                keyboardType: TextInputType.number,
                textController: controller.toStateCode,
              ),
            ),
            Titled(
              title: 'Postal Code',
              child: RoundedTextField(
                fillColor: kLight2,
                hint: 'Receiver Postal Code',
                keyboardType: TextInputType.number,
                textController: controller.toPostalCode,
              ),
            ),
            SizedBox(height: 20),
            Divider(
              color: kFontsColor,
            ),
            Titled(
              title: 'Package',
              largeTitle: true,
            ),
            SizedBox(height: 10),
            Titled(
              title: 'Weight (KG)',
              child: RoundedTextField(
                fillColor: kLight2,
                hint: 'Package Weight',
                keyboardType: TextInputType.number,
                textController: controller.weight,
              ),
            ),
            SizedBox(height: 30),
            RoundedButton(title: 'Ship!', onTap: () => controller.createShipment())
          ],
        ),
      ),
    );
  }
}
