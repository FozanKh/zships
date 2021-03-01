class TrackingLocation {
	String object;
	String city;
	String state;
	Null country;
	String zip;

	TrackingLocation({this.object, this.city, this.state, this.country, this.zip});

	TrackingLocation.fromJson(Map<String, dynamic> json) {
		object = json['object'];
		city = json['city'];
		state = json['state'];
		country = json['country'];
		zip = json['zip'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['object'] = this.object;
		data['city'] = this.city;
		data['state'] = this.state;
		data['country'] = this.country;
		data['zip'] = this.zip;
		return data;
	}
}
