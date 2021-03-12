import 'package:zships/ship_engine/models/label/se_label.dart';
import 'package:zships/ship_engine/models/package/package.dart';
import 'package:zships/ship_engine/models/se_address.dart';
import 'package:zships/ship_engine/models/package/se_weight.dart';
import 'package:zships/ship_engine/models/se_error.dart';

class ShipmentSE {
  ShipmentSE({
    this.errors,
    this.addressValidation,
    this.shipmentId,
    this.carrierId,
    this.serviceCode,
    this.externalShipmentId,
    this.shipDate,
    this.createdAt,
    this.modifiedAt,
    this.shipmentStatus,
    this.shipTo,
    this.shipFrom,
    this.warehouseId,
    this.returnTo,
    this.insuranceProvider,
    this.tags,
    this.packages,
    this.totalWeight,
    this.labels,
  });

  ErrorSE errors;
  dynamic addressValidation;
  String shipmentId;
  String carrierId;
  String serviceCode;
  String externalShipmentId;
  DateTime shipDate;
  DateTime createdAt;
  DateTime modifiedAt;
  String shipmentStatus;
  AddressSE shipTo;
  AddressSE shipFrom;
  dynamic warehouseId;
  AddressSE returnTo;
  String insuranceProvider;
  List<dynamic> tags;
  List<PackageSE> packages;
  WeightSE totalWeight;
  List<LabelSE> labels;

  factory ShipmentSE.fromMap(Map<String, dynamic> json) => ShipmentSE(
        errors: json["errors"],
        addressValidation: json["address_validation"],
        shipmentId: json["shipment_id"] == null ? null : json["shipment_id"],
        carrierId: json["carrier_id"] == null ? null : json["carrier_id"],
        serviceCode: json["service_code"] == null ? null : json["service_code"],
        externalShipmentId: json["external_shipment_id"] == null ? null : json["external_shipment_id"],
        shipDate: json["ship_date"] == null ? null : DateTime.parse(json["ship_date"]),
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        modifiedAt: json["modified_at"] == null ? null : DateTime.parse(json["modified_at"]),
        shipmentStatus: json["shipment_status"] == null ? null : json["shipment_status"],
        shipTo: json["ship_to"] == null ? null : AddressSE.fromMap(json["ship_to"]),
        shipFrom: json["ship_from"] == null ? null : AddressSE.fromMap(json["ship_from"]),
        warehouseId: json["warehouse_id"],
        returnTo: json["return_to"] == null ? null : AddressSE.fromMap(json["return_to"]),
        insuranceProvider: json["insurance_provider"] == null ? null : json["insurance_provider"],
        tags: json["tags"] == null ? null : List<dynamic>.from(json["tags"].map((x) => x)),
        packages: json["packages"] == null ? null : List<PackageSE>.from(json["packages"].map((x) => PackageSE.fromMap(x))),
        totalWeight: json["total_weight"] == null ? null : WeightSE.fromMap(json["total_weight"]),
      );

  Map<String, dynamic> toMap() => {
        "errors": errors,
        "address_validation": addressValidation,
        "shipment_id": shipmentId == null ? null : shipmentId,
        "carrier_id": carrierId == null ? null : carrierId,
        "service_code": serviceCode == null ? null : serviceCode,
        "external_shipment_id": externalShipmentId == null ? null : externalShipmentId,
        "ship_date": shipDate == null ? null : shipDate.toIso8601String(),
        "created_at": createdAt == null ? null : createdAt.toIso8601String(),
        "modified_at": modifiedAt == null ? null : modifiedAt.toIso8601String(),
        "shipment_status": shipmentStatus == null ? null : shipmentStatus,
        "ship_to": shipTo == null ? null : shipTo.toMap(),
        "ship_from": shipFrom == null ? null : shipFrom.toMap(),
        "warehouse_id": warehouseId,
        "return_to": returnTo == null ? null : returnTo.toMap(),
        "insurance_provider": insuranceProvider == null ? null : insuranceProvider,
        "tags": tags == null ? null : List<dynamic>.from(tags.map((x) => x)),
        "packages": packages == null ? null : List<dynamic>.from(packages.map((x) => x.toMap())),
        "total_weight": totalWeight == null ? null : totalWeight.toMap(),
      };
}
