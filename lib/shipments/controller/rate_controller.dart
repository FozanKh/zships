import 'package:flutter/cupertino.dart';
import 'package:zships/core/model/rate.dart';
import 'package:zships/core/model/shipment.dart';
import 'package:zships/service/api/api_service.dart';

class RateController {
  TextEditingController fromZipController;
  TextEditingController toZipController;
  TextEditingController toWeightController;
  Shipment shipment;
  List<Rate> rates;

  RateController() {
    fromZipController = TextEditingController();
    toZipController = TextEditingController();
  }

  calculateRate() async {
    shipment = await ApiService.instance.sampleRate(fromZipController.text, toZipController.text);
    print(shipment);
  }

  List<Widget> getRates() {
    List<Widget> ratesWidget = [];
    TextStyle textStyle = TextStyle(fontSize: 16, fontWeight: FontWeight.w600);
    shipment.rates.forEach((rate) {
      var row = Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('${rate.carrier}', style: textStyle),
          rate.estDeliveryDays != null ? Text('${rate.estDeliveryDays} days', style: textStyle) : SizedBox(),
          Text('${rate.rate} ${rate.currency}', style: textStyle),
        ],
      );
      ratesWidget.add(row);
    });
    return ratesWidget;
  }
}
