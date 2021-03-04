import 'package:flutter/material.dart';
import 'package:zships/component/rounded_button.dart';
import 'package:zships/component/rounded_text_field.dart';
import 'package:zships/component/titled.dart';
import 'package:zships/localization/constants.dart';
import 'package:zships/shipments/controller/rate_controller.dart';

// ignore: must_be_immutable
class RateCalculatorView extends StatelessWidget {
  RateController controller;

  RateCalculatorView() {
    controller = RateController();
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
                  title: getText(context, 'From Zip code'),
                  child: RoundedTextField(
                    hint: getText(context, 'xxxxxx'),
                    textController: controller.fromZipController,
                    keyboardType: TextInputType.number,
                  ),
                ),
              ),
              SizedBox(width: 20),
              Expanded(
                child: Titled(
                  title: getText(context, 'To Zip code'),
                  child: RoundedTextField(
                    hint: getText(context, 'xxxxxx'),
                    textController: controller.toZipController,
                    keyboardType: TextInputType.number,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          Titled(
            title: 'Weight',
            child: RoundedTextField(
              hint: getText(context, 'xxxxxx'),
              textController: controller.toZipController,
              keyboardType: TextInputType.number,
            ),
          ),
          SizedBox(height: 10),
          RoundedButton(title: 'Calculate', onTap: controller.calculateRate),
          if (controller.shipment != null)
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Titled(
                title: 'Rates',
                largeTitle: true,
                child: Column(
                  children: controller.getRates(),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
