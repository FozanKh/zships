import 'package:flutter/material.dart';
import 'package:zships/component/action_button.dart';
import 'package:zships/component/rounded_button.dart';
import 'package:zships/constants/colors.dart';
import 'package:zships/constants/decorations.dart';
import 'package:zships/localization/constants.dart';

// modalBottomSheet(context, {@required Widget child, @required String title}) {
//   showModalBottomSheet(
//     isScrollControlled: true,
//     // elevation: 10,
//     useRootNavigator: true,
//     backgroundColor: Colors.transparent,
//     context: context,
//     builder: (context) => SingleChildScrollView(
//       child: Container(
//         decoration: BoxDecoration(borderRadius: BorderRadius.vertical(top: Radius.circular(10)), color: Colors.white),
//         margin: EdgeInsets.only(top: 100),
//         padding: EdgeInsets.only(top: 30, bottom: MediaQuery.of(context).viewInsets.bottom, right: 20, left: 20),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.start,
//           children: <Widget>[
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: <Widget>[
//                 Text(title, style: kSubTitle),
//                 ActionButton(
//                   title: getText(context, 'cancel'),
//                   onTap: () {
//                     Navigator.pop(context);
//                   },
//                 )
//               ],
//             ),
//             Padding(
//               padding: const EdgeInsets.all(30),
//               child: child,
//             ),
//             SizedBox(height: 30)
//           ],
//         ),
//       ),
//     ),
//   );
// }

modalBottomSheet(context, {@required Widget child, String title, bool locale = false, bool fullHeight = false}) {
  showModalBottomSheet(
    isScrollControlled: true,
    elevation: 0,
    useRootNavigator: true,
    backgroundColor: Colors.transparent,
    context: context,
    builder: (context) => Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.vertical(top: Radius.circular(10)), color: kBackground),
      margin: EdgeInsets.only(top: kToolbarHeight + 10, bottom: MediaQuery.of(context).viewInsets.bottom),
      padding: EdgeInsets.symmetric(horizontal: 20),
      height: fullHeight ? MediaQuery.of(context).size.height : null,
      child: Stack(
        children: [
          SingleChildScrollView(
            // physics: BouncingScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                SizedBox(height: (title == null) ? 20 : kToolbarHeight + 40),
                Hero(
                  tag: 'bottomSheet',
                  child: child,
                ),
                if (title != null) SizedBox(height: 100),
                if (title == null)
                  RoundedButton(
                    margin: EdgeInsets.symmetric(vertical: 50),
                    title: getText(context, 'cancel'),
                    onTap: () => Navigator.pop(context),
                  ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(bottom: 10),
            decoration: BoxDecoration(
              boxShadow: [BoxShadow(color: kLight4, blurRadius: 5, offset: Offset(0, 10))],
              color: kLight4,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: 10),
                Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    height: 5,
                    width: 40,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: kLight0,
                      borderRadius: kBorderRadius,
                    ),
                  ),
                ),
                if (title != null) SizedBox(height: 20),
                if (title != null)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(locale ? getText(context, title ?? '') : title ?? '', style: kSubTitle),
                      ActionButton(
                        title: getText(context, 'cancel'),
                        onTap: () => Navigator.pop(context),
                      )
                    ],
                  ),
              ],
            ),
          ),
          // Align(
          //   alignment: Alignment.bottomCenter,
          //   child: Container(
          //     height: kCardHeight + 10,
          //     child: RoundedButton(
          //       title: getText(context, 'cancel'),
          //       onTap: () => Navigator.pop(context),
          //     ),
          //   ),
          // )
        ],
      ),
    ),
  );
}
