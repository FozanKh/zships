import 'dart:developer';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:zships/auth/model/user.dart';
import 'package:zships/constants/validate.dart';
import 'package:zships/service/collectionsReference.dart';
import 'package:zships/service/sharedPreferences.dart';

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

  saveDeviceToken({String newUid, String fcmToken}) async {
    // Save it to Firestore
    log('Saving token to firestore: \n uid: $newUid\ntoken: $fcmToken');
    if (newUid == null) {
      log('uid = $newUid, could not save token, getting the token again');
      newUid = await AppSharedPreferences.instance.getUid();
      log('uid = $newUid, could not save token, getting the token again');
    }
    if (fcmToken != null && safeIsNotEmpty(newUid)) {
      await collections.users.doc(newUid).collection('tokens').doc(fcmToken).set({
        'token': fcmToken,
        'createdAt': Timestamp.now(), // optional
        'platform': Platform.operatingSystem // optional
      });
      log('Token saved: \n uid: $newUid\ntoken: $fcmToken');
    }
  }

  removeDeviceToken({String newUid, String fcmToken}) async {
    // Save it to Firestore
    log('removing token from firestore: \n uid: $newUid\ntoken: $fcmToken');
    if (newUid == null) {
      log('uid = $newUid, could not removed token, getting the token again');
      newUid = await AppSharedPreferences.instance.getUid();
      log('uid = $newUid, could not removed token, getting the token again');
    }
    if (fcmToken != null && safeIsNotEmpty(newUid)) {
      await collections.restaurants.doc(newUid).collection('tokens').doc(fcmToken).delete();
      log('Token removed: \n uid: $newUid\ntoken: ${fcmToken.substring(0, 50)}');
    }
  }

  // Get a stream of the user document
  Stream<User> get firebaseUser {
    return collections.users.doc(uid).snapshots().map((snap) => User.fromMap(snap.data()));
  }

  Future<User> get firebaseUserData async {
    return await collections.users.doc(uid).snapshots().map((snap) => User.fromMap(snap.data())).first;
  }

  Future<Map<String, dynamic>> getUserData() async {
    final String uid = await getUid();
    Map<String, dynamic> result;
    await collections.users.doc(uid).get().then((dataSnapshot) {
      if (dataSnapshot.exists) {
        result = dataSnapshot.data();
      }
    });
    return result;
  }

  Future<Map<String, dynamic>> getVersionData() async {
    return await collections.versionUpdates.get().then((value) => value.docs.first.data());
  }
}
