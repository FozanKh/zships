import 'package:zships/core/model/address/address.dart';
import 'package:zships/core/model/fees.dart';
import 'package:zships/core/model/options.dart';
import 'package:zships/core/model/parcel.dart';
import 'package:zships/core/model/postage_label.dart';
import 'package:zships/core/model/rate.dart';
import 'package:zships/core/model/tracking/tracker.dart';

class Shipment {
  List<String> messages;
  String createdAt;
  bool isReturn;
  String mode;
  Options options;
  String reference;
  String status;
  String trackingCode;
  String updatedAt;
  String batchId;
  String batchStatus;
  String batchMessage;
  String customsInfo;
  Address fromAddress;
  Address returnAddress;
  Address buyerAddress;
  String insurance;
  String orderId;
  Parcel parcel;
  PostageLabel postageLabel;
  List<Rate> rates;
  String refundStatus;
  String scanForm;
  Rate selectedRate;
  Tracker tracker;
  int uspsZone;
  List<String> forms;
  List<Fees> fees;
  String id;
  String object;

  Shipment({
    this.createdAt,
    this.isReturn,
    this.messages,
    this.mode,
    this.options,
    this.reference,
    this.status,
    this.trackingCode,
    this.updatedAt,
    this.batchId,
    this.batchStatus,
    this.batchMessage,
    this.customsInfo,
    this.fromAddress,
    this.returnAddress,
    this.buyerAddress,
    this.insurance,
    this.orderId,
    this.parcel,
    this.postageLabel,
    this.rates,
    this.refundStatus,
    this.scanForm,
    this.selectedRate,
    this.tracker,
    this.uspsZone,
    this.forms,
    this.fees,
    this.id,
    this.object,
  });

  Shipment.fromMap(Map<String, dynamic> map) {
    createdAt = map['created_at'];
    isReturn = map['is_return'];
    messages = map['messages'].cast<String>();
    mode = map['mode'];
    options = map['options'] != null ? Options.fromMap(map['options']) : null;
    reference = map['reference'];
    status = map['status'];
    trackingCode = map['tracking_code'];
    updatedAt = map['updated_at'];
    batchId = map['batch_id'];
    batchStatus = map['batch_status'];
    batchMessage = map['batch_message'];
    customsInfo = map['customs_info'];
    fromAddress = map['from_address'] != null ? Address.fromMap(map['from_address'] as Map<String, dynamic>) : null;
    returnAddress = map['return_address'] != null ? Address.fromMap(map['return_address'] as Map<String, dynamic>) : null;
    buyerAddress = map['buyer_address'] != null ? Address.fromMap(map['buyer_address'] as Map<String, dynamic>) : null;
    insurance = map['insurance'];
    orderId = map['order_id'];
    parcel = map['parcel'] != null ? Parcel.fromMap(map['parcel']) : null;
    postageLabel = map['postage_label'] != null ? PostageLabel.fromMap(map['postage_label'] as Map<String, dynamic>) : null;
    if (map['rates'] != null) {
      rates = List<Rate>();
      map['rates'].forEach((v) {
        rates.add(Rate.fromMap(v));
      });
    }
    refundStatus = map['refund_status'];
    scanForm = map['scan_form'];
    selectedRate = map['selected_rate'] != null ? Rate.fromMap(map['selected_rate'] as Map<String, dynamic>) : null;
    tracker = map['tracker'] != null ? Tracker.fromJson(map['tracker'] as Map<String, dynamic>) : null;
    uspsZone = map['usps_zone'];
    forms = map['forms'].cast<String>();
    if (map['fees'] != null) {
      fees = List<Fees>();
      map['fees'].forEach((v) {
        fees.add(Fees.fromJson(v));
      });
    }
    id = map['id'];
    object = map['object'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['created_at'] = this.createdAt;
    data['is_return'] = this.isReturn;
    data['messages'] = this.messages;
    data['mode'] = this.mode;
    if (this.options != null) {
      data['options'] = this.options.toJson();
    }
    data['reference'] = this.reference;
    data['status'] = this.status;
    data['tracking_code'] = this.trackingCode;
    data['updated_at'] = this.updatedAt;
    data['batch_id'] = this.batchId;
    data['batch_status'] = this.batchStatus;
    data['batch_message'] = this.batchMessage;
    data['customs_info'] = this.customsInfo;
    if (this.fromAddress != null) {
      data['from_address'] = this.fromAddress.toJson();
    }
    if (this.returnAddress != null) {
      data['return_address'] = this.returnAddress.toJson();
    }
    if (this.buyerAddress != null) {
      data['buyer_address'] = this.buyerAddress.toJson();
    }
    data['insurance'] = this.insurance;
    data['order_id'] = this.orderId;
    if (this.parcel != null) {
      data['parcel'] = this.parcel.toJson();
    }
    data['postage_label'] = this.postageLabel.toMap();
    if (this.rates != null) {
      data['rates'] = this.rates.map((v) => v.toJson()).toList();
    }
    data['refund_status'] = this.refundStatus;
    data['scan_form'] = this.scanForm;
    data['selected_rate'] = this.selectedRate.toJson();
    data['tracker'] = this.tracker;
    data['usps_zone'] = this.uspsZone;
    data['forms'] = this.forms;
    if (this.fees != null) {
      data['fees'] = this.fees.map((v) => v.toJson()).toList();
    }
    data['id'] = this.id;
    data['object'] = this.object;
    return data;
  }

  @override
  String toString() {
    return 'Shipment(messages: $messages, createdAt: $createdAt, isReturn: $isReturn, mode: $mode, options: $options, reference: $reference, status: $status, trackingCode: $trackingCode, updatedAt: $updatedAt, batchId: $batchId, batchStatus: $batchStatus, batchMessage: $batchMessage, customsInfo: $customsInfo, fromAddress: $fromAddress, insurance: $insurance, orderId: $orderId, parcel: $parcel, postageLabel: $postageLabel, rates: $rates, refundStatus: $refundStatus, scanForm: $scanForm, selectedRate: $selectedRate, tracker: $tracker, uspsZone: $uspsZone, forms: $forms, fees: $fees, id: $id, object: $object)';
  }
}
