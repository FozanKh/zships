import 'package:flutter/material.dart';
import 'package:zships/component/rounded_text_field.dart';
import 'package:zships/component/titled.dart';
import 'package:zships/constants/colors.dart';
import 'package:zships/home/component/home_appbar.dart';

class ShipView extends StatefulWidget {
  @override
  _ShipViewState createState() => _ShipViewState();
}

class _ShipViewState extends State<ShipView> {
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
            Titled(
              title: 'Name',
              child: RoundedTextField(
                fillColor: kLight2,
                hint: 'Shipper name',
              ),
            ),
            Titled(
              title: 'Postal Code',
              child: RoundedTextField(
                fillColor: kLight2,
                hint: 'Shipper Postal Code',
              ),
            ),
            Titled(
              title: 'Name',
              child: RoundedTextField(
                fillColor: kLight2,
                hint: 'Shipper name',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
