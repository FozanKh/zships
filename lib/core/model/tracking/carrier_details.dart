import 'package:zships/core/model/tracking/tracking_location.dart';

class CarrierDetail {
	String object;
	String service;
	Null containerType;
	Null estDeliveryDateLocal;
	Null estDeliveryTimeLocal;
	String originLocation;
	TrackingLocation originTrackingLocation;
	String destinationLocation;
	TrackingLocation destinationTrackingLocation;
	Null guaranteedDeliveryDate;
	Null alternateIdentifier;
	String initialDeliveryAttempt;

	CarrierDetail({this.object, this.service, this.containerType, this.estDeliveryDateLocal, this.estDeliveryTimeLocal, this.originLocation, this.originTrackingLocation, this.destinationLocation, this.destinationTrackingLocation, this.guaranteedDeliveryDate, this.alternateIdentifier, this.initialDeliveryAttempt});

	CarrierDetail.fromJson(Map<String, dynamic> json) {
		object = json['object'];
		service = json['service'];
		containerType = json['container_type'];
		estDeliveryDateLocal = json['est_delivery_date_local'];
		estDeliveryTimeLocal = json['est_delivery_time_local'];
		originLocation = json['origin_location'];
		originTrackingLocation = json['origin_tracking_location'] != null ? new TrackingLocation.fromJson(json['origin_tracking_location']) : null;
		destinationLocation = json['destination_location'];
		destinationTrackingLocation = json['destination_tracking_location'] != null ? new TrackingLocation.fromJson(json['destination_tracking_location']) : null;
		guaranteedDeliveryDate = json['guaranteed_delivery_date'];
		alternateIdentifier = json['alternate_identifier'];
		initialDeliveryAttempt = json['initial_delivery_attempt'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['object'] = this.object;
		data['service'] = this.service;
		data['container_type'] = this.containerType;
		data['est_delivery_date_local'] = this.estDeliveryDateLocal;
		data['est_delivery_time_local'] = this.estDeliveryTimeLocal;
		data['origin_location'] = this.originLocation;
		if (this.originTrackingLocation != null) {
      data['origin_tracking_location'] = this.originTrackingLocation.toJson();
    }
		data['destination_location'] = this.destinationLocation;
		if (this.destinationTrackingLocation != null) {
      data['destination_tracking_location'] = this.destinationTrackingLocation.toJson();
    }
		data['guaranteed_delivery_date'] = this.guaranteedDeliveryDate;
		data['alternate_identifier'] = this.alternateIdentifier;
		data['initial_delivery_attempt'] = this.initialDeliveryAttempt;
		return data;
	}
}
