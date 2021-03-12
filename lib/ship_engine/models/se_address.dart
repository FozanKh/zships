class AddressSE {
    AddressSE({
        this.companyName,
        this.name,
        this.phone,
        this.addressLine1,
        this.addressLine2,
        this.cityLocality,
        this.stateProvince,
        this.postalCode,
        this.countryCode,
        this.addressResidentialIndicator,
    });

    String companyName;
    String name;
    String phone;
    String addressLine1;
    String addressLine2;
    String cityLocality;
    String stateProvince;
    String postalCode;
    String countryCode;
    String addressResidentialIndicator;

    factory AddressSE.fromMap(Map<String, dynamic> json) => AddressSE(
        companyName: json["company_name"] == null ? null : json["company_name"],
        name: json["name"] == null ? null : json["name"],
        phone: json["phone"] == null ? null : json["phone"],
        addressLine1: json["address_line1"] == null ? null : json["address_line1"],
        addressLine2: json["address_line2"] == null ? null : json["address_line2"],
        cityLocality: json["city_locality"] == null ? null : json["city_locality"],
        stateProvince: json["state_province"] == null ? null : json["state_province"],
        postalCode: json["postal_code"] == null ? null : json["postal_code"],
        countryCode: json["country_code"] == null ? null : json["country_code"],
        addressResidentialIndicator: json["address_residential_indicator"] == null ? null : json["address_residential_indicator"],
    );

    Map<String, dynamic> toMap() => {
        "company_name": companyName == null ? null : companyName,
        "name": name == null ? null : name,
        "phone": phone == null ? null : phone,
        "address_line1": addressLine1 == null ? null : addressLine1,
        "address_line2": addressLine2 == null ? null : addressLine2,
        "city_locality": cityLocality == null ? null : cityLocality,
        "state_province": stateProvince == null ? null : stateProvince,
        "postal_code": postalCode == null ? null : postalCode,
        "country_code": countryCode == null ? null : countryCode,
        "address_residential_indicator": addressResidentialIndicator == null ? null : addressResidentialIndicator,
    };
}
