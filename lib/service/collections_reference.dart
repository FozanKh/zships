import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseCollections {
  static final _databaseReference = FirebaseFirestore.instance;
  // collections reference
  final CollectionReference users = _databaseReference.collection('users');
}
