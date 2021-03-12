import 'package:zships/ship_engine/models/label/se_cost.dart';

class RateSE {
  RateSE({
    this.rateType,
    this.carrierId,
    this.shippingAmount,
    this.insuranceAmount,
    this.confirmationAmount,
    this.otherAmount,
    this.zone,
    this.packageType,
    this.deliveryDays,
    this.guaranteedService,
    this.estimatedDeliveryDate,
    this.carrierDeliveryDays,
    this.shipDate,
    this.negotiatedRate,
    this.serviceType,
    this.serviceCode,
    this.trackable,
    this.carrierCode,
    this.carrierNickname,
    this.carrierFriendlyName,
    this.validationStatus,
    this.warningMessages,
    this.errorMessages,
  });

  String rateType;
  String carrierId;
  CostSE shippingAmount;
  CostSE insuranceAmount;
  CostSE confirmationAmount;
  CostSE otherAmount;
  int zone;
  String packageType;
  int deliveryDays;
  bool guaranteedService;
  DateTime estimatedDeliveryDate;
  String carrierDeliveryDays;
  DateTime shipDate;
  bool negotiatedRate;
  String serviceType;
  String serviceCode;
  bool trackable;
  String carrierCode;
  String carrierNickname;
  String carrierFriendlyName;
  String validationStatus;
  List<dynamic> warningMessages;
  List<dynamic> errorMessages;

  factory RateSE.fromMap(Map<String, dynamic> json) => RateSE(
        rateType: json["rate_type"] == null ? null : json["rate_type"],
        carrierId: json["carrier_id"] == null ? null : json["carrier_id"],
        shippingAmount: json["shipping_amount"] == null ? null : CostSE.fromMap(json["shipping_amount"]),
        insuranceAmount: json["insurance_amount"] == null ? null : CostSE.fromMap(json["insurance_amount"]),
        confirmationAmount: json["confirmation_amount"] == null ? null : CostSE.fromMap(json["confirmation_amount"]),
        otherAmount: json["other_amount"] == null ? null : CostSE.fromMap(json["other_amount"]),
        zone: json["zone"] == null ? null : json["zone"],
        packageType: json["package_type"] == null ? null : json["package_type"],
        deliveryDays: json["delivery_days"] == null ? null : json["delivery_days"],
        guaranteedService: json["guaranteed_service"] == null ? null : json["guaranteed_service"],
        estimatedDeliveryDate: json["estimated_delivery_date"] == null ? null : DateTime.parse(json["estimated_delivery_date"]),
        carrierDeliveryDays: json["carrier_delivery_days"] == null ? null : json["carrier_delivery_days"],
        shipDate: json["ship_date"] == null ? null : DateTime.parse(json["ship_date"]),
        negotiatedRate: json["negotiated_rate"] == null ? null : json["negotiated_rate"],
        serviceType: json["service_type"] == null ? null : json["service_type"],
        serviceCode: json["service_code"] == null ? null : json["service_code"],
        trackable: json["trackable"] == null ? null : json["trackable"],
        carrierCode: json["carrier_code"] == null ? null : json["carrier_code"],
        carrierNickname: json["carrier_nickname"] == null ? null : json["carrier_nickname"],
        carrierFriendlyName: json["carrier_friendly_name"] == null ? null : json["carrier_friendly_name"],
        validationStatus: json["validation_status"] == null ? null : json["validation_status"],
        warningMessages: json["warning_messages"] == null ? null : List<dynamic>.from(json["warning_messages"].map((x) => x)),
        errorMessages: json["error_messages"] == null ? null : List<dynamic>.from(json["error_messages"].map((x) => x)),
      );

  Map<String, dynamic> toMap() => {
        "rate_type": rateType == null ? null : rateType,
        "carrier_id": carrierId == null ? null : carrierId,
        "shipping_amount": shippingAmount == null ? null : shippingAmount.toMap(),
        "insurance_amount": insuranceAmount == null ? null : insuranceAmount.toMap(),
        "confirmation_amount": confirmationAmount == null ? null : confirmationAmount.toMap(),
        "other_amount": otherAmount == null ? null : otherAmount.toMap(),
        "zone": zone == null ? null : zone,
        "package_type": packageType == null ? null : packageType,
        "delivery_days": deliveryDays == null ? null : deliveryDays,
        "guaranteed_service": guaranteedService == null ? null : guaranteedService,
        "estimated_delivery_date": estimatedDeliveryDate == null ? null : estimatedDeliveryDate.toIso8601String(),
        "carrier_delivery_days": carrierDeliveryDays == null ? null : carrierDeliveryDays,
        "ship_date": shipDate == null ? null : shipDate.toIso8601String(),
        "negotiated_rate": negotiatedRate == null ? null : negotiatedRate,
        "service_type": serviceType == null ? null : serviceType,
        "service_code": serviceCode == null ? null : serviceCode,
        "trackable": trackable == null ? null : trackable,
        "carrier_code": carrierCode == null ? null : carrierCode,
        "carrier_nickname": carrierNickname == null ? null : carrierNickname,
        "carrier_friendly_name": carrierFriendlyName == null ? null : carrierFriendlyName,
        "validation_status": validationStatus == null ? null : validationStatus,
        "warning_messages": warningMessages == null ? null : List<dynamic>.from(warningMessages.map((x) => x)),
        "error_messages": errorMessages == null ? null : List<dynamic>.from(errorMessages.map((x) => x)),
      };

  @override
  String toString() {
    return 'Rate: ${shippingAmount?.amount} ${shippingAmount?.currency}';
  }
}
