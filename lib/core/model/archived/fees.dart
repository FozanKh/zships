class Fees {
	String object;
	String type;
	String amount;
	bool charged;
	bool refunded;

	Fees({this.object, this.type, this.amount, this.charged, this.refunded});

	Fees.fromJson(Map<String, dynamic> json) {
		object = json['object'];
		type = json['type'];
		amount = json['amount'];
		charged = json['charged'];
		refunded = json['refunded'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['object'] = this.object;
		data['type'] = this.type;
		data['amount'] = this.amount;
		data['charged'] = this.charged;
		data['refunded'] = this.refunded;
		return data;
	}
}

