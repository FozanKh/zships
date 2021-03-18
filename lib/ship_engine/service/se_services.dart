import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:zships/constants/validate.dart';
import 'package:zships/service/api/api_endpoints.dart';
import 'package:zships/service/api/api_service.dart';
import 'package:zships/ship_engine/models/label/se_label.dart';
import 'package:zships/ship_engine/models/rate/se_rate.dart';
import 'package:zships/ship_engine/models/se_shipment.dart';
import 'package:zships/ship_engine/models/track/shipment_track.dart';

class ShipEngineServices {
  static ShipEngineServices _instance;

  static ShipEngineServices get instance {
    if (_instance == null) {
      _instance = ShipEngineServices();
      return _instance;
    } else
      return _instance;
  }

  String key;

  ShipEngineServices() {
    key = ApiService.instance.key;
  }

  bool getKey() {
    key = ApiService.instance.key;
    return safeIsNotEmpty(key);
  }

  Future<List<ShipmentSE>> fetchDynamicShipment(String pageSize, String page) async {
    assert(key != null ? true : getKey(), 'Key is not available');
    var headers = {'API-Key': key};

    var params = {
      'page': '$page',
      'page_size': '$pageSize',
      'sort_dir': 'desc',
      'sort_by': 'created_at',
    };
    var query = params.entries.map((p) => '${p.key}=${p.value}').join('&');

    http.Response res = await http.get('${ApiEndPoints.instance.seBaseUrl}shipments?$query', headers: headers);

    if (await validateResponse(res)) {
      Map<String, dynamic> result = jsonDecode(res.body);
      List<ShipmentSE> shipments = [];
      if (result.isNotEmpty) {
        result['shipments'].forEach((v) {
          shipments.add(ShipmentSE.fromMap(v));
        });
        log(res.body);
        return shipments;
      } else {
        throw ('No Shipments linked to this account');
      }
    } else {
      throw ('Error, could not get shipments, try again later');
    }
  }

  Future<List<ShipmentSE>> fetchAllShipment() async {
    assert(key != null ? true : getKey(), 'Key is not available');
    var headers = {'API-Key': key};

    http.Response res = await http.get('${ApiEndPoints.instance.seBaseUrl}shipments', headers: headers);

    if (await validateResponse(res)) {
      Map<String, dynamic> result = jsonDecode(res.body);
      List<ShipmentSE> shipments = [];
      if (result.isNotEmpty) {
        result['shipments'].forEach((v) {
          shipments.add(ShipmentSE.fromMap(v));
        });
        log(res.body);
        return shipments;
      } else {
        throw ('No Shipments linked to this account');
      }
    } else {
      throw ('Error, could not get shipments, try again later');
    }
  }

  Future<List<RateSE>> estimateRate({String fromPostalCode, String toPostalCode, String weight}) async {
    assert(key != null ? true : getKey(), 'Key is not available');
    List<RateSE> rates = [];

    var headers = {
      'API-Key': key,
      'Content-Type': 'application/json',
    };

    var data =
        '{ "carrier_ids": [ "se-550025","se-550026","se-550027" ], "from_postal_code": "$fromPostalCode", "from_country_code": "US", "to_postal_code": "$toPostalCode", "to_country_code": "US", "weight": { "value": $weight, "unit": "kilogram" } }';

    http.Response res = await http.post('${ApiEndPoints.instance.seBaseUrl}rates/estimate', headers: headers, body: data);
    if (await validateResponse(res)) {
      log(res.body);
      List<dynamic> result = jsonDecode(res.body);
      result.forEach((rate) {
        rates.add(RateSE.fromMap(rate));
      });
      return rates;
    } else {
      throw ('Error, could get rate for these addresses');
    }
  }

  Future<List<RateSE>> rateByShipmentId({String shipmentId}) async {
    assert(key != null ? true : getKey(), 'Key is not available');
    List<RateSE> rates = [];

    var headers = {
      'API-Key': key,
      'Content-Type': 'application/json',
    };

    var data = '{ "shipment_id": "$shipmentId", "rate_options": { "carrier_ids": [ "se-550025","se-550026","se-550027" ] } }';

    http.Response res = await http.post('${ApiEndPoints.instance.seBaseUrl}rates', headers: headers, body: data);

    if (await validateResponse(res)) {
      log(res.body);
      List<dynamic> result = jsonDecode(res.body);
      result.forEach((rate) {
        rates.add(RateSE.fromMap(rate));
      });
      return rates;
    } else {
      throw ('Error, could get rates for this shipment');
    }
  }

  Future<ShipmentTrack> trackByLabelId(String labelId) async {
    assert(key != null ? true : getKey(), 'Key is not available');

    var headers = {'API-Key': key, 'Cache-Control': 'no-cache'};
    http.Response res = await http.get('${ApiEndPoints.instance.seBaseUrl}labels/$labelId/track', headers: headers);
    if (await validateResponse(res)) {
      log(res.body);
      Map<String, dynamic> result = jsonDecode(res.body);
      return ShipmentTrack.fromMap(result);
    } else {
      throw ('Error, could not track shipment with label $labelId');
    }
  }

  Future<ShipmentTrack> trackByTrackNumber(String trackNumber, String carrierCode) async {
    assert(key != null ? true : getKey(), 'Key is not available');

    var headers = {
      'API-Key': key,
      'Cache-Control': 'no-cache',
    };

    http.Response res =
        await http.get('${ApiEndPoints.instance.seBaseUrl}tracking?carrier_code=$carrierCode&tracking_number=$trackNumber', headers: headers);
    if (await validateResponse(res)) {
      log(res.body);
      Map<String, dynamic> result = jsonDecode(res.body);
      return ShipmentTrack.fromMap(result);
    } else {
      throw ('Error, could not track shipment with track number $trackNumber');
    }
  }

  Future<List<LabelSE>> getLabelByShipmentId({String shipmentId}) async {
    assert(key != null ? true : getKey(), 'Key is not available');
    log(key);
    var headers = {
      'API-Key': key,
      'Cache-Control': 'no-cache',
    };
    http.Response res = await http.get('${ApiEndPoints.instance.seBaseUrl}labels?shipment_id=$shipmentId', headers: headers);
    if (await validateResponse(res)) {
      Map<String, dynamic> result = jsonDecode(res.body);
      if (result['total'] > 0) {
        List<dynamic> mapLabels = result['labels'];
        List<LabelSE> labels = [];
        mapLabels.forEach((label) {
          labels.add(LabelSE.fromMap(label));
        });
        return labels;
      } else
        throw ('Could not find a label for this shipment with ID $shipmentId');
    } else {
      throw ('Error, could not track shipment with ID $shipmentId');
    }
  }

  Future<List<LabelSE>> createLabelByShipmentId({String shipmentId}) async {
    assert(key != null ? true : getKey(), 'Key is not available');
    var headers = {
      'API-Key': key,
      'Content-Type': 'application/json',
    };
    var data = '{ "label_format":"pdf", "label_layout": "4x6", "label_download_type": "url" }';
    http.Response res = await http.post('https://api.shipengine.com/v1/labels/shipment/$shipmentId', headers: headers, body: data);

    if (await validateResponse(res)) {
      log(res.body);
      Map<String, dynamic> result = jsonDecode(res.body);
      return <LabelSE>[LabelSE.fromMap(result)];
    } else {
      throw ('Error, could create label for this shipment with ID $shipmentId');
    }
  }

  Future<void> createShipment({String shipment}) async {
    assert(key != null ? true : getKey(), 'Key is not available');
    var headers = {'API-Key': key, 'Content-Type': 'application/json'};

    http.Response res = await http.post('https://api.shipengine.com/v1/shipments', headers: headers, body: shipment);

    if (await validateResponse(res)) {
      log(res.body);
    } else {
      throw ('Error, could create this shipment');
    }
  }

  Future<bool> validateResponse(http.Response res) async {
    log('Response status code = ${res.statusCode}');
    if (await checkConnection() == false) throw ('Please check your internet connection and try again');
    log(res.body);
    switch (res.statusCode) {
      case 200:
        return true;
      case 201:
        return true;
      case 400:
        throw ('${jsonDecode(res.body)['errors'].first["message"]}');
      case 401:
        throw ('Error, invalid API key, update you API key from settings');
      case 405:
        throw ('Error, invalid request, contact the developer at @FozanKh on Github or Twitter');
      default:
        return false;
    }
  }
}
