import 'package:zships/ship_engine/models/track/track_event.dart';

class ShipmentTrack {
  ShipmentTrack({
    this.trackingNumber,
    this.statusCode,
    this.carrierDetailCode,
    this.statusDescription,
    this.carrierStatusCode,
    this.carrierStatusDescription,
    this.shipDate,
    this.estimatedDeliveryDate,
    this.actualDeliveryDate,
    this.exceptionDescription,
    this.events,
  });

  String trackingNumber;
  String statusCode;
  dynamic carrierDetailCode;
  String statusDescription;
  String carrierStatusCode;
  String carrierStatusDescription;
  DateTime shipDate;
  dynamic estimatedDeliveryDate;
  DateTime actualDeliveryDate;
  dynamic exceptionDescription;
  List<Event> events;

  factory ShipmentTrack.fromMap(Map<String, dynamic> json) => ShipmentTrack(
        trackingNumber: json["tracking_number"] == null ? null : json["tracking_number"],
        statusCode: json["status_code"] == null ? null : json["status_code"],
        carrierDetailCode: json["carrier_detail_code"],
        statusDescription: json["status_description"] == null ? null : json["status_description"],
        carrierStatusCode: json["carrier_status_code"] == null ? null : json["carrier_status_code"],
        carrierStatusDescription: json["carrier_status_description"] == null ? null : json["carrier_status_description"],
        shipDate: json["ship_date"] == null ? null : DateTime.parse(json["ship_date"]),
        estimatedDeliveryDate: json["estimated_delivery_date"],
        actualDeliveryDate: json["actual_delivery_date"] == null ? null : DateTime.parse(json["actual_delivery_date"]),
        exceptionDescription: json["exception_description"],
        events: json["events"] == null ? null : List<Event>.from(json["events"].map((x) => Event.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "tracking_number": trackingNumber == null ? null : trackingNumber,
        "status_code": statusCode == null ? null : statusCode,
        "carrier_detail_code": carrierDetailCode,
        "status_description": statusDescription == null ? null : statusDescription,
        "carrier_status_code": carrierStatusCode == null ? null : carrierStatusCode,
        "carrier_status_description": carrierStatusDescription == null ? null : carrierStatusDescription,
        "ship_date": shipDate == null ? null : shipDate.toIso8601String(),
        "estimated_delivery_date": estimatedDeliveryDate,
        "actual_delivery_date": actualDeliveryDate == null ? null : actualDeliveryDate.toIso8601String(),
        "exception_description": exceptionDescription,
        "events": events == null ? null : List<dynamic>.from(events.map((x) => x.toMap())),
      };
}
