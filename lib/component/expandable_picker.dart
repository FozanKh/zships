import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:zships/constants/colors.dart';
import 'package:zships/constants/decorations.dart';
import 'package:zships/localization/constants.dart';

const Duration _kExpand = const Duration(milliseconds: 200);

class ExpandablePicker extends StatefulWidget {
  const ExpandablePicker({
    Key key,
    @required this.title,
    this.onExpansionChanged,
    this.options: const <String>[],
    this.initiallyExpanded: true,
    this.padding,
    this.decoration,
    this.callback,
    this.value,
  })  : assert(initiallyExpanded != null),
        super(key: key);

  // final Widget leading;
  final String title;
  final String value;
  final Function callback;
  final ValueChanged<bool> onExpansionChanged;
  final List<String> options;
  final bool initiallyExpanded;
  final EdgeInsetsGeometry padding;
  final BoxDecoration decoration;
  @override
  ExpandablePickerState createState() => ExpandablePickerState();
}

class ExpandablePickerState extends State<ExpandablePicker> with SingleTickerProviderStateMixin {
  AnimationController _controller;
  CurvedAnimation _easeInAnimation;
  ColorTween _borderColor;
  ColorTween _headerColor;
  ColorTween _iconColor;
  Animation<double> _iconTurns;

  bool _isExpanded = true;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(duration: _kExpand, vsync: this);
    _easeInAnimation = CurvedAnimation(parent: _controller, curve: Curves.easeIn);
    _borderColor = ColorTween();
    _headerColor = ColorTween();
    _iconColor = ColorTween();
    _iconTurns = Tween<double>(begin: 0.25, end: 0.75).animate(_easeInAnimation);

    _isExpanded = PageStorage.of(context)?.readState(context) ?? widget.initiallyExpanded;
    if (_isExpanded) _controller.value = 1.0;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void expand() {
    _setExpanded(true);
  }

  void collapse() {
    _setExpanded(false);
  }

  void toggle() {
    HapticFeedback.mediumImpact();
    _setExpanded(!_isExpanded);
  }

  void _setExpanded(bool isExpanded) {
    if (_isExpanded != isExpanded) {
      setState(() {
        _isExpanded = isExpanded;
        if (_isExpanded)
          _controller.forward();
        else
          _controller.reverse().then<void>((value) {
            setState(() {
              // Rebuild without widget.children.
            });
          });
        PageStorage.of(context)?.writeState(context, _isExpanded);
      });
      if (widget.onExpansionChanged != null) {
        widget.onExpansionChanged(_isExpanded);
      }
    }
  }

  Widget _buildChildren(BuildContext context, Widget child) {
    return Container(
      alignment: Alignment.center,
      decoration: widget.decoration ?? BoxDecoration(borderRadius: kBorderRadius, boxShadow: kBoxShadow, color: kLight2),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          SizedBox(
            height: kCardHeight,
            child: IconTheme.merge(
              data: IconThemeData(color: _iconColor.evaluate(_easeInAnimation)),
              child: InkWell(
                onTap: toggle,
                child: Padding(
                  padding: widget.padding ?? EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Flexible(
                          flex: 3,
                          child: Text(widget.value ?? widget.title, style: TextStyle(fontSize: 16, color: widget.value == null ? kDark3 : null))),
                      Flexible(
                          child: RotationTransition(
                              turns: _iconTurns, child: Icon(isArabic(context) ? Icons.chevron_left : Icons.chevron_right, color: kDark3))),
                    ],
                  ),
                ),
              ),
            ),
          ),
          ClipRect(
            child: Align(
              heightFactor: _easeInAnimation.value,
              child: child,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    _borderColor.end = theme.dividerColor;
    _headerColor
      ..begin = theme.textTheme.subtitle1.color
      ..end = theme.accentColor;
    _iconColor
      ..begin = theme.unselectedWidgetColor
      ..end = theme.accentColor;

    final bool closed = !_isExpanded && _controller.isDismissed;
    return AnimatedBuilder(
      animation: _controller.view,
      builder: _buildChildren,
      child: closed
          ? null
          : Container(
              constraints: BoxConstraints(maxHeight: MediaQuery.of(context).size.height / 3),
              child: SingleChildScrollView(
                padding: EdgeInsets.fromLTRB(20, 0, 20, 10),
                physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
                child: Column(
                  children: List.generate(
                    widget.options.length,
                    (index) => widget.options[index] == widget.value
                        ? SizedBox()
                        : InkWell(
                            onTap: () => widget.callback(index),
                            child: Container(
                              width: double.infinity,
                              margin: EdgeInsets.symmetric(vertical: 7.5),
                              alignment: customAlignment(context),
                              child: Text(getText(context, widget.options[index]), style: TextStyle(fontSize: 16)),
                            ),
                          ),
                  ),
                ),
              ),
            ),
    );
  }
}
