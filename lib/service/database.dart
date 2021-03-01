import 'dart:developer';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_storage/firebase_storage.dart';
import 'package:zships/auth/model/user.dart';
import 'package:zships/constants/validate.dart';
import 'package:zships/service/collectionsReference.dart';
import 'package:zships/service/dataStructure.dart';
import 'package:zships/service/sharedPreferences.dart';
import 'package:uuid/uuid.dart';

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
  final _currentTimeStamp = Timestamp.now();
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

  Future<void> editUserEmail({String emailAdders, bool isVerified, Timestamp lastUpdated}) async {
    final String uid = await getUid();
    return await collections.users.doc(uid).update(emailStructure(emailAdders: emailAdders, isVerified: isVerified, lastUpdated: _currentTimeStamp));
  }

  Future<void> editUserName({String firstName, String lastName}) async {
    final String uid = await getUid();
    return await collections.users.doc(uid).update(nameStructure(firstName: firstName, lastName: lastName));
  }

  Future<void> editGender({String gender}) async {
    final String uid = await getUid();
    return await collections.users.doc(uid).update(genderStructure(gender: gender));
  }

  // Get a stream of the user document
  Stream<User> get firebaseUser {
    return collections.users.doc(uid).snapshots().map((snap) => User.fromMap(snap.data()));
  }

  // Stream<User> get firebaseRestaurant {
  //   return collections..doc(uid).snapshots().map((snap) => User.fromMap(snap.data()));
  // }

  // List<Restaurant> restaurantsToList(List<DocumentSnapshot> documents) {
  //   List<Restaurant> list = [];
  //   documents.forEach((document) {
  //     Restaurant restaurant = Restaurant.fromMap(document.data());
  //     print(document.data());
  //     print(restaurant);
  //     list.add(restaurant);
  //   });
  //   return list;
  // }

  // Future<List<Restaurant>> get firebaseRestaurants async {
  //   log('Getting restaurants');
  //   var doc = await collections.restaurants.get();
  //   var restaurants = doc.docs.map((snapshot) => Restaurant.fromMap(snapshot.data())).toList();
  //   log('${restaurants.length} restaurants fetched');
  //   return restaurants;
  //   // var snapshots = collections.orders.where("restaurantId", isEqualTo: uid).snapshots();
  //   // List<Order> orders = [];
  //   // snapshots.forEach((snapshot) {
  //   //   snapshot.docs.forEach((order) {
  //   //     orders.add(Order.fromMap(order.data()));
  //   //   });
  //   // });
  //   // return orders;
  // }

  // Future<Menu> getRestaurantMenu({String restaurantId}) async {
  //   log('getting restaurant : ${restaurantId} Menu');
  //   QuerySnapshot querySnapshot = await collections.menus(restaurantId: restaurantId).where("restaurantId", isEqualTo: restaurantId).get();
  //   var menu = Menu.fromMap(querySnapshot.docs?.first?.data());
  //   log('${menu.items.length} menu items fetched');
  //   return menu;
  // }

  // List<Order> ordersToList(List<DocumentSnapshot> documents) {
  //   List<Order> list = [];
  //   documents.forEach((document) {
  //     Order order = Order.fromMap(document.data());
  //     list.add(order);
  //   });
  //   return list;
  // }

  // Stream<List<Order>> get firebaseOrders {
  //   return collections.orders.where("customerId", isEqualTo: uid).snapshots().map((snap) => ordersToList(snap.docs));
  // }

  Future<User> get firebaseUserData async {
    return await collections.users.doc(uid).snapshots().map((snap) => User.fromMap(snap.data())).first;
  }

  Future<Map<String, dynamic>> getUserData() async {
    final String uid = await getUid();
    Map<String, dynamic> result;
    await collections.users.doc(uid).get().then((datasnapshot) {
      if (datasnapshot.exists) {
        result = datasnapshot.data();
      }
    });
    return result;
  }

  Future<Map<String, dynamic>> getVersionData() async {
    return await collections.versionUpdates.get().then((value) => value.docs.first.data());
  }

  // Cart Stuff
  // Stream<Cart> get firebaseCart {
  //   return collections
  //       .carts(uid: uid)
  //       .snapshots()
  //       .map((snap) => safeListIsNotEmpty(snap?.docs) ? Cart.fromMap(snap?.docs[0]?.data()) : Cart(uid: uid));
  // }

  // Future<Cart> get firebaseCartData async {
  //   return await collections
  //       .carts(uid: uid)
  //       .snapshots()
  //       .map((snap) => safeListIsNotEmpty(snap?.docs) ? Cart.fromMap(snap?.docs[0]?.data()) : Cart())
  //       .first;
  // }

  // createCart() async {
  //   log('creating user Cart');
  //   final String uid = await getUid();
  //   final String _uuid = Uuid().v1().toUpperCase();
  //   final Cart cart = Cart(id: _uuid, items: [], uid: uid);
  //   print(cart.toMap());
  //   await collections.carts(uid: uid).doc(_uuid).set(cart.toMap());
  //   return cart;
  // }

  // Future<dynamic> getCart() async {
  //   log('getting user Cart');
  //   final String uid = await getUid();
  //   QuerySnapshot querySnapshot = await collections.carts(uid: uid).where("uid", isEqualTo: uid).get();
  //   return querySnapshot.docs.length <= 0 ? await createCart() : Cart.fromMap(querySnapshot.docs.first.data());
  // }

  // Future<dynamic> updateCart(Cart cart, {bool marge = false}) async {
  //   log('updating user Cart');
  //   if (safeIsNotEmpty(cart.id)) cart.id = Uuid().v1().toUpperCase();
  //   final String uid = await getUid();
  //   return await collections.carts(uid: uid).doc(cart.id).set(cart.toMap(), SetOptions(merge: marge));
  // }

  // sendOrder(Order order) async {
  //   if (order.id.isEmpty) order.id = Uuid().v1().toUpperCase();
  //   if (order.time == null) order.time = Timestamp.now();

  //   return await collections.orders.doc(order.id).set(order.toMap());
  // }

  // Future<String> sendFeedBack({List<String> categories, String comment}) async {
  //   final String _uuid = Uuid().v1().toUpperCase();
  //   final String uid = await getUid();

  //   String _result;
  //   await collections.feedbacks.doc(_uuid).set(feedBackStructure(categories: categories, comment: comment, uid: uid)).catchError((onError) {
  //     _result = onError.message;
  //   });
  //   return _result ?? "thankYouPrompt";
  // }

  // Future<dynamic> updateUserPhoto(File imageFile) async {
  //   final String uid = await getUid();

  //   StorageReference ref = FirebaseStorage.instance.ref().child("users").child(uid).child("profile-image");
  //   StorageUploadTask uploadTask = ref.putFile(imageFile);

  //   final String photoUrl = await (await uploadTask.onComplete).ref.getDownloadURL();

  //   AppSharedPreferences.instance.setUserPhoto(photoUrl);
  //   return photoUrl;
  // }

  // Future<dynamic> getUserPhoto() async {
  //   final String uid = await getUid();

  //   return FirebaseStorage.instance.ref().child("users").child(uid).child("profile-image").getDownloadURL().catchError((onError) => null);
  // }

  // Future<String> getPlanId() async {
  //   List<DocumentSnapshot> documents = await getPlans();
  //   if (documents != null && documents.length > 0) {
  //     return documents[0].documentID;
  //   } else {
  //     return await createPlan();
  //   }
  // }

}
