import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:zships/ship_engine/models/rate/se_rate.dart';
import 'package:zships/ship_engine/models/track/shipment_track.dart';
import 'package:zships/ship_engine/service/se_services.dart';

enum ApiProvider { ShipEngine, EasyPost }

extension ApiProviderHelper on ApiProvider {
  bool get isShipEngine => this == ApiProvider.ShipEngine;
  bool get isEasyPost => this == ApiProvider.EasyPost;
}

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

  fetchAllShipment() async {
    assert(key != null);

    if (provider.isShipEngine)
      return await ShipEngineServices.instance.fetchAllShipment();
    else if (provider.isEasyPost)
      return await ShipEngineServices.instance.fetchAllShipment();
    else
      return await ShipEngineServices.instance.fetchAllShipment();
  }

  // createLabel() async {
  //   assert(key != null);

  //   var headers = {
  //     'API-Key': key,
  //     'Content-Type': 'application/json',
  //   };
  //   var data = '{ "label_format":"pdf", "label_layout": "4x6", "label_download_type": "url" }';
  //   var res = await http.post('https://api.shipengine.com/v1/labels/shipment/se-88294503', headers: headers, body: data);
  //   print('http.post error: statusCode= ${res.statusCode}');
  //   log(res.body);
  // }

  createSampleShipment(String shipment) async {
    assert(key != null);

    var headers = {
      'API-Key': key,
      'Content-Type': 'application/json',
    };

    // var data =
    //     '{ "shipments": [ { "validate_address": "no_validation", "service_code": "usps_priority_mail", "external_shipment_id": "1daa0c22-0519-46d0-8653-9f3dc62e7d2c", "ship_to": { "name": "Amanda Miller", "phone": "555-555-5555", "address_line1": "525 S Winchester Blvd", "city_locality": "San Jose", "state_province": "CA", "postal_code": "95128", "country_code": "US", "address_residential_indicator": "yes" }, "ship_from": { "company_name": "Example Corp.", "name": "John Doe", "phone": "111-111-1111", "address_line1": "4009 Marathon Blvd", "address_line2": "Suite 300", "city_locality": "Austin", "state_province": "TX", "postal_code": "78756", "country_code": "US", "address_residential_indicator": "no" }, "confirmation": "none", "advanced_options": {}, "insurance_provider": "none", "tags": [], "packages": [ { "weight": { "value": 1.0, "unit": "ounce" } } ] } ] }';

    var res = await http.post('https://api.shipengine.com/v1/shipments', headers: headers, body: shipment);
    print('http.post error: statusCode= ${res.statusCode}');
    // print(res.body);
    log(res.body);
  }

  // sampleRate(String fromZipCode, String toZipCode) async {
  rateByShipmentId({String shipmentId}) async {
    assert(key != null);

    if (provider.isShipEngine)
      return await ShipEngineServices.instance.rateByShipmentId(shipmentId: shipmentId);
    else if (provider.isEasyPost)
      return await ShipEngineServices.instance.rateByShipmentId(shipmentId: shipmentId);
    else
      return await ShipEngineServices.instance.rateByShipmentId(shipmentId: shipmentId);
  }

  // Change this to list of dynamic or a generic Rate model, in order to support multiple APIs
  Future<List<RateSE>> estimateRate({String fromPostalCode = '11564', String toPostalCode = '24230', String weight = '5.0'}) async {
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

  // void createLabel() async {
  //   var headers = {
  //     'API-Key': key,
  //     'Content-Type': 'application/json',
  //   };

  //   var data =
  //       '{ "shipment": { "service_code": "ups_ground", "ship_to": { "name": "Jane Doe", "address_line1": "525 S Winchester Blvd", "city_locality": "San Jose", "state_province": "CA", "postal_code": "95128", "country_code": "US", "address_residential_indicator": "yes" }, "ship_from": { "name": "John Doe", "company_name": "Example Corp", "phone": "555-555-5555", "address_line1": "4009 Marathon Blvd", "city_locality": "Austin", "state_province": "TX", "postal_code": "78756", "country_code": "US", "address_residential_indicator": "no" }, "packages": [ { "weight": { "value": 20, "unit": "ounce" }, "dimensions": { "height": 6, "width": 12, "length": 24, "unit": "inch" } } ] } }';

  //   var res = await http.post('https://api.shipengine.com/v1/labels', headers: headers, body: data);
  //   if (res.statusCode != 200) throw Exception('http.post error: statusCode= ${res.statusCode}');
  //   print(res.body);
  // }
}
// class ApiService {
//   static ApiService _instance;

//   static ApiService get instance {
//     if (_instance == null) {
//       _instance = ApiService();
//       return _instance;
//     } else
//       return _instance;
//   }

//   String key;

//   List<Shipment> allShipments = [];

//   retrieveAllShipment() async {
//     assert(key != null);
//     var pword = '';
//     var authn = 'Basic ' + base64Encode(utf8.encode('$key:$pword'));

//     var data = {
//       'page_size': '1',
//       'start_datetime': '2016-01-02T08:50:00Z',
//     };

//     var res = await http.get('${ApiEndPoints.instance.baseUrl}/v2/shipments?purchased=false', headers: {'Authorization': authn});
//     print('http.post statusCode = ${res.statusCode}');
//     var result = jsonDecode(res.body);
//     log(res.body);
//     allShipments.clear();
//     result['shipments'].forEach((v) {
//       allShipments.add(Shipment.fromMap(v));
//     });
//   }

//   Future<void> buyShipment() async {
//     assert(key != null);

//     var pword = '';
//     var authn = 'Basic ' + base64Encode(utf8.encode('$key:$pword'));

//     var data = 'rate[id]={rate_d8d681cd8c034643922fafaf255d331d}';

//     var res = await http.post('${ApiEndPoints.instance.baseUrl}/v2/shipments/shp_54a1ee7b4fbb471998cfb638f6445c54/buy/',
//         headers: {'Authorization': authn}, body: data);
//     print('http.post statusCode= ${res.statusCode}');
//     print(res.body);
//   }

//   retrieveShipment() async {
//     assert(key != null);

//     var pword = '';
//     var authn = 'Basic ' + base64Encode(utf8.encode('$key:$pword'));
//     var shipmentId = 'shp_54a1ee7b4fbb471998cfb638f6445c54';
//     var res = await http.get('${ApiEndPoints.instance.baseUrl}/v2/shipments/$shipmentId', headers: {'Authorization': authn});
//     print('http.get: statusCode= ${res.statusCode}');
//     // print(res.body);
//   }

//   createSampleShipment() async {
//     assert(key != null);

//     var pword = '';
//     var authn = 'Basic ' + base64Encode(utf8.encode('$key:$pword'));

//     var data = {
//       'shipment[to_address][name]': 'Safwan',
//       'shipment[to_address][street1]': 'King Fahad Road',
//       'shipment[to_address][city]': 'Jaddah',
//       'shipment[to_address][state]': 'TX',
//       'shipment[to_address][zip]': '75011',
//       'shipment[to_address][country]': 'US',
//       'shipment[to_address][phone]': '0548766248',
//       'shipment[to_address][email]': 'fozan.kh@icloud.com',
//       'shipment[from_address][name]': 'Khalid',
//       'shipment[from_address][street1]': 'KFUPM Campus',
//       'shipment[from_address][street2]': 'B 857',
//       'shipment[from_address][city]': 'Dhahran',
//       'shipment[from_address][state]': 'NY',
//       'shipment[from_address][zip]': '10002',
//       'shipment[from_address][country]': 'US',
//       'shipment[from_address][phone]': '0505626820',
//       'shipment[from_address][email]': 'FozanAlkhalawi@gmail.com',
//       'shipment[parcel][length]': '20.2',
//       'shipment[parcel][width]': '10.9',
//       'shipment[parcel][height]': '5',
//       'shipment[parcel][weight]': '65.9',
//       'shipment[customs_info][id]': 'cstinfo_Safwan',
//     };

//     var res = await http.post('${ApiEndPoints.instance.baseUrl}/v2/shipments', headers: {'Authorization': authn}, body: data);
//     print('http.post statusCode= ${res.statusCode}');
//     // log(res.body);
//   }

//   sampleRate(String fromZipCode, String toZipCode) async {
//     assert(key != null);

//     var pword = '';
//     var authn = 'Basic ' + base64Encode(utf8.encode('$key:$pword'));

//     var data = {
//       'shipment[to_address][zip]': fromZipCode,
//       'shipment[from_address][zip]': toZipCode,
//       'shipment[parcel][weight]': '65.9',
//     };

//     var res = await http.post('${ApiEndPoints.instance.baseUrl}/v2/shipments', headers: {'Authorization': authn}, body: data);
//     print('http.post statusCode= ${res.statusCode}');
//     // log(res.body);
//     var result = jsonDecode(res.body);
//     // log(result.toString());
//     Shipment s = Shipment.fromMap(result);
//     return s;
//   }
// }
