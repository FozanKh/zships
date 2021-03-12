class WeightSE {
  WeightSE({
    this.value,
    this.unit,
  });

  double value;
  String unit;

  factory WeightSE.fromMap(Map<String, dynamic> json) => WeightSE(
        value: json["value"] == null ? null : json["value"],
        unit: json["unit"] == null ? null : json["unit"],
      );

  Map<String, dynamic> toMap() => {
        "value": value == null ? null : value,
        "unit": unit == null ? null : unit,
      };

  @override
  String toString() {
    return '$value $unit';
  }
}
