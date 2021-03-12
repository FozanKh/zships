import 'package:zships/core/model/archived/fees.dart';
import 'package:zships/core/model/archived/tracking/carrier_details.dart';
import 'package:zships/core/model/archived/tracking/tracking_detailes.dart';

class Tracker {
  String id;
  String object;
  String mode;
  String trackingCode;
  String status;
  String statusDetail;
  String createdAt;
  String updatedAt;
  String signedBy;
  Null weight;
  String estDeliveryDate;
  String shipmentId;
  String carrier;
  List<TrackingDetails> trackingDetails;
  List<Fees> fees;
  CarrierDetail carrierDetail;
  String publicUrl;

  Tracker(
      {this.id,
      this.object,
      this.mode,
      this.trackingCode,
      this.status,
      this.statusDetail,
      this.createdAt,
      this.updatedAt,
      this.signedBy,
      this.weight,
      this.estDeliveryDate,
      this.shipmentId,
      this.carrier,
      this.trackingDetails,
      this.fees,
      this.carrierDetail,
      this.publicUrl});

  Tracker.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    object = json['object'];
    mode = json['mode'];
    trackingCode = json['tracking_code'];
    status = json['status'];
    statusDetail = json['status_detail'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    signedBy = json['signed_by'];
    weight = json['weight'];
    estDeliveryDate = json['est_delivery_date'];
    shipmentId = json['shipment_id'];
    carrier = json['carrier'];
    if (json['tracking_details'] != null) {
      trackingDetails = new List<TrackingDetails>();
      json['tracking_details'].forEach((v) {
        trackingDetails.add(new TrackingDetails.fromJson(v));
      });
    }
    if (json['fees'] != null) {
      fees = new List<Fees>();
      json['fees'].forEach((v) {
        fees.add(Fees.fromJson(v));
      });
    }
    carrierDetail = json['carrier_detail'] != null ? new CarrierDetail.fromJson(json['carrier_detail']) : null;
    publicUrl = json['public_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['object'] = this.object;
    data['mode'] = this.mode;
    data['tracking_code'] = this.trackingCode;
    data['status'] = this.status;
    data['status_detail'] = this.statusDetail;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['signed_by'] = this.signedBy;
    data['weight'] = this.weight;
    data['est_delivery_date'] = this.estDeliveryDate;
    data['shipment_id'] = this.shipmentId;
    data['carrier'] = this.carrier;
    if (this.trackingDetails != null) {
      data['tracking_details'] = this.trackingDetails.map((v) => v.toJson()).toList();
    }
    if (this.fees != null) {
      data['fees'] = this.fees.map((Fees v) => v.toJson()).toList();
    }
    if (this.carrierDetail != null) {
      data['carrier_detail'] = this.carrierDetail.toJson();
    }
    data['public_url'] = this.publicUrl;
    return data;
  }
}
