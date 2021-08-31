import 'package:cloud_functions/cloud_functions.dart';

class CloudFunctions {
  static CloudFunctions _instance;

  static CloudFunctions get instance {
    if (_instance == null) _instance = CloudFunctions();
    return _instance;
  }

  // getting the ApiKey through a cloud function to have it decrypted first
  Future<String> getApiKey() async {
    HttpsCallable callable = FirebaseFunctions.instance.httpsCallable('getApiKey');
    final results = await callable();
    print(results.data);
    return results.data;
  }

  // saving the ApiKey through a cloud function to have it encrypted first
  Future<void> setApiKey(String apiKey) async {
    HttpsCallable callable = FirebaseFunctions.instance.httpsCallable('setApiKey');
    await callable({"apiKey": apiKey});
  }
}
