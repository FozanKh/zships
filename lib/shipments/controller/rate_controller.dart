import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:zships/auth/model/user.dart';
import 'package:zships/core/model/rate.dart';
import 'package:zships/core/model/shipment.dart';
import 'package:zships/service/api/api_service.dart';

class RateController {
  BuildContext context;
  TextEditingController fromZipController;
  TextEditingController toZipController;
  TextEditingController toWeightController;
  Shipment shipment;
  List<Rate> rates;

  RateController(this.context) {
    fromZipController = TextEditingController();
    toZipController = TextEditingController();
  }

  calculateRate() async {
    String key = Provider.of<User>(context, listen: false).apiKey;
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
