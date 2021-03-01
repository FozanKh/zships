class Verifications {
  Zip4 zip4;
  Delivery delivery;

  Verifications({this.zip4, this.delivery});

  Verifications.fromJson(Map<String, dynamic> json) {
    zip4 = json['zip4'] != null ? new Zip4.fromJson(json['zip4']) : null;
    delivery = json['delivery'] != null ? new Delivery.fromJson(json['delivery']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.zip4 != null) {
      data['zip4'] = this.zip4.toJson();
    }
    if (this.delivery != null) {
      data['delivery'] = this.delivery.toJson();
    }
    return data;
  }
}

class Zip4 {
  bool success;
  List<dynamic> errors;
  Null details;

  Zip4({this.success, this.errors, this.details});

  Zip4.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['errors'] != null) {
      errors = new List<dynamic>();
      json['errors'].forEach((v) {
        errors.add(v);
      });
    }
    details = json['details'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.errors != null) {
      data['errors'] = this.errors.map((v) => v.toJson()).toList();
    }
    data['details'] = this.details;
    return data;
  }
}

class Delivery {
  bool success;
  List<dynamic> errors;
  Details details;

  Delivery({this.success, this.errors, this.details});

  Delivery.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['errors'] != null) {
      errors = new List<dynamic>();
      json['errors'].forEach((v) {
        errors.add(v);
      });
    }
    details = json['details'] != null ? new Details.fromJson(json['details']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.errors != null) {
      data['errors'] = this.errors.map((v) => v.toJson()).toList();
    }
    if (this.details != null) {
      data['details'] = this.details.toJson();
    }
    return data;
  }
}

class Details {
  double latitude;
  double longitude;
  String timeZone;

  Details({this.latitude, this.longitude, this.timeZone});

  Details.fromJson(Map<String, dynamic> json) {
    latitude = json['latitude'];
    longitude = json['longitude'];
    timeZone = json['time_zone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['time_zone'] = this.timeZone;
    return data;
  }
}
