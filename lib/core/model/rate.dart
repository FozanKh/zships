class Rate {
  String id;
  String object;
  String createdAt;
  String updatedAt;
  String mode;
  String service;
  String carrier;
  String rate;
  String currency;
  String retailRate;
  String retailCurrency;
  String listRate;
  String listCurrency;
  int deliveryDays;
  String deliveryDate;
  bool deliveryDateGuaranteed;
  int estDeliveryDays;
  String shipmentId;
  String carrierAccountId;

  Rate(
      {this.id,
      this.object,
      this.createdAt,
      this.updatedAt,
      this.mode,
      this.service,
      this.carrier,
      this.rate,
      this.currency,
      this.retailRate,
      this.retailCurrency,
      this.listRate,
      this.listCurrency,
      this.deliveryDays,
      this.deliveryDate,
      this.deliveryDateGuaranteed,
      this.estDeliveryDays,
      this.shipmentId,
      this.carrierAccountId});

  Rate.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    object = map['object'];
    createdAt = map['created_at'];
    updatedAt = map['updated_at'];
    mode = map['mode'];
    service = map['service'];
    carrier = map['carrier'];
    rate = map['rate'];
    currency = map['currency'];
    retailRate = map['retail_rate'];
    retailCurrency = map['retail_currency'];
    listRate = map['list_rate'];
    listCurrency = map['list_currency'];
    deliveryDays = map['delivery_days'];
    deliveryDate = map['delivery_date'];
    deliveryDateGuaranteed = map['delivery_date_guaranteed'];
    estDeliveryDays = map['est_delivery_days'];
    shipmentId = map['shipment_id'];
    carrierAccountId = map['carrier_account_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['id'] = this.id;
    data['object'] = this.object;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['mode'] = this.mode;
    data['service'] = this.service;
    data['carrier'] = this.carrier;
    data['rate'] = this.rate;
    data['currency'] = this.currency;
    data['retail_rate'] = this.retailRate;
    data['retail_currency'] = this.retailCurrency;
    data['list_rate'] = this.listRate;
    data['list_currency'] = this.listCurrency;
    data['delivery_days'] = this.deliveryDays;
    data['delivery_date'] = this.deliveryDate;
    data['delivery_date_guaranteed'] = this.deliveryDateGuaranteed;
    data['est_delivery_days'] = this.estDeliveryDays;
    data['shipment_id'] = this.shipmentId;
    data['carrier_account_id'] = this.carrierAccountId;
    return data;
  }

  @override
  String toString() {
    return 'Rate(id: $id, object: $object, createdAt: $createdAt, updatedAt: $updatedAt, mode: $mode, service: $service, carrier: $carrier, rate: $rate, currency: $currency, retailRate: $retailRate, retailCurrency: $retailCurrency, listRate: $listRate, listCurrency: $listCurrency, deliveryDays: $deliveryDays, deliveryDate: $deliveryDate, deliveryDateGuaranteed: $deliveryDateGuaranteed, estDeliveryDays: $estDeliveryDays, shipmentId: $shipmentId, carrierAccountId: $carrierAccountId)';
  }
}
