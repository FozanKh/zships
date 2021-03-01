class Parcel {
  String id;
  String object;
  String createdAt;
  String updatedAt;
  double length;
  double width;
  double height;
  String predefinedPackage;
  double weight;
  String mode;

  Parcel(
      {this.id, this.object, this.createdAt, this.updatedAt, this.length, this.width, this.height, this.predefinedPackage, this.weight, this.mode});

  Parcel.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    object = map['object'];
    createdAt = map['created_at'];
    updatedAt = map['updated_at'];
    length = map['length'];
    width = map['width'];
    height = map['height'];
    predefinedPackage = map['predefined_package'];
    weight = map['weight'];
    mode = map['mode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['object'] = this.object;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['length'] = this.length;
    data['width'] = this.width;
    data['height'] = this.height;
    data['predefined_package'] = this.predefinedPackage;
    data['weight'] = this.weight;
    data['mode'] = this.mode;
    return data;
  }

  @override
  String toString() {
    return 'Parcel(id: $id, object: $object, createdAt: $createdAt, updatedAt: $updatedAt, length: $length, width: $width, height: $height, predefinedPackage: $predefinedPackage, weight: $weight, mode: $mode)';
  }
}
