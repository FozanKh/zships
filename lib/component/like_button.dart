// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:zships/component/alerts.dart';
// import 'package:zships/component/bounce.dart';
// import 'package:zships/constants/decorations.dart';
// // import 'package:xs_progress_hud/xs_progress_hud.dart';

// class LikeButton extends StatefulWidget {
//   final String productId;
//   final bool liked;

//   const LikeButton({this.productId, this.liked = false});

//   @override
//   _LikeButtonState createState() => _LikeButtonState();
// }

// class _LikeButtonState extends State<LikeButton> {
//   bool loading = false;
//   @override
//   Widget build(BuildContext context) {
//     final authBloc = Provider.of<AuthBloc>(context);
//     // final userBloc = Provider.of<UserBloc>(context);
//     final wishBloc = Provider.of<WishBloc>(context);
//     return Bounce(
//       onTap: () async {
//         if (authBloc.userId != null && widget.productId != null) {
//           setState(() => loading = true);
//           widget.liked
//               ? await wishBloc.deleteWish(userId: authBloc.userId, wishId: widget.productId)
//               : await wishBloc.addToWishList(userId: authBloc.userId, productId: widget.productId);
//           setState(() => loading = false);

//           // AppAlerts.showErrorDialog(Platform.isIOS, context, 'the product has been added to your wish List', 'ok');
//         } else if (authBloc.userId == null) {
//           AppAlerts.showErrorDialog(Platform.isIOS, context, 'you must signin or signup  first', 'Error');
//         }
//       },
//       child: AnimatedContainer(
//         transform: loading ? Matrix4.identity().scaled(1.0, 0.9) : Matrix4.identity().absolute(),
//         duration: Duration(milliseconds: 300),
//         height: 25,
//         width: 25,
//         margin: EdgeInsets.all(5),
//         decoration: BoxDecoration(
//           shape: BoxShape.circle,
//           color: widget.liked ? kRed1 : kDark2,
//           boxShadow: kBoxShadow,
//         ),
//         child: Icon(UHIcons.heart, size: 12, color: Colors.white),
//       ),

//       // AnimatedCrossFade(
//       //   duration: Duration(milliseconds: 250),
//       //   crossFadeState: loading ? CrossFadeState.showSecond : CrossFadeState.showFirst,
//       //   secondChild: Container(
//       //     height: 35,
//       //     width: 30,
//       //     padding: EdgeInsets.all(5),
//       //     child: CircularProgressIndicator(),
//       //   ),
//       //   firstChild:
//       //   AnimatedContainer(
//       //     duration: Duration(milliseconds: 250),
//       //     height: 25,
//       //     width: 25,
//       //     margin: EdgeInsets.all(5),
//       //     decoration: BoxDecoration(
//       //         shape: BoxShape.circle,
//       //         color: loading
//       //             ? kDark2
//       //             : widget.liked
//       //                 ? kRed1
//       //                 : kDark2,
//       //         boxShadow: kBoxShadow),
//       //     child: Icon(UHIcons.heart, size: 11, color: Colors.white),
//       //   ),

//       // ),
//     );
//   }
// }
