import 'package:zships/core/model/archived/tracking/tracking_location.dart';

class TrackingDetails {
	String object;
	String message;
	Null description;
	String status;
	String statusDetail;
	String datetime;
	String source;
	Null carrierCode;
	TrackingLocation trackingLocation;

	TrackingDetails({this.object, this.message, this.description, this.status, this.statusDetail, this.datetime, this.source, this.carrierCode, this.trackingLocation});

	TrackingDetails.fromJson(Map<String, dynamic> json) {
		object = json['object'];
		message = json['message'];
		description = json['description'];
		status = json['status'];
		statusDetail = json['status_detail'];
		datetime = json['datetime'];
		source = json['source'];
		carrierCode = json['carrier_code'];
		trackingLocation = json['tracking_location'] != null ? new TrackingLocation.fromJson(json['tracking_location']) : null;
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['object'] = this.object;
		data['message'] = this.message;
		data['description'] = this.description;
		data['status'] = this.status;
		data['status_detail'] = this.statusDetail;
		data['datetime'] = this.datetime;
		data['source'] = this.source;
		data['carrier_code'] = this.carrierCode;
		if (this.trackingLocation != null) {
      data['tracking_location'] = this.trackingLocation.toJson();
    }
		return data;
	}
}
