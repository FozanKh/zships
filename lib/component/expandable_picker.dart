// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:zships/constants/decorations.dart';
// import 'package:zships/localization/constants.dart';

// const Duration _kExpand = const Duration(milliseconds: 200);

// class ExpandablePicker extends StatefulWidget {
//   const ExpandablePicker(
//       {Key key,
//       // this.leading,
//       @required this.title,
//       this.backgroundColor,
//       this.onExpansionChanged,
//       this.children: const <Widget>[],
//       this.trailing,
//       this.initiallyExpanded: true,
//       this.padding,
//       this.decoration,
//       this.hight: 70,
//       this.dense = true,
//       this.shadow = false})
//       : assert(initiallyExpanded != null),
//         super(key: key);

//   // final Widget leading;
//   final Widget title;
//   final ValueChanged<bool> onExpansionChanged;
//   final List<Widget> children;
//   final Color backgroundColor;
//   final Widget trailing;
//   final bool initiallyExpanded;
//   final bool dense;
//   final bool shadow;
//   final EdgeInsetsGeometry padding;
//   final BoxDecoration decoration;
//   final double hight;
//   @override
//   ExpandablePickerState createState() => ExpandablePickerState();
// }

// class ExpandablePickerState extends State<ExpandablePicker> with SingleTickerProviderStateMixin {
//   AnimationController _controller;
//   CurvedAnimation _easeOutAnimation;
//   CurvedAnimation _easeInAnimation;
//   ColorTween _borderColor;
//   ColorTween _headerColor;
//   ColorTween _iconColor;
//   ColorTween _backgroundColor;
//   Animation<double> _iconTurns;

//   bool _isExpanded = true;

//   @override
//   void initState() {
//     super.initState();
//     _controller = AnimationController(duration: _kExpand, vsync: this);
//     _easeOutAnimation = CurvedAnimation(parent: _controller, curve: Curves.easeOut);
//     _easeInAnimation = CurvedAnimation(parent: _controller, curve: Curves.easeIn);
//     _borderColor = ColorTween();
//     _headerColor = ColorTween();
//     _iconColor = ColorTween();
//     _iconTurns = Tween<double>(begin: 0.25, end: 0.75).animate(_easeInAnimation);
//     _backgroundColor = ColorTween();

//     _isExpanded = PageStorage.of(context)?.readState(context) ?? widget.initiallyExpanded;
//     if (_isExpanded) _controller.value = 1.0;
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   void expand() {
//     _setExpanded(true);
//   }

//   void collapse() {
//     _setExpanded(false);
//   }

//   void toggle() {
//     HapticFeedback.mediumImpact();
//     _setExpanded(!_isExpanded);
//   }

//   void _setExpanded(bool isExpanded) {
//     if (_isExpanded != isExpanded) {
//       setState(() {
//         _isExpanded = isExpanded;
//         if (_isExpanded)
//           _controller.forward();
//         else
//           _controller.reverse().then<void>((value) {
//             setState(() {
//               // Rebuild without widget.children.
//             });
//           });
//         PageStorage.of(context)?.writeState(context, _isExpanded);
//       });
//       if (widget.onExpansionChanged != null) {
//         widget.onExpansionChanged(_isExpanded);
//       }
//     }
//   }

//   Widget _buildChildren(BuildContext context, Widget child) {
//     return Container(
//       alignment: Alignment.center,
//       margin: EdgeInsets.symmetric(vertical: 5),
//       decoration: widget.decoration ??
//           BoxDecoration(
//             borderRadius: kBorderRadius,
//             boxShadow: widget.shadow ? kBoxShadow : null,
//             /* border: Border.all(color: kLight0, width: 1), */
//             color: _backgroundColor.evaluate(_easeOutAnimation) ?? widget.backgroundColor, //Colors.transparent,
//           ),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.start,
//         mainAxisSize: MainAxisSize.min,
//         children: <Widget>[
//           SizedBox(
//             height: kCardHeight,
//             child: IconTheme.merge(
//               data: IconThemeData(color: _iconColor.evaluate(_easeInAnimation)),
//               child: InkWell(
//                 onTap: toggle,
//                 child: Padding(
//                   padding: widget.padding ?? EdgeInsets.symmetric(horizontal: 15),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: <Widget>[
//                       // if (widget.leading != null) widget.leading,
//                       // if (widget.title != null) Container(height: 35, alignment: Alignment.center, child: widget.title),
//                       Flexible(flex: 3, child: widget.title),
//                       // Flexible(child: widget.trailing ?? RotationTransition(turns: _iconTurns, child: pkEditIcon)),
//                       Flexible(
//                           child: widget.trailing ??
//                               RotationTransition(
//                                   turns: _iconTurns, child: Icon(isArabic(context) ? Icons.chevron_left : Icons.chevron_right, color: kDark3))),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ),
//           ClipRect(
//             child: Align(
//               heightFactor: _easeInAnimation.value,
//               child: child,
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     final ThemeData theme = Theme.of(context);
//     _borderColor.end = theme.dividerColor;
//     _headerColor
//       ..begin = theme.textTheme.subtitle1.color
//       ..end = theme.accentColor;
//     _iconColor
//       ..begin = theme.unselectedWidgetColor
//       ..end = theme.accentColor;
//     _backgroundColor.end = widget.backgroundColor;

//     final bool closed = !_isExpanded && _controller.isDismissed;
//     return AnimatedBuilder(
//       animation: _controller.view,
//       builder: _buildChildren,
//       child: closed
//           ? null
//           : widget.dense
//               ? Container(
//                   height: widget.hight,
//                   child: SingleChildScrollView(
//                     physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
//                     child: Column(children: widget.children),
//                   ),
//                 )
//               : Column(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   children: List.generate(
//                     widget.children.length,
//                     (index) => Padding(padding: EdgeInsets.only(bottom: widget.children[index] is SizedBox ? 0 : 10), child: widget.children[index]),
//                   ),
//                 ),
//     );
//   }
// }

// // import 'package:flutter/material.dart';
// // import 'package:zships/constants/decorations.dart';

// // const Duration _kExpand = const Duration(milliseconds: 200);

// // class ExpandablePicker extends StatefulWidget {
// //   const ExpandablePicker(
// //       {Key key,
// //       this.leading,
// //       @required this.title,
// //       this.backgroundColor,
// //       this.onExpansionChanged,
// //       this.children: const <Widget>[],
// //       this.trailing,
// //       this.initiallyExpanded: true,
// //       this.padding,
// //       this.decoration,
// //       this.dense = true})
// //       : assert(initiallyExpanded != null),
// //         super(key: key);

// //   final Widget leading;
// //   final Widget title;
// //   final ValueChanged<bool> onExpansionChanged;
// //   final List<Widget> children;
// //   final Color backgroundColor;
// //   final Widget trailing;
// //   final bool initiallyExpanded;
// //   final bool dense;
// //   final EdgeInsetsGeometry padding;
// //   final BoxDecoration decoration;

// //   @override
// //   ExpandablePickerState createState() => ExpandablePickerState();
// // }

// // class ExpandablePickerState extends State<ExpandablePicker> with SingleTickerProviderStateMixin {
// //   AnimationController _controller;
// //   CurvedAnimation _easeOutAnimation;
// //   CurvedAnimation _easeInAnimation;
// //   ColorTween _borderColor;
// //   ColorTween _headerColor;
// //   ColorTween _iconColor;
// //   ColorTween _backgroundColor;
// //   Animation<double> _iconTurns;

// //   bool _isExpanded = true;

// //   @override
// //   void initState() {
// //     super.initState();
// //     _controller = AnimationController(duration: _kExpand, vsync: this);
// //     _easeOutAnimation = CurvedAnimation(parent: _controller, curve: Curves.easeOut);
// //     _easeInAnimation = CurvedAnimation(parent: _controller, curve: Curves.easeIn);
// //     _borderColor = ColorTween();
// //     _headerColor = ColorTween();
// //     _iconColor = ColorTween();
// //     _iconTurns = Tween<double>(begin: 0.0, end: 0.5).animate(_easeInAnimation);
// //     _backgroundColor = ColorTween();

// //     _isExpanded = PageStorage.of(context)?.readState(context) ?? widget.initiallyExpanded;
// //     if (_isExpanded) _controller.value = 1.0;
// //   }

// //   @override
// //   void dispose() {
// //     _controller.dispose();
// //     super.dispose();
// //   }

// //   void expand() {
// //     _setExpanded(true);
// //   }

// //   void collapse() {
// //     _setExpanded(false);
// //   }

// //   void toggle() {
// //     _setExpanded(!_isExpanded);
// //   }

// //   void _setExpanded(bool isExpanded) {
// //     if (_isExpanded != isExpanded) {
// //       setState(() {
// //         _isExpanded = isExpanded;
// //         if (_isExpanded)
// //           _controller.forward();
// //         else
// //           _controller.reverse().then<void>((value) {
// //             setState(() {
// //               // Rebuild without widget.children.
// //             });
// //           });
// //         PageStorage.of(context)?.writeState(context, _isExpanded);
// //       });
// //       if (widget.onExpansionChanged != null) {
// //         widget.onExpansionChanged(_isExpanded);
// //       }
// //     }
// //   }

// //   Widget _buildChildren(BuildContext context, Widget child) {
// //     return Container(
// //       alignment: Alignment.center,
// //       margin: EdgeInsets.symmetric(vertical: 5),
// //       decoration: widget.decoration ??
// //           BoxDecoration(
// //             borderRadius: kBorderRadius,
// //             /* border: Border.all(color: kLight0, width: 1), */
// //             color: _backgroundColor.evaluate(_easeOutAnimation) ?? widget.backgroundColor, //Colors.transparent,
// //           ),
// //       child: Column(
// //         mainAxisAlignment: MainAxisAlignment.start,
// //         mainAxisSize: MainAxisSize.min,
// //         children: <Widget>[
// //           SizedBox(
// //             height: kCardHeight,
// //             child: IconTheme.merge(
// //               data: IconThemeData(color: _iconColor.evaluate(_easeInAnimation)),
// //               child: InkWell(
// //                 onTap: toggle,
// //                 child: Padding(
// //                   padding: widget.padding ?? EdgeInsets.symmetric(horizontal: 15),
// //                   child: Row(
// //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //                     children: <Widget>[
// //                       if (widget.leading != null) widget.leading,
// //                       if (widget.title != null) Container(height: 35, alignment: Alignment.center, child: widget.title),
// //                       widget.trailing ?? RotationTransition(turns: _iconTurns, child: Icon(Icons.expand_more, size: 20)),
// //                     ],
// //                   ),
// //                 ),
// //               ),
// //             ),
// //           ),
// //           ClipRect(
// //             child: Align(
// //               heightFactor: _easeInAnimation.value,
// //               child: child,
// //             ),
// //           ),
// //         ],
// //       ),
// //     );
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     final ThemeData theme = Theme.of(context);
// //     _borderColor.end = theme.dividerColor;
// //     _headerColor
// //       ..begin = theme.textTheme.subtitle1.color
// //       ..end = theme.accentColor;
// //     _iconColor
// //       ..begin = theme.unselectedWidgetColor
// //       ..end = theme.accentColor;
// //     _backgroundColor.end = widget.backgroundColor;

// //     final bool closed = !_isExpanded && _controller.isDismissed;
// //     return AnimatedBuilder(
// //       animation: _controller.view,
// //       builder: _buildChildren,
// //       child: closed
// //           ? null
// //           : widget.dense
// //               ? Container(
// //                   height: 100,
// //                   child: SingleChildScrollView(
// //                     physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
// //                     child: Column(
// //                       crossAxisAlignment: CrossAxisAlignment.stretch,
// //                       children: widget.children,
// //                     ),
// //                   ),
// //                 )
// //               : Column(
// //                   mainAxisAlignment: MainAxisAlignment.start,
// //                   children: List.generate(
// //                     widget.children.length,
// //                     (index) => Padding(
// //                       padding: EdgeInsets.only(bottom: widget.children[index] is SizedBox ? 0 : 10),
// //                       child: widget.children[index],
// //                     ),
// //                   ),
// //                 ),
// //     );
// //   }
// // }
