class CostSE {
  CostSE({
    this.currency,
    this.amount,
  });

  String currency;
  double amount;

  factory CostSE.fromMap(Map<String, dynamic> json) => CostSE(
        currency: json["currency"] == null ? null : json["currency"],
        amount: json["amount"] == null ? null : json["amount"].toDouble(),
      );

  Map<String, dynamic> toMap() => {
        "currency": currency == null ? null : currency,
        "amount": amount == null ? null : amount,
      };
}
