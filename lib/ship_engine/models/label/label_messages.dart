class LabelMessages {
  LabelMessages({
    this.reference1,
    this.reference2,
    this.reference3,
  });

  dynamic reference1;
  dynamic reference2;
  dynamic reference3;

  factory LabelMessages.fromMap(Map<String, dynamic> json) => LabelMessages(
        reference1: json["reference1"],
        reference2: json["reference2"],
        reference3: json["reference3"],
      );

  Map<String, dynamic> toMap() => {
        "reference1": reference1,
        "reference2": reference2,
        "reference3": reference3,
      };
}
