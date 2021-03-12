import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:zships/service/collections_reference.dart';
import 'package:zships/service/shared_preferences.dart';

class DatabaseService {
  static DatabaseService _instance;
  static DatabaseService get instance {
    if (_instance == null) {
      _instance = DatabaseService();
      return _instance;
    } else
      return _instance;
  }

  String uid;
  final AppSharedPreferences local = AppSharedPreferences();
  final FirebaseCollections collections = FirebaseCollections();
  DatabaseService({this.uid});

  setValues({String uid}) {
    uid = uid;
  }

  Future<String> getUid() async {
    return await local.getUid();
  }

  Future createUser({String newUid, String phone, String name, String email}) async {
    print('creating user document');
    return await collections.users.doc(newUid).set({
      'uid': newUid,
      'phone': phone,
      'name': name,
      'email': email,
    }, SetOptions(merge: true));
  }

  Future deleteUser() async {
    try {
      await collections.users.doc(uid).delete();
    } catch (e) {
      print(e);
    }
  }

  Future updateUserKey({String newUid, String key}) async {
    print('updating user key');
    return await collections.users.doc(newUid).set({'apiKey': key}, SetOptions(merge: true));
  }

  Future getUserKey({String newUid}) async {
    print('updating user key');
    Map<String, dynamic> result;
    await collections.users.doc(newUid).get().then((dataSnapshot) {
      if (dataSnapshot.exists) {
        result = dataSnapshot.data();
      }
    });
    return result['apiKey'];
  }
}
