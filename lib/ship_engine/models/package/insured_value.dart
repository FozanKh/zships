class InsuredValueSE {
  InsuredValueSE({
    this.currency,
    this.amount,
  });

  String currency;
  int amount;

  factory InsuredValueSE.fromMap(Map<String, dynamic> json) => InsuredValueSE(
        currency: json["currency"] == null ? null : json["currency"],
        amount: json["amount"] == null ? null : json["amount"],
      );

  Map<String, dynamic> toMap() => {
        "currency": currency == null ? null : currency,
        "amount": amount == null ? null : amount,
      };
}
