import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:zships/constants/colors.dart';

/// [Container] Decoration
const double kCardHeight = 50.0;
const double kCardHeightSmall = 40.0;
final BoxDecoration kContainerDecoration = BoxDecoration(boxShadow: kBoxShadow, borderRadius: kBorderRadius);
const kBorderRadius = BorderRadius.all(Radius.circular(10));
const kBorderRadiusSmall = BorderRadius.all(Radius.circular(5));
const kBorderRadiusLarge = BorderRadius.all(Radius.circular(15));
const kBorderRadiusXLarge = BorderRadius.all(Radius.circular(20));
const kBorderRadiusXXLarge = BorderRadius.all(Radius.circular(25));
final kBoxShadow = [BoxShadow(blurRadius: 7, color: Colors.black.withOpacity(0.07), offset: Offset(0, 6))];
const kBoxShadowDark = [BoxShadow(blurRadius: 7, color: Colors.black12, offset: Offset(0, 6))];
const kBlueButtonColor = Color(0xFF3568D4);

/// [TextStyles]
const kOrderDetailsTS = TextStyle(fontSize: 16, fontWeight: FontWeight.w600);
const kTitleTS = TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.w700);
const kHintTS = TextStyle(color: Colors.black26, fontSize: 16);
const kSubTitleTS = TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.w700);
const kTBIconsTS = TextStyle(fontSize: 8);
const kAlertTS = TextStyle(fontSize: 15);

const kEditIcon = Icon(Icons.edit);
const pkEditIcon = Icon(Icons.chevron_right);
final pkAlertIcon = Icon(Icons.error, color: Colors.red[400]);

/// [TextStyles]
const kClickableText = TextStyle(fontSize: 12, color: kBlueButtonColor);

//Term View
const kTitle = TextStyle(fontSize: 34, fontWeight: FontWeight.bold);
const kSubTitle = TextStyle(fontSize: 22, fontWeight: FontWeight.bold);
const kDialogTitle = TextStyle(fontSize: 14, fontWeight: FontWeight.w500);
const kTermName = TextStyle(fontSize: 18, fontWeight: FontWeight.bold, height: 1.1);
const kTermLabel = TextStyle(fontSize: 11, fontWeight: FontWeight.w700);
const kTermNum = TextStyle(fontSize: 15, fontWeight: FontWeight.w600);
//TermSummaryView
const kTermSmName = TextStyle(fontSize: 20, fontWeight: FontWeight.w600, height: 1.1);
const kTermSmLabel = TextStyle(fontSize: 12, fontWeight: FontWeight.w700);
const kTermSmNum = TextStyle(fontSize: 12, fontWeight: FontWeight.w500);
//CourseTile
const kCTName = TextStyle(fontSize: 12, fontWeight: FontWeight.normal);
const kCTCode = TextStyle(fontSize: 12, fontWeight: FontWeight.w600);
const kCGradeSelection = TextStyle(fontSize: 12);
const kCTNum = TextStyle(fontSize: 12, fontWeight: FontWeight.w600);
//Profile
const kPHint = TextStyle(fontSize: 16, fontWeight: FontWeight.normal);
const kPInfo = TextStyle(fontSize: 14);
//Dashboard
const kDInfo = TextStyle(fontSize: 12, fontWeight: FontWeight.bold);
const kDSmallTitle = TextStyle(fontSize: 10, fontWeight: FontWeight.w700, height: 1.1);

// TextStyles  (TO BE CHANGED)
const kMidTitleTextStyle = TextStyle(fontSize: 20, fontWeight: FontWeight.bold);
const kTitleTextStyle = TextStyle(fontSize: 40, fontWeight: FontWeight.bold);
const kSubTitleTextStyle = TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
const kLabelTextStyle = TextStyle(fontSize: 18, color: kFontsColor);
const kColoredTextStyle = TextStyle();
const kClickableTextStyle = TextStyle(fontSize: 12, decoration: TextDecoration.underline);
const kTFTextStyle = TextStyle(fontSize: 20);
const kTransparentTextStyle = TextStyle(color: kTransparent);
const kHintTextStyle = TextStyle(fontSize: 14);

// Assets
const kMenudLogoAsset = 'assets/images/menud_logo.jpeg';
const kZShipLogo = 'assets/images/zShipsLogo.png';
const kRestPlaceholderAsset = 'assets/images/restaurant_placeholder.jpg';
const kMealPlaceholderAsset = 'assets/images/meal_placeholder.png';
const kLottieNoConnectionAsset = 'assets/lottie/noconnection.json';
const kLottieLoadingAsset = 'assets/lottie/loading.json';

final kProgressIndicator = Lottie.asset(kLottieLoadingAsset);

const kActiveIcon = Color(0xFF3568D4); //blue active
// const pkEditIcon = Icon(Icons.chevron_right, color: Colors.white);

const int suggestionsCount = 20;

const List<String> kLetterGrades = ['A+', 'A', 'B+', 'B', 'C+', 'C', 'D+', 'D', 'F', 'Ungraded'];

// final kProgressIndicator = Center(child: SizedBox(height: 200, width: 200, child: Lottie.asset(kLottieLoadingAsset)));

const List<String> kGenders = ['male', 'female'];
const List<String> dummyEmojis = [
  "😱",
  "🙌",
  "🔥",
  "🎈",
  "🌹",
  "🏁",
  "🐻",
  "🐬",
  "👌",
  "😍",
  "😓",
  "😳",
  "💪",
  "💩",
  "🔑",
  "🌟",
  "🎉",
  "🎶",
  "🏆",
  "💀",
  "💣",
  "👊",
  "😵",
  "🙏",
  "👋",
  "💃",
  "🚀",
  "🌊",
  "👸",
  "🍉",
  "👩‍🎓",
  "👨‍🎓",
  "🎓",
  "🏋️‍♂️",
  "🎯",
  "📚",
  "📐",
  "📒",
];

const Map<String, dynamic> kDefaultGradingSystem = {
  "A+": 4.00,
  "A": 3.75,
  "B+": 3.50,
  "B": 3.00,
  "C+": 2.50,
  "C": 2.00,
  "D+": 1.50,
  "D": 1.00,
  "F": 0.00,
  "W": null,
  "IP": null,
  "IC": null,
  "DN": null,
  "NP": null,
  "NF": null,
  "CR": null,
  "AU": null,
};

const List<double> kGpaSystems = [4, 5, 100];

// Enums
enum GpaSystems { system4, system5, system7, system100 }

// const List<Color> kCourseColors = [];

const List<Color> kCourseColors = [
  Color(0xFFFB9D9E),
  Color(0xFFF9BE9F),
  Color(0xFFFBC888),
  Color(0xFFFBDF9D),
  Color(0xFFC9DFB9),
  Color(0xFFEBD3EE),
  Color(0xFFF3BFE8),
  Color(0xFFFFA9D4),
  Color(0xFFFFFD91),
  Color(0xFFC69AFF),
  Color(0xFF8FFFDD),
  Color(0xFFFFB77C),
  Color(0xFFD6B9FF),
  Colors.lightBlueAccent,
  Colors.lime,
  Colors.tealAccent,
  Colors.amberAccent,
];

// const Map<EventType, Color> kEventsColors = {
//       EventType
//         "c378e0": "Quiz",
//         "ff9f19": "Assignment",
//         "f2d603": "Project",
//         "ec5a46": "Exam",
//         "52e898": "Study",
// }
// const List<Color> kCourseColors = [
//   Colors.greenAccent,
//   Colors.amberAccent,
//   Colors.blueAccent,
//   Colors.cyan,
//   Colors.purpleAccent,
//   Colors.orange,
//   Colors.lightBlueAccent,
//   Colors.lime,
//   Colors.tealAccent
// ];

/// [Deprecated!] Backgrounds, Goes darker as number increases
const kBackground1 = Color(0xFFFFFFFF);
const kBackground2 = Color(0xFFFAFAFC);
const kBackground3 = Color(0xFFF2F2F5);
const kBackground4 = Color(0xFFE1E1E1); // temp darker
