import 'package:flutter/material.dart';
import 'package:zships/constants/colors.dart';
import 'package:zships/constants/decorations.dart';
import 'package:zships/home/component/home_appbar.dart';
import 'package:zships/localization/constants.dart';
import 'package:zships/track/view/track_by_label.dart';
import 'package:zships/track/view/track_by_track_number.dart';

class TrackView extends StatefulWidget {
  @override
  _TrackViewState createState() => _TrackViewState();
}

class _TrackViewState extends State<TrackView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kTransparent,
      appBar: CustomAppBar(
        context,
        title: 'Track Shipment',
        trailingIcon: false,
        textStyle: TextStyle(fontSize: 30, color: kWhite),
      ),
      body: DefaultTabController(
        length: 2,
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(boxShadow: kBoxShadow, color: kBackground),
              child: TabBar(
                labelColor: kFontsColor,
                unselectedLabelColor: kDark4,
                indicatorColor: kFontsColor,
                
                isScrollable: false,
                tabs: [
                  Tab(child: Text(getText(context, 'Tracking number'), textAlign: TextAlign.center)),
                  Tab(child: Text(getText(context, 'Label'), textAlign: TextAlign.center)),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                children: [TrackByTrackingNumber(), TrackByLabelId()],
              ),
            )
          ],
        ),
      ),
    );
  }
}
