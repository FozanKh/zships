import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:zships/constants/validate.dart';

class FirebaseCollections {
  static final _databaseReference = FirebaseFirestore.instance;

  // collections reference
  final CollectionReference users = _databaseReference.collection('users');
  final CollectionReference versionUpdates = _databaseReference.collection('version').doc("planner").collection("flutter");
  final CollectionReference restaurants = _databaseReference.collection('restaurants');
  final CollectionReference orders = _databaseReference.collection('orders');
  // final CollectionReference feedbacks = _databaseReference.collection('feedbacks');
  // final CollectionReference posts = _databaseReference.collection('posts');
  // final CollectionReference events = _databaseReference.collection('events');
  // final CollectionReference eventsPreferences = _databaseReference.collection('events');

  CollectionReference carts({String uid}) {
    if (safeIsNotEmpty(uid))
      return users.doc(uid).collection("carts");
    else
      return null;
  }

  CollectionReference menus({String restaurantId}) {
    return restaurants.doc(restaurantId).collection("menus");
  }
}
