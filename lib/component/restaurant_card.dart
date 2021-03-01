// import 'package:flutter/material.dart';
// import 'package:zships/component/bounce.dart';
// import 'package:zships/constants/colors.dart';
// import 'package:zships/constants/decorations.dart';
// import 'package:zships/constants/helper_methods.dart';
// import 'package:zships/constants/validate.dart';
// import 'package:zships/core/model/restaurant.dart';
// import 'package:zships/globals.dart';
// import 'package:zships/localization/constants.dart';
// import 'package:zships/menu/view/restaurant_view.dart';

// class RestaurantCard extends StatelessWidget {
//   final Restaurant restaurant;
//   const RestaurantCard({@required this.restaurant});
//   @override
//   Widget build(BuildContext context) {
//     return Bounce(
//       onTap: () => navigateTo(context, RestaurantView.route, args: {'restaurant': restaurant}),
//       child: Container(
//         height: 80,
//         clipBehavior: Clip.hardEdge,
//         margin: EdgeInsets.symmetric(horizontal: 5, vertical: 7.5),
//         decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.circular(8),
//           boxShadow: kBoxShadow,
//         ),
//         child: Stack(
//           alignment: isArabic(context) ? Alignment.topLeft : Alignment.topRight,
//           children: [
//             Padding(
//               padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
//               child: Row(
//                 children: <Widget>[
//                   Container(
//                     clipBehavior: Clip.hardEdge,
//                     height: 60,
//                     width: 65,
//                     decoration: BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: kBorderRadius,
//                     ),
//                     child: (safeIsNotEmpty(restaurant?.photoURL))
//                         ? FadeInImage(
//                             placeholder: AssetImage(kRestPlaceholderAsset),
//                             image: NetworkImage(restaurant?.photoURL),
//                           )
//                         : Image.asset(kRestPlaceholderAsset),
//                   ),
//                   SizedBox(width: 15),
//                   Flexible(
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                       children: <Widget>[
//                         Text(restaurant?.getRestaurantName() ?? '', style: TextStyle(fontSize: 14), maxLines: 1, overflow: TextOverflow.ellipsis),
//                         // Text(restaurant?.categories[0].title ?? '', style: kHintTS.copyWith(fontSize: 12)),
//                       ],
//                     ),
//                   )
//                 ],
//               ),
//             ),
//             if (restaurant.location != null && userLocation != null)
//               Align(
//                 alignment: customAlignment(context, flip: true, bottom: true),
//                 child: Padding(
//                   padding: const EdgeInsets.all(10),
//                   child: Row(
//                     mainAxisSize: MainAxisSize.min,
//                     crossAxisAlignment: CrossAxisAlignment.end,
//                     children: [
//                       Text(restaurant.getDistance(), style: kHintTS.copyWith(fontSize: 13)),
//                       Text(getText(context, 'km'), style: kHintTS.copyWith(fontSize: 13)),
//                     ],
//                   ),
//                 ),
//               ),
//           ],
//         ),
//       ),
//     );
//   }
// }
// //               Align(
// //                 alignment: customAlignment(context, flip: true),
// //                 child:
// //               ),
