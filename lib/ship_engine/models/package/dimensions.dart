class Dimensions {
  Dimensions({
    this.unit,
    this.length,
    this.width,
    this.height,
  });

  String unit;
  double length;
  double width;
  double height;

  factory Dimensions.fromMap(Map<String, dynamic> json) => Dimensions(
        unit: json["unit"] == null ? null : json["unit"],
        length: json["length"] == null ? null : json["length"],
        width: json["width"] == null ? null : json["width"],
        height: json["height"] == null ? null : json["height"],
      );

  Map<String, dynamic> toMap() => {
        "unit": unit == null ? null : unit,
        "length": length == null ? null : length,
        "width": width == null ? null : width,
        "height": height == null ? null : height,
      };
}
