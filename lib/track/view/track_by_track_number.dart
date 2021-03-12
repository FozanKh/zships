import 'package:flutter/material.dart';
import 'package:zships/component/expandable_picker.dart';
import 'package:zships/component/rounded_button.dart';
import 'package:zships/component/rounded_text_field.dart';
import 'package:zships/component/titled.dart';
import 'package:zships/constants/colors.dart';
import 'package:zships/track/component/track_card.dart';
import 'package:zships/track/controller/track_controller.dart';

class TrackByTrackingNumber extends StatefulWidget {
  @override
  _TrackByTrackingNumberState createState() => _TrackByTrackingNumberState();
}

class _TrackByTrackingNumberState extends State<TrackByTrackingNumber> {
  TrackController controller;
  @override
  void initState() {
    controller = TrackController(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.fromLTRB(20, 20, 20, 100),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Titled(
            title: "Choose a Carrier",
            child: ExpandablePicker(
              title: 'Carrier',
              initiallyExpanded: false,
              key: controller.pickerKey,
              options: controller.carriersList.keys.toList(),
              value: controller.carrierName,
              callback: (value) => setState(() {
                controller.collapsePicker();
                controller.chooseProvider(value);
              }),
            ),
          ),
          SizedBox(height: 20),
          Titled(
            title: 'Tracking number',
            child: RoundedTextField(
              fillColor: kLight2,
              margin: EdgeInsets.zero,
              hint: 'Write your tracking number',
              textController: controller.trackCodeController,
            ),
          ),
          SizedBox(height: 20),
          RoundedButton(title: 'Track', onTap: () => controller.trackByTrackNumber().then((value) => setState(() {}))),
          SizedBox(height: 20),
          if (controller.track != null) TrackCard(track: controller.track, hideCallback: () => setState(() => controller.track = null)),
        ],
      ),
    );
  }
}
