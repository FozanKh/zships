import 'package:flutter/cupertino.dart';
import 'package:zships/component/alertDialog.dart';
import 'package:zships/component/progress_indicator.dart';
import 'package:zships/constants/validate.dart';
import 'package:zships/service/api/api_service.dart';
import 'package:zships/ship_engine/models/rate/se_rate.dart';
import 'package:zships/ship_engine/models/se_shipment.dart';
import 'package:zships/shipments/component/rate_row.dart';
import 'package:zships/shipments/controller/rating_legends.dart';

class RateController {
  BuildContext context;
  TextEditingController fromPostalController;
  TextEditingController toPostalController;
  TextEditingController weightController;
  ShipmentSE shipment;
  List<RateSE> rates;

  RateController(this.context) {
    fromPostalController = TextEditingController();
    toPostalController = TextEditingController();
    weightController = TextEditingController();
  }

  Future<void> calculateRate() async {
    if (!safeIsNotEmpty(fromPostalController.text)) {
      AlertDialogBox.showAlert(context, message: 'Please fill from address Postal code');
    } else if (!safeIsNotEmpty(toPostalController.text)) {
      AlertDialogBox.showAlert(context, message: 'Please fill to address Postal code');
    } else if (!safeIsNotEmpty(weightController.text)) {
      AlertDialogBox.showAlert(context, message: "Please fill the shipment's weight");
    } else {
      ProgressDialog pr = ProgressDialog(context);
      await pr.show();
      try {
        rates = await ApiService.instance.estimateRate(
            fromPostalCode: fromPostalController.text.trim(), toPostalCode: toPostalController.text.trim(), weight: weightController.text.trim());
        await pr.hide();
      } catch (e) {
        await pr.hide();
        if (e is AssertionError)
          AlertDialogBox.showAlert(context, message: e.message);
        else
          AlertDialogBox.showAlert(context, message: e.toString());
      }
    }
  }

  List<Widget> getRates() {
    List<Widget> ratesWidget = [];
    ratesWidget.add(RatingLegends(context: context));
    rates.forEach((rate) {
      ratesWidget.add(RateRow(rate: rate));
    });
    return ratesWidget;
  }

  void dispose() {
    fromPostalController.dispose();
    toPostalController.dispose();
    weightController.dispose();
  }
}
