import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:zships/core/model/shipment.dart';
import 'package:zships/globals.dart';
import 'package:zships/service/api/api_endpoints.dart';
import 'package:zships/service/api/api_private_keys.dart';

class ApiService {
  static ApiService _instance;

  static ApiService get instance {
    if (_instance == null) {
      _instance = ApiService();
      return _instance;
    } else
      return _instance;
  }

  gettingAllShipments() async {
    var uname = ApiPrivateKeys.instance.testingKey;
    var pword = '';
    var authn = 'Basic ' + base64Encode(utf8.encode('$uname:$pword'));

    var data = {
      'page_size': '1',
      'start_datetime': '2016-01-02T08:50:00Z',
    };

    var res = await http.get('${ApiEndPoints.instance.baseUrl}/v2/shipments/', headers: {'Authorization': authn});
    print('http.post statusCode= ${res.statusCode}');
    var result = jsonDecode(res.body);
    log(res.body);
    allShipments.clear();
    result['shipments'].forEach((v) {
      allShipments.add(Shipment.fromMap(v));
    });
  }

  Future<void> helloF() async {
    // HttpsCallable callable = FirebaseFunctions.instance.httpsCallable('listFruit');
    // final results = await callable();
    // var fruit = results.data; // ["Apple", "Banana", "Cherry", "Date", "Fig", "Grapes"]
    // print(fruit);
    var uname = ApiPrivateKeys.instance.testingKey;
    var pword = '';
    var authn = 'Basic ' + base64Encode(utf8.encode('$uname:$pword'));

    var data = 'rate[id]={rate_d8d681cd8c034643922fafaf255d331d}';

    var res = await http.post('${ApiEndPoints.instance.baseUrl}/v2/shipments/shp_54a1ee7b4fbb471998cfb638f6445c54/buy/',
        headers: {'Authorization': authn}, body: data);
    print('http.post statusCode= ${res.statusCode}');
    print(res.body);
  }

  gettingShipment() async {
    var uname = ApiPrivateKeys.instance.testingKey;
    var pword = '';
    var authn = 'Basic ' + base64Encode(utf8.encode('$uname:$pword'));
    var shipmentId = 'shp_54a1ee7b4fbb471998cfb638f6445c54';
    var res = await http.get('${ApiEndPoints.instance.baseUrl}/v2/shipments/$shipmentId', headers: {'Authorization': authn});
    print('http.get: statusCode= ${res.statusCode}');
    print(res.body);
  }

  createSampleShipment() async {
    var uname = ApiPrivateKeys.instance.testingKey;
    var pword = '';
    var authn = 'Basic ' + base64Encode(utf8.encode('$uname:$pword'));

    var data = {
      'shipment[to_address][name]': 'Safwan',
      'shipment[to_address][street1]': 'King Fahad Road',
      'shipment[to_address][city]': 'Jaddah',
      'shipment[to_address][state]': 'TX',
      'shipment[to_address][zip]': '75011',
      'shipment[to_address][country]': 'US',
      'shipment[to_address][phone]': '0548766248',
      'shipment[to_address][email]': 'fozan.kh@icloud.com',
      'shipment[from_address][name]': 'Khalid',
      'shipment[from_address][street1]': 'KFUPM Campus',
      'shipment[from_address][street2]': 'B 857',
      'shipment[from_address][city]': 'Dhahran',
      'shipment[from_address][state]': 'NY',
      'shipment[from_address][zip]': '10002',
      'shipment[from_address][country]': 'US',
      'shipment[from_address][phone]': '0505626820',
      'shipment[from_address][email]': 'FozanAlkhalawi@gmail.com',
      'shipment[parcel][length]': '20.2',
      'shipment[parcel][width]': '10.9',
      'shipment[parcel][height]': '5',
      'shipment[parcel][weight]': '65.9',
      'shipment[customs_info][id]': 'cstinfo_Safwan',
    };

    var res = await http.post('${ApiEndPoints.instance.baseUrl}/v2/shipments', headers: {'Authorization': authn}, body: data);
    print('http.post statusCode= ${res.statusCode}');
    log(res.body);
  }

  sampleRate(String fromZipCode, String toZipCode) async {
    var uname = ApiPrivateKeys.instance.testingKey;
    var pword = '';
    var authn = 'Basic ' + base64Encode(utf8.encode('$uname:$pword'));

    var data = {
      'shipment[to_address][zip]': fromZipCode,
      'shipment[from_address][zip]': toZipCode,
      'shipment[parcel][weight]': '65.9',
    };

    var res = await http.post('${ApiEndPoints.instance.baseUrl}/v2/shipments', headers: {'Authorization': authn}, body: data);
    print('http.post statusCode= ${res.statusCode}');
    // log(res.body);
    var result = jsonDecode(res.body);
    log(result.toString());
    Shipment s = Shipment.fromMap(result);
    return s;
  }
}
