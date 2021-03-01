import 'dart:convert';

class Address {
  String id;
  String object;
  String createdAt;
  String updatedAt;
  String name;
  String company;
  String street1;
  String street2;
  String city;
  String state;
  String zip;
  String country;
  String phone;
  String email;
  String mode;
  String carrierFacility;
  bool residential;
  String federalTaxId;
  String stateTaxId;
  Verifications verifications;

  Address(
      {this.id,
      this.object,
      this.createdAt,
      this.updatedAt,
      this.name,
      this.company,
      this.street1,
      this.street2,
      this.city,
      this.state,
      this.zip,
      this.country,
      this.phone,
      this.email,
      this.mode,
      this.carrierFacility,
      this.residential,
      this.federalTaxId,
      this.stateTaxId,
      this.verifications});

  Address.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    object = map['object'];
    createdAt = map['created_at'];
    updatedAt = map['updated_at'];
    name = map['name'];
    company = map['company'];
    street1 = map['street1'];
    street2 = map['street2'];
    city = map['city'];
    state = map['state'];
    zip = map['zip'];
    country = map['country'];
    phone = map['phone'];
    email = map['email'];
    mode = map['mode'];
    carrierFacility = map['carrier_facility'];
    residential = map['residential'];
    federalTaxId = map['federal_tax_id'];
    stateTaxId = map['state_tax_id'];
    verifications = map['verifications'] != null ? Verifications.fromMap(map['verifications']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['object'] = this.object;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['name'] = this.name;
    data['company'] = this.company;
    data['street1'] = this.street1;
    data['street2'] = this.street2;
    data['city'] = this.city;
    data['state'] = this.state;
    data['zip'] = this.zip;
    data['country'] = this.country;
    data['phone'] = this.phone;
    data['email'] = this.email;
    data['mode'] = this.mode;
    data['carrier_facility'] = this.carrierFacility;
    data['residential'] = this.residential;
    data['federal_tax_id'] = this.federalTaxId;
    data['state_tax_id'] = this.stateTaxId;
    if (this.verifications != null) {
      data['verifications'] = this.verifications.toJson();
    }
    return data;
  }

  @override
  String toString() {
    return 'Address(id: $id, object: $object, createdAt: $createdAt, updatedAt: $updatedAt, name: $name, company: $company, street1: $street1, street2: $street2, city: $city, state: $state, zip: $zip, country: $country, phone: $phone, email: $email, mode: $mode, carrierFacility: $carrierFacility, residential: $residential, federalTaxId: $federalTaxId, stateTaxId: $stateTaxId, verifications: $verifications)';
  }
}

class Verifications {
  Verifications();

  Verifications.fromMap(Map<dynamic, dynamic> map) {}

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    return data;
  }
}
