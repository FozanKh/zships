import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:zships/constants/colors.dart';

/// [Container] Decoration
const double kCardHeight = 50.0;
const double kCardHeightSmall = 40.0;
final BoxDecoration kContainerDecoration = BoxDecoration(boxShadow: kBoxShadow, borderRadius: kBorderRadius);
const BorderRadius kBorderRadius = BorderRadius.all(Radius.circular(10));
const BorderRadius kBorderRadiusSmall = BorderRadius.all(Radius.circular(5));
final List<BoxShadow> kBoxShadow = [BoxShadow(blurRadius: 7, color: Colors.black.withOpacity(0.07), offset: Offset(0, 6))];
final List<BoxShadow> kBoxShadowLight = [BoxShadow(blurRadius: 5, color: Colors.black.withOpacity(0.05), offset: Offset(0, 6))];
const List<BoxShadow> kBoxShadowDark = [BoxShadow(blurRadius: 7, color: Colors.black12)];

/// [TextStyles]
const kHintTS = TextStyle(color: Colors.black26, fontSize: 16);
const kAlertTS = TextStyle(fontSize: 15);
const kSubTitle = TextStyle(fontSize: 22, fontWeight: FontWeight.bold);
const kMidTitleTS = TextStyle(fontSize: 20, fontWeight: FontWeight.bold);
const kTitleTS = TextStyle(fontSize: 40, fontWeight: FontWeight.bold);
const kLabelTS = TextStyle(fontSize: 18, color: kFontsColor);
const kClickableTS = TextStyle(fontSize: 12, decoration: TextDecoration.underline);
const kTFTextStyle = TextStyle(fontSize: 20);

// Assets
const pkEditIcon = Icon(Icons.chevron_right);
const kZShipLogo = 'assets/images/zShipsLogo.png';
const kLottieNoConnectionAsset = 'assets/lottie/noconnection.json';
const kLottieLoadingAsset = 'assets/lottie/loading.json';

final kProgressIndicator = Lottie.asset(kLottieLoadingAsset);
