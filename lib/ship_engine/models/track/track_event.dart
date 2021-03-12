class Event {
  Event({
    this.occurredAt,
    this.carrierOccurredAt,
    this.description,
    this.cityLocality,
    this.stateProvince,
    this.postalCode,
    this.countryCode,
    this.companyName,
    this.signer,
    this.eventCode,
    this.carrierDetailCode,
    this.statusCode,
    this.carrierStatusCode,
    this.latitude,
    this.longitude,
  });

  DateTime occurredAt;
  DateTime carrierOccurredAt;
  String description;
  String cityLocality;
  String stateProvince;
  String postalCode;
  String countryCode;
  String companyName;
  String signer;
  String eventCode;
  dynamic carrierDetailCode;
  String statusCode;
  String carrierStatusCode;
  double latitude;
  double longitude;

  factory Event.fromMap(Map<String, dynamic> json) => Event(
        occurredAt: json["occurred_at"] == null ? null : DateTime.parse(json["occurred_at"]),
        carrierOccurredAt: json["carrier_occurred_at"] == null ? null : DateTime.parse(json["carrier_occurred_at"]),
        description: json["description"] == null ? null : json["description"],
        cityLocality: json["city_locality"] == null ? null : json["city_locality"],
        stateProvince: json["state_province"] == null ? null : json["state_province"],
        postalCode: json["postal_code"] == null ? null : json["postal_code"],
        countryCode: json["country_code"] == null ? null : json["country_code"],
        companyName: json["company_name"] == null ? null : json["company_name"],
        signer: json["signer"] == null ? null : json["signer"],
        eventCode: json["event_code"] == null ? null : json["event_code"],
        carrierDetailCode: json["carrier_detail_code"],
        statusCode: json["status_code"] == null ? null : json["status_code"],
        carrierStatusCode: json["carrier_status_code"] == null ? null : json["carrier_status_code"],
        latitude: json["latitude"] == null ? null : json["latitude"].toDouble(),
        longitude: json["longitude"] == null ? null : json["longitude"].toDouble(),
      );

  Map<String, dynamic> toMap() => {
        "occurred_at": occurredAt == null ? null : occurredAt.toIso8601String(),
        "carrier_occurred_at": carrierOccurredAt == null ? null : carrierOccurredAt.toIso8601String(),
        "description": description == null ? null : description,
        "city_locality": cityLocality == null ? null : cityLocality,
        "state_province": stateProvince == null ? null : stateProvince,
        "postal_code": postalCode == null ? null : postalCode,
        "country_code": countryCode == null ? null : countryCode,
        "company_name": companyName == null ? null : companyName,
        "signer": signer == null ? null : signer,
        "event_code": eventCode == null ? null : eventCode,
        "carrier_detail_code": carrierDetailCode,
        "status_code": statusCode == null ? null : statusCode,
        "carrier_status_code": carrierStatusCode == null ? null : carrierStatusCode,
        "latitude": latitude == null ? null : latitude,
        "longitude": longitude == null ? null : longitude,
      };
}
