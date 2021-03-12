import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zships/component/titled.dart';
import 'package:zships/constants/colors.dart';
import 'dart:ui';

import 'package:zships/constants/decorations.dart';
import 'package:zships/constants/validate.dart';

class RoundedTextField extends StatefulWidget {
  final String title;
  final String hint;
  final String label;
  final Color fillColor;
  final bool isBordered;
  final bool autoFocus;
  final bool enabled;
  final bool center;
  final bool obscureText;
  final double fontSize;
  final bool clearButton;
  final TextEditingController textController;
  final void Function(String) onChanged;
  final TextInputType keyboardType;
  final EdgeInsetsGeometry margin;
  final EdgeInsetsGeometry padding;
  final TextStyle hintStyle;
  final TextDirection textDirection;
  final TextCapitalization textCapitalization;
  final FocusNode focusNode;
  final double height;
  final int maxLines;
  final Function onSubmitted;
  final int maxLength;
  final IconData trailingIcon;
  const RoundedTextField({
    Key key,
    this.title,
    this.hint,
    this.onChanged,
    this.keyboardType,
    this.margin,
    this.label,
    this.fillColor,
    this.isBordered = false,
    this.textController,
    this.fontSize,
    this.enabled,
    this.padding,
    this.obscureText = false,
    this.clearButton = true,
    this.center = false,
    this.hintStyle,
    this.textDirection,
    this.textCapitalization,
    this.focusNode,
    this.height,
    this.maxLines = 1,
    this.onSubmitted,
    this.maxLength,
    this.trailingIcon,
    this.autoFocus = false,
  });

  @override
  _RoundedTextFieldState createState() => _RoundedTextFieldState();
}

class _RoundedTextFieldState extends State<RoundedTextField> {
  TextEditingController _textController;
  bool hidePassword = false;
  bool showClear = true;

  @override
  void initState() {
    _textController = widget.textController ?? TextEditingController();
    if (widget.clearButton || widget.obscureText) hidePassword = widget.obscureText ? true : false;
    super.initState();
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.margin ?? EdgeInsets.zero,
      child: Titled(
        title: widget.title,
        child: Container(
          decoration: BoxDecoration(boxShadow: kBoxShadowLight),
          height: widget.height ?? kCardHeight,
          child: TextField(
            autofocus: widget.autoFocus,
            onSubmitted: widget.onSubmitted,
            onTap: () => _textController.selection = TextSelection.fromPosition(TextPosition(offset: _textController.text.length)),
            enabled: widget.enabled,
            maxLines: widget.obscureText ? 1 : widget.maxLines,
            maxLength: widget.maxLength,
            controller: _textController,
            obscureText: widget.obscureText ? hidePassword : false,
            textAlign: widget.center ? TextAlign.center : TextAlign.start,
            textDirection: widget.textDirection,
            style: TextStyle(fontSize: widget.fontSize ?? 14, height: 1.1),
            keyboardType: widget.keyboardType,
            focusNode: widget.focusNode,
            textCapitalization: widget.textCapitalization ?? TextCapitalization.sentences,
            decoration: InputDecoration(
              counterText: '',
              suffixIconConstraints:
                  widget.trailingIcon != null || widget.clearButton || widget.obscureText ? BoxConstraints.tightFor(height: 40, width: 40) : null,
              suffixIcon: widget.trailingIcon != null
                  ? Icon(widget.trailingIcon, color: kFontsColor)
                  : widget.clearButton || widget.obscureText
                      ? AnimatedOpacity(
                          duration: Duration(milliseconds: 200),
                          opacity: safeIsNotEmpty(_textController.text) ? 1 : 0,
                          child: InkWell(
                            onTap: () => setState(() {
                              if (safeIsNotEmpty(_textController.text)) widget.obscureText ? hidePassword = !hidePassword : _textController.clear();
                              if (widget.onChanged != null) widget.onChanged(_textController?.text ?? '');
                            }),
                            child: Icon(
                              widget.obscureText ? CupertinoIcons.eye_solid : CupertinoIcons.clear_circled_solid,
                              color: kFontsColor,
                              size: widget.obscureText ? 25 : 20,
                            ),
                          ),
                        )
                      : null,
              fillColor: widget.fillColor ?? Colors.white,
              filled: widget.isBordered ? false : true,
              labelText: widget.label,
              contentPadding: widget.padding ?? EdgeInsets.symmetric(horizontal: 15, vertical: widget.maxLines != null ? 15 : 0),
              focusedBorder: OutlineInputBorder(
                gapPadding: 5,
                borderSide: BorderSide(color: kActiveColor),
                borderRadius: kBorderRadius,
              ),
              enabledBorder: OutlineInputBorder(
                gapPadding: 5,
                borderSide: BorderSide(color: widget.isBordered ? kActiveColor : kTransparent),
                borderRadius: kBorderRadius,
              ),
              disabledBorder: OutlineInputBorder(
                gapPadding: 5,
                borderSide: BorderSide(color: widget.isBordered ? kActiveColor : kTransparent),
                borderRadius: kBorderRadius,
              ),
              hintText: widget.hint,
              hintStyle: widget.hintStyle ?? kHintTS,
            ),
            onChanged: (value) {
              if (widget.onChanged != null) widget.onChanged(value);
              setState(() {});
            },
          ),
        ),
      ),
    );
  }
}
