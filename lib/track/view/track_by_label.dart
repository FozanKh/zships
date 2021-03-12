import 'package:flutter/material.dart';
import 'package:zships/component/rounded_button.dart';
import 'package:zships/component/rounded_text_field.dart';
import 'package:zships/component/titled.dart';
import 'package:zships/constants/colors.dart';
import 'package:zships/localization/constants.dart';
import 'package:zships/track/component/track_card.dart';
import 'package:zships/track/controller/track_controller.dart';

class TrackByLabelId extends StatefulWidget {
  @override
  _TrackByLabelIdState createState() => _TrackByLabelIdState();
}

class _TrackByLabelIdState extends State<TrackByLabelId> {
  TrackController controller;
  @override
  void initState() {
    controller = TrackController(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          Titled(
            title: getText(context, 'Label ID'),
            child: RoundedTextField(
              fillColor: kLight2,
              margin: EdgeInsets.zero,
              hint: getText(context, 'Write your Label ID'),
              textController: controller.trackCodeController,
            ),
          ),
          SizedBox(height: 20),
          RoundedButton(title: getText(context, 'Track'), onTap: () => controller.trackByLabel().then((value) => setState(() {}))),
          SizedBox(height: 20),
          if (controller.track != null) TrackCard(track: controller.track, hideCallback: () => setState(() => controller.track = null)),
        ],
      ),
    );
  }
}
