class Payment {
  String type;

  Payment({this.type});

  Payment.fromMap(Map<String, dynamic> map) {
    type = map['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['type'] = this.type;
    return data;
  }

  @override
  String toString() => 'Payment(type: $type)';
}
