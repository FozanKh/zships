import 'package:flutter/material.dart';
import 'package:zships/component/alertDialog.dart';
import 'package:zships/component/expandable_picker.dart';
import 'package:zships/component/progress_indicator.dart';
import 'package:zships/constants/lists.dart';
import 'package:zships/constants/validate.dart';
import 'package:zships/service/api/api_service.dart';
import 'package:zships/ship_engine/models/track/shipment_track.dart';

class TrackController {
  BuildContext context;
  GlobalKey<ExpandablePickerState> pickerKey;
  String carrierName;
  String carrierCode;
  TextEditingController trackCodeController;
  Map<String, String> carriersList;
  ShipmentTrack track;
  TrackController(this.context, {this.pickerKey, this.carrierName, this.trackCodeController}) {
    pickerKey = GlobalKey();
    trackCodeController = TextEditingController();
    // Will be replaced with dynamic list that can be retrieved via https://api.shipengine.com/v1/carriers
    carriersList = kCarriersList;
  }

  void chooseProvider(int provider) {
    carrierName = carriersList.keys.toList()[provider];
    carrierCode = carriersList[carrierName];
  }

  void collapsePicker() {
    pickerKey.currentState.collapse();
  }

  void dispose() {
    trackCodeController.dispose();
  }

  Future<void> trackByTrackNumber() async {
    if (!safeIsNotEmpty(trackCodeController.text)) {
      AlertDialogBox.showAlert(context, message: 'Please fill the track number');
      return;
    } else if (carrierCode == null) {
      AlertDialogBox.showAlert(context, message: 'Please choose a carrier');
      return;
    }
    ProgressDialog pr = ProgressDialog(context);
    await pr.show();
    try {
      track = await ApiService.instance.trackByTrackNumber(trackNumber: trackCodeController.text, carrierCode: carrierCode);
      trackCodeController.clear();
      await pr.hide();
    } catch (e) {
      await pr.hide();
      if (e is AssertionError)
        AlertDialogBox.showAlert(context, message: e.message);
      else
        AlertDialogBox.showAlert(context, message: e.toString());
    }
    return;
  }

  Future<void> trackByLabel() async {
    if (!safeIsNotEmpty(trackCodeController.text)) {
      AlertDialogBox.showAlert(context, message: 'Please fill the label ID');
      return;
    }
    ProgressDialog pr = ProgressDialog(context);
    await pr.show();
    try {
      track = await ApiService.instance.trackByLabel(labelId: trackCodeController.text);
      trackCodeController.clear();
      await pr.hide();
    } catch (e) {
      await pr.hide();
      if (e is AssertionError)
        AlertDialogBox.showAlert(context, message: e.message);
      else
        AlertDialogBox.showAlert(context, message: e.toString());
    }
    return;
  }
}
