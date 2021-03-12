import 'package:flutter/material.dart';
import 'package:zships/constants/colors.dart';
import 'package:zships/constants/decorations.dart';
import 'package:zships/localization/constants.dart';
import 'package:zships/ship_engine/models/track/shipment_track.dart';

// ignore: must_be_immutable
class StatusTag extends StatelessWidget {
  final ShipmentTrack track;
  const StatusTag({this.track});

  getStatusColor() {
    switch (track.statusCode.toUpperCase()) {
      case 'DE':
        return Colors.green;
        break;
      case 'IT':
        return Colors.orange;
        break;
      case 'AC':
        return Colors.blue;
        break;
      case 'AT':
        return Colors.amber;
        break;
      case 'EX':
      case 'NY':
        return Colors.red;
        break;
      default:
        return Colors.grey;
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(getText(context, 'Shipment status') + ':', style: TextStyle(fontWeight: FontWeight.w500, height: 1.1)),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
          margin: EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(borderRadius: kBorderRadiusSmall, color: getStatusColor()),
          child: Text(track.statusDescription, style: TextStyle(color: kWhite, fontWeight: FontWeight.w500, height: 1.1)),
        ),
      ],
    );
  }
}
