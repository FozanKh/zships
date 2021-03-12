import 'package:zships/ship_engine/models/label/label_messages.dart';
import 'package:zships/ship_engine/models/label/se_cost.dart';
import 'package:zships/ship_engine/models/package/dimensions.dart';
import 'package:zships/ship_engine/models/package/se_weight.dart';

class PackageSE {
  PackageSE({
    this.packageCode,
    this.weight,
    this.dimensions,
    this.insuredValue,
    this.trackingNumber,
    this.labelMessages,
    this.externalPackageId,
  });

  String packageCode;
  WeightSE weight;
  Dimensions dimensions;
  CostSE insuredValue;
  String trackingNumber;
  LabelMessages labelMessages;
  dynamic externalPackageId;

  factory PackageSE.fromMap(Map<String, dynamic> json) => PackageSE(
        packageCode: json["package_code"] == null ? null : json["package_code"],
        weight: json["weight"] == null ? null : WeightSE.fromMap(json["weight"]),
        dimensions: json["dimensions"] == null ? null : Dimensions.fromMap(json["dimensions"]),
        insuredValue: json["insured_value"] == null ? null : CostSE.fromMap(json["insured_value"]),
        trackingNumber: json["tracking_number"] == null ? null : json["tracking_number"],
        labelMessages: json["label_messages"] == null ? null : LabelMessages.fromMap(json["label_messages"]),
        externalPackageId: json["external_package_id"],
      );

  Map<String, dynamic> toMap() => {
        "package_code": packageCode == null ? null : packageCode,
        "weight": weight == null ? null : weight.toMap(),
        "dimensions": dimensions == null ? null : dimensions.toMap(),
        "insured_value": insuredValue == null ? null : insuredValue.toMap(),
        "tracking_number": trackingNumber == null ? null : trackingNumber,
        "label_messages": labelMessages == null ? null : labelMessages.toMap(),
        "external_package_id": externalPackageId,
      };
}
