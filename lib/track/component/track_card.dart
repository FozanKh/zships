import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart';
import 'package:zships/constants/colors.dart';
import 'package:zships/constants/decorations.dart';
import 'package:zships/constants/validate.dart';
import 'package:zships/ship_engine/models/track/shipment_track.dart';
import 'package:zships/track/component/status_tag.dart';

class TrackCard extends StatelessWidget {
  const TrackCard({@required this.track, this.hideCallback});

  final ShipmentTrack track;
  final Function hideCallback;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: kBackground, boxShadow: kBoxShadowDark, borderRadius: kBorderRadius),
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                  child:
                      Text('Shipment:\t${track?.trackingNumber}', style: TextStyle(fontWeight: FontWeight.w600, color: kFontsColor, fontSize: 20))),
              InkWell(onTap: hideCallback, child: Icon(CupertinoIcons.clear_fill, color: kRed))
            ],
          ),
          Divider(color: kFontsColor),
          StatusTag(track: track),
          if (track.statusCode == 'NY' || track.statusCode == 'UN') Text('Make sure Tracking number is matching the carrier'),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (track.shipDate != null) Divider(),
              if (track.shipDate != null)
                Text('Shipped at:\t${format(track.shipDate)}', style: TextStyle(fontWeight: FontWeight.w600, color: kFontsColor)),
              if (safeListIsNotEmpty(track.events)) Divider(),
              if (safeListIsNotEmpty(track.events))
                Text('Last Update:\n${track.events.last.description}', style: TextStyle(fontWeight: FontWeight.w600, color: kFontsColor)),
              if (safeListIsNotEmpty(track.events)) Divider(),
              if (safeListIsNotEmpty(track.events))
                Text('Carrier Note:\n${track.carrierStatusDescription}', style: TextStyle(fontWeight: FontWeight.w600, color: kFontsColor)),
            ],
          ),
        ],
      ),
    );
  }
}
