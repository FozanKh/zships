import 'package:flutter/material.dart';
import 'package:zships/component/rounded_button.dart';
import 'package:zships/component/rounded_text_field.dart';
import 'package:zships/component/titled.dart';
import 'package:zships/constants/validate.dart';
import 'package:zships/localization/constants.dart';
import 'package:zships/shipments/controller/rate_controller.dart';

// ignore: must_be_immutable
class RateCalculatorView extends StatefulWidget {
  @override
  _RateCalculatorViewState createState() => _RateCalculatorViewState();
}

class _RateCalculatorViewState extends State<RateCalculatorView> {
  RateController controller;
  @override
  void initState() {
    controller = RateController(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                child: Titled(
                  title: getText(context, 'From Postal code'),
                  child: RoundedTextField(
                    hint: getText(context, 'xxxxxx'),
                    textController: controller.fromPostalController,
                    keyboardType: TextInputType.number,
                  ),
                ),
              ),
              SizedBox(width: 20),
              Expanded(
                child: Titled(
                  title: getText(context, 'To Postal code'),
                  child: RoundedTextField(
                    hint: getText(context, 'xxxxxx'),
                    textController: controller.toPostalController,
                    keyboardType: TextInputType.number,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          Titled(
            title: 'Weight (KG)',
            child: RoundedTextField(
              hint: getText(context, "Shipment's weight in KG"),
              textController: controller.weightController,
              keyboardType: TextInputType.number,
            ),
          ),
          SizedBox(height: 10),
          RoundedButton(
              title: 'Calculate',
              onTap: () async {
                await controller.calculateRate();
                setState(() {});
              }),
          if (safeListIsNotEmpty(controller.rates))
            Padding(
              padding: EdgeInsets.all(15.0),
              child: Column(
                children: controller.getRates(),
              ),
            ),
        ],
      ),
    );
  }
}
