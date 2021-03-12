import 'package:zships/ship_engine/models/label/label_download.dart';
import 'package:zships/ship_engine/models/label/se_cost.dart';
import 'package:zships/ship_engine/models/package/package.dart';

class LabelSE {
  LabelSE({
    this.labelId,
    this.status,
    this.shipmentId,
    this.shipDate,
    this.createdAt,
    this.shipmentCost,
    this.insuranceCost,
    this.chargeEvent,
    this.trackingNumber,
    this.isReturnLabel,
    this.rmaNumber,
    this.isInternational,
    this.batchId,
    this.carrierId,
    this.serviceCode,
    this.packageCode,
    this.voided,
    this.voidedAt,
    this.labelFormat,
    this.labelLayout,
    this.trackable,
    this.labelImageId,
    this.carrierCode,
    this.trackingStatus,
    this.labelDownload,
    this.formDownload,
    this.insuranceClaim,
    this.packages,
  });

  String labelId;
  String status;
  String shipmentId;
  DateTime shipDate;
  DateTime createdAt;
  CostSE shipmentCost;
  CostSE insuranceCost;
  String chargeEvent;
  String trackingNumber;
  bool isReturnLabel;
  dynamic rmaNumber;
  bool isInternational;
  String batchId;
  String carrierId;
  String serviceCode;
  String packageCode;
  bool voided;
  dynamic voidedAt;
  String labelFormat;
  String labelLayout;
  bool trackable;
  dynamic labelImageId;
  String carrierCode;
  String trackingStatus;
  LabelDownload labelDownload;
  dynamic formDownload;
  dynamic insuranceClaim;
  List<PackageSE> packages;

  factory LabelSE.fromMap(Map<String, dynamic> json) => LabelSE(
        labelId: json["label_id"] == null ? null : json["label_id"],
        status: json["status"] == null ? null : json["status"],
        shipmentId: json["shipment_id"] == null ? null : json["shipment_id"],
        shipDate: json["ship_date"] == null ? null : DateTime.parse(json["ship_date"]),
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        shipmentCost: json["shipment_cost"] == null ? null : CostSE.fromMap(json["shipment_cost"]),
        insuranceCost: json["insurance_cost"] == null ? null : CostSE.fromMap(json["insurance_cost"]),
        chargeEvent: json["charge_event"] == null ? null : json["charge_event"],
        trackingNumber: json["tracking_number"] == null ? null : json["tracking_number"],
        isReturnLabel: json["is_return_label"] == null ? null : json["is_return_label"],
        rmaNumber: json["rma_number"],
        isInternational: json["is_international"] == null ? null : json["is_international"],
        batchId: json["batch_id"] == null ? null : json["batch_id"],
        carrierId: json["carrier_id"] == null ? null : json["carrier_id"],
        serviceCode: json["service_code"] == null ? null : json["service_code"],
        packageCode: json["package_code"] == null ? null : json["package_code"],
        voided: json["voided"] == null ? null : json["voided"],
        voidedAt: json["voided_at"],
        labelFormat: json["label_format"] == null ? null : json["label_format"],
        labelLayout: json["label_layout"] == null ? null : json["label_layout"],
        trackable: json["trackable"] == null ? null : json["trackable"],
        labelImageId: json["label_image_id"],
        carrierCode: json["carrier_code"] == null ? null : json["carrier_code"],
        trackingStatus: json["tracking_status"] == null ? null : json["tracking_status"],
        labelDownload: json["label_download"] == null ? null : LabelDownload.fromMap(json["label_download"]),
        formDownload: json["form_download"],
        insuranceClaim: json["insurance_claim"],
        packages: json["packages"] == null ? null : List<PackageSE>.from(json["packages"].map((x) => PackageSE.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "label_id": labelId == null ? null : labelId,
        "status": status == null ? null : status,
        "shipment_id": shipmentId == null ? null : shipmentId,
        "ship_date": shipDate == null ? null : shipDate.toIso8601String(),
        "created_at": createdAt == null ? null : createdAt.toIso8601String(),
        "shipment_cost": shipmentCost == null ? null : shipmentCost.toMap(),
        "insurance_cost": insuranceCost == null ? null : insuranceCost.toMap(),
        "charge_event": chargeEvent == null ? null : chargeEvent,
        "tracking_number": trackingNumber == null ? null : trackingNumber,
        "is_return_label": isReturnLabel == null ? null : isReturnLabel,
        "rma_number": rmaNumber,
        "is_international": isInternational == null ? null : isInternational,
        "batch_id": batchId == null ? null : batchId,
        "carrier_id": carrierId == null ? null : carrierId,
        "service_code": serviceCode == null ? null : serviceCode,
        "package_code": packageCode == null ? null : packageCode,
        "voided": voided == null ? null : voided,
        "voided_at": voidedAt,
        "label_format": labelFormat == null ? null : labelFormat,
        "label_layout": labelLayout == null ? null : labelLayout,
        "trackable": trackable == null ? null : trackable,
        "label_image_id": labelImageId,
        "carrier_code": carrierCode == null ? null : carrierCode,
        "tracking_status": trackingStatus == null ? null : trackingStatus,
        "label_download": labelDownload == null ? null : labelDownload.toMap(),
        "form_download": formDownload,
        "insurance_claim": insuranceClaim,
        "packages": packages == null ? null : List<dynamic>.from(packages.map((x) => x.toMap())),
      };
}
