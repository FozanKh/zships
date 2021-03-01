// import 'package:flutter/material.dart';

// class Diffuser extends StatelessWidget {
//   final Widget child;
//   final double margin;
//   final bool horizontal;
//   const Diffuser({Key key, this.child, this.margin = 0, this.horizontal = false}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: [
//         Padding(
//           padding: horizontal ? EdgeInsets.zero : EdgeInsets.only(top: 10),
//           child: child,
//         ),
//         if (!horizontal)
//           Container(
//             height: 20,
//             margin: margin > 5 ? EdgeInsets.fromLTRB(margin - 5, 5, margin - 5, 5) : EdgeInsets.zero,
//             decoration: BoxDecoration(
//               boxShadow: [BoxShadow(color: Themer.instance.background, blurRadius: 5)],
//               color: kTransparent,
//             ),
//           ),
//         if (!horizontal)
//           Align(
//             alignment: Alignment.bottomCenter,
//             child: Container(
//               height: 5,
//               decoration: BoxDecoration(
//                 boxShadow: [BoxShadow(color: Themer.instance.background, blurRadius: 10, spreadRadius: 10)],
//                 color: Themer.instance.background,
//               ),
//             ),
//           ),
//         if (horizontal)
//           Align(
//             alignment: customAlignment(context, flip: true),
//             child: Container(
//               width: 5,
//               height: 75,
//               decoration:
//                   BoxDecoration(boxShadow: [BoxShadow(color: Themer.instance.background, blurRadius: 10, spreadRadius: 10)], color: kTransparent),
//             ),
//           ),
//         if (horizontal)
//           Align(
//             alignment: customAlignment(context),
//             child: Container(
//               width: 5,
//               height: 75,
//               decoration:
//                   BoxDecoration(boxShadow: [BoxShadow(color: Themer.instance.background, blurRadius: 10, spreadRadius: 10)], color: kTransparent),
//             ),
//           ),
//       ],
//     );
//   }
// }
