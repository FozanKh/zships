import 'package:zships/core/model/payment.dart';

class Options {
  String currency;
  Payment payment;
  int dateAdvance;

  Options({this.currency, this.payment, this.dateAdvance});

  Options.fromMap(Map<String, dynamic> map) {
    currency = map['currency'];
    payment = map['payment'] != null ?  Payment.fromMap(map['payment']) : null;
    dateAdvance = map['date_advance'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['currency'] = this.currency;
    if (this.payment != null) {
      data['payment'] = this.payment.toJson();
    }
    data['date_advance'] = this.dateAdvance;
    return data;
  }

  @override
  String toString() => 'Options(currency: $currency, payment: $payment, dateAdvance: $dateAdvance)';
}
