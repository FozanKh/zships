import 'package:zships/service/cloud_functions.dart';
import 'package:zships/ship_engine/models/rate/se_rate.dart';
import 'package:zships/ship_engine/models/se_shipment.dart';
import 'package:zships/ship_engine/models/track/shipment_track.dart';
import 'package:zships/ship_engine/service/se_services.dart';

enum ApiProvider { ShipEngine, EasyPost }

extension ApiProviderHelper on ApiProvider {
  bool get isShipEngine => this == ApiProvider.ShipEngine;
  bool get isEasyPost => this == ApiProvider.EasyPost;
}

/// this class the used as a wrapper to the actual API service, which will enable the support for multiple APIs
class ApiService {
  static ApiService _instance;

  static ApiService get instance {
    if (_instance == null) {
      _instance = ApiService();
      return _instance;
    } else
      return _instance;
  }

  ApiProvider provider = ApiProvider.ShipEngine;
  String key;

  Future<void> getApiKey() async {
    key = await CloudFunctions.instance.getApiKey();
    setProviderKey();
  }

  void setProviderKey() {
    if (provider.isShipEngine)
      ShipEngineServices.instance.getKey();
    else if (provider.isEasyPost)
      ShipEngineServices.instance.getKey();
    else
      ShipEngineServices.instance.getKey();
  }

  Future<List<ShipmentSE>> fetchAllShipment() async {
    assert(key != null, 'Key is not available!');
    // Will be customized when supporting multiple APIs
    if (provider.isShipEngine)
      return await ShipEngineServices.instance.fetchAllShipment();
    else if (provider.isEasyPost)
      return await ShipEngineServices.instance.fetchAllShipment();
    else
      return await ShipEngineServices.instance.fetchAllShipment();
  }

  Future<void> createShipment(String shipment) async {
    assert(key != null, 'Key is not available!');
    // Will be customized when supporting multiple APIs
    if (provider.isShipEngine)
      return await ShipEngineServices.instance.createShipment(shipment: shipment);
    else if (provider.isEasyPost)
      return await ShipEngineServices.instance.createShipment(shipment: shipment);
    else
      return await ShipEngineServices.instance.createShipment(shipment: shipment);
  }

  Future<List<RateSE>> rateByShipmentId({String shipmentId}) async {
    assert(key != null, 'Key is not available!');
    // Will be customized when supporting multiple APIs
    if (provider.isShipEngine)
      return await ShipEngineServices.instance.rateByShipmentId(shipmentId: shipmentId);
    else if (provider.isEasyPost)
      return await ShipEngineServices.instance.rateByShipmentId(shipmentId: shipmentId);
    else
      return await ShipEngineServices.instance.rateByShipmentId(shipmentId: shipmentId);
  }

  Future<List<RateSE>> estimateRate({String fromPostalCode, String toPostalCode, String weight}) async {
    assert(key != null, 'Key is not available');
    // Will be customized when supporting multiple APIs
    if (provider.isShipEngine)
      return await ShipEngineServices.instance.estimateRate(fromPostalCode: fromPostalCode, toPostalCode: toPostalCode, weight: weight);
    else if (provider.isEasyPost)
      return await ShipEngineServices.instance.estimateRate(fromPostalCode: fromPostalCode, toPostalCode: toPostalCode, weight: weight);
    else
      return await ShipEngineServices.instance.estimateRate(fromPostalCode: fromPostalCode, toPostalCode: toPostalCode, weight: weight);
  }

  Future<ShipmentTrack> trackByLabel({String labelId}) async {
    assert(key != null, 'Key is not available');
    // Will be customized when supporting multiple APIs
    if (provider.isShipEngine)
      return await ShipEngineServices.instance.trackByLabelId(labelId);
    else if (provider.isEasyPost)
      return await ShipEngineServices.instance.trackByLabelId(labelId);
    else
      return await ShipEngineServices.instance.trackByLabelId(labelId);
  }

  Future<ShipmentTrack> trackByTrackNumber({String trackNumber, String carrierCode}) async {
    assert(key != null, 'Key is not available');
    // Will be customized when supporting multiple APIs
    if (provider.isShipEngine)
      return await ShipEngineServices.instance.trackByTrackNumber(trackNumber, carrierCode);
    else if (provider.isEasyPost)
      return await ShipEngineServices.instance.trackByTrackNumber(trackNumber, carrierCode);
    else
      return await ShipEngineServices.instance.trackByTrackNumber(trackNumber, carrierCode);
  }
}
