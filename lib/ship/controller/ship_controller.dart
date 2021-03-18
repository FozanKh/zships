import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:zships/component/alertDialog.dart';
import 'package:zships/component/progress_indicator.dart';
import 'package:zships/constants/validate.dart';
import 'package:zships/service/api/api_service.dart';

class ShipController {
  BuildContext context;
  TextEditingController fromName;
  TextEditingController toName;
  TextEditingController fromStateCode;
  TextEditingController toStateCode;
  TextEditingController fromPostalCode;
  TextEditingController toPostalCode;
  TextEditingController fromPhone;
  TextEditingController toPhone;
  TextEditingController weight;
  List<TextEditingController> textControllers = [];
  Map<String, dynamic> json;

  ShipController(this.context) {
    fromName = TextEditingController();
    toName = TextEditingController();
    fromPostalCode = TextEditingController();
    toPostalCode = TextEditingController();
    fromPhone = TextEditingController();
    toPhone = TextEditingController();
    fromStateCode = TextEditingController();
    toStateCode = TextEditingController();
    weight = TextEditingController();
  }

  Future<void> createShipment() async {
    if (!safeIsNotEmpty(fromName.text) || !validatePostalCode(fromPostalCode.text) || fromPhone.text.length < 10 || fromStateCode.text.length != 2) {
      AlertDialogBox.showAlert(context, message: 'Please fill from address properly');
    } else if (!safeIsNotEmpty(toName.text) || !validatePostalCode(toPostalCode.text) || toPhone.text.length < 10 || toStateCode.text.length != 2) {
      AlertDialogBox.showAlert(context, message: 'Please fill to address properly');
    } else if (!safeIsNotEmpty(weight.text)) {
      AlertDialogBox.showAlert(context, message: "Please fill the shipment's weight");
    } else {
      ProgressDialog pr = ProgressDialog(context);
      await pr.show();

      try {
        json = _createJson(fromName.text, fromPhone.text, fromStateCode.text, fromPostalCode.text, toName.text, toPhone.text, toStateCode.text,
            toPostalCode.text, weight.text);
        await ApiService.instance.createShipment(jsonEncode(json));
        clearFields();
        await pr.hide();
        AlertDialogBox.showAlert(context, message: 'Shipment Created Successfully!');
      } catch (e) {
        await pr.hide();
        AlertDialogBox.showAlert(context, message: e.toString());
      }
    }
  }

  Map<String, dynamic> _createJson(fromName, fromPhone, fromStateCode, fromPostalCode, toName, toPhone, toStateCode, toPostalCode, weight) {
    return {
      "shipments": [
        {
          "validate_address": "no_validation",
          "service_code": "ups_ground",
          "ship_to": {
            "name": "$toName",
            "phone": "$toPhone",
            "postal_code": "$toPostalCode",
            "state_province": "$toStateCode",
            "city_locality": "City",
            "address_line1": "Sample Address",
            "country_code": "US",
            "address_residential_indicator": "yes"
          },
          "ship_from": {
            "name": "$fromName",
            "phone": "$fromPhone",
            "postal_code": "$fromPostalCode",
            "state_province": "$fromStateCode",
            "city_locality": "City",
            "address_line1": "SampleAddress",
            "country_code": "US",
            "address_residential_indicator": "no"
          },
          "packages": [
            {
              "weight": {"value": weight, "unit": "kilogram"}
            }
          ]
        }
      ]
    };
  }

  void clearFields() {
    fromName.clear();
    toName.clear();
    fromStateCode.clear();
    toStateCode.clear();
    fromPostalCode.clear();
    toPostalCode.clear();
    fromPhone.clear();
    toPhone.clear();
    weight.clear();
  }
}
