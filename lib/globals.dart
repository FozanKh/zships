import 'dart:async';

// import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:zships/core/model/shipment.dart';
import 'package:zships/test_models.dart';

// import 'package:zships/globals.dart' as globals;
// final FirebaseMessaging fireMsg = FirebaseMessaging();
BuildContext globalContext;
Models models;
StreamSubscription iosSubscription;
// Cart cart;
GlobalKey navBarKey = new GlobalKey(debugLabel: 'btm_app_bar');
switchTab(int page) {
  (navBarKey.currentWidget as BottomNavigationBar).onTap(page);
}

List<Shipment> allShipments = [];
