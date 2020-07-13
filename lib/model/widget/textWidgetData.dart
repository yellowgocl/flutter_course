import 'dart:convert';

import 'package:course_book/utils/widgetUtil.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
part 'textWidgetData.g.dart';

@JsonSerializable()
class TextWidgetData {
  String data;
  int maxLines;
  String semanticsLabel;
  bool softWrap;
  double textScaleFactor;
  TextWidgetData(this.data);
  @JsonKey(fromJson: _parseTextStyle, toJson: _composeTextStyle)
  TextStyle textStyle;

  // @JsonKey(
  //     fromJson: _parseTextSpan, toJson: _composeTextSpan, includeIfNull: false)
  // TextSpanWidgetData textSpan;

  @JsonKey(fromJson: _parseTextOverflow, toJson: _composeTextOverflow)
  TextOverflow overflow;

  @JsonKey(fromJson: _parseTextDirection, toJson: _composeTextDirection)
  TextDirection textDirection;

  @JsonKey(fromJson: _parseTextAlign, toJson: _composeTextAlign)
  TextAlign textAlign;

  factory TextWidgetData.fromJson(Map<String, dynamic> json) =>
      _$TextWidgetDataFromJson(json);
  Map<String, dynamic> toJson() => _$TextWidgetDataToJson(this);

  static TextStyle _parseTextStyle(Map<String, dynamic> value) =>
      WidgetUtil.parseTextStyle(value);
  static Map<String, dynamic> _composeTextStyle(TextStyle textStyle) =>
      WidgetUtil.composeTextStyle(textStyle);

  static TextOverflow _parseTextOverflow(String overflow) =>
      WidgetUtil.parseTextOverflow(overflow);
  static int _composeTextOverflow(TextOverflow overflow) => overflow?.index;

  static TextDirection _parseTextDirection(textDirection) =>
      WidgetUtil.parseTextDirection(textDirection);
  static int _composeTextDirection(TextDirection textDirection) =>
      textDirection?.index;

  static TextAlign _parseTextAlign(textAlign) =>
      WidgetUtil.parseTextAlign(textAlign);
  static int _composeTextAlign(TextAlign textAlign) => textAlign?.index;

  // static TextSpanWidgetData _parseTextSpan(Map<String, dynamic> textSpan) =>
  //     TextSpanWidgetData.fromJson(textSpan);
  // static Map<String, dynamic> _composeTextSpan(TextSpanWidgetData textSpan) =>
  //     textSpan.toJson();

  @override
  String toString() {
    // TODO: implement toString
    return toJson().toString();
  }
}

@JsonSerializable()
class TextSpanWidgetData extends TextWidgetData {
  String onClick;

  TextSpanWidgetData(String data) : super(data);

  @JsonKey(fromJson: _parseTextSpanChildren, toJson: _composeTextSpanChildren)
  List<TextSpanWidgetData> children;

  static List<TextSpanWidgetData> _parseTextSpanChildren(
      List<Map<String, dynamic>> children) {
    List<TextSpanWidgetData> result = [];
    for (var child in children) {
      if (child != null) {
        result.add(TextSpanWidgetData.fromJson(child));
      }
    }
    return result;
  }

  static List<Map<String, dynamic>> _composeTextSpanChildren(
      List<TextSpanWidgetData> children) {
    List<Map<String, dynamic>> result = [];
    if (children ?? children.isNotEmpty) {
      for (TextSpanWidgetData child in children) {
        result.add(child.toJson());
      }
    }
    return result;
  }

  factory TextSpanWidgetData.fromJson(Map<String, dynamic> json) =>
      _$TextSpanWidgetDataFromJson(json);
  Map<String, dynamic> toJson() => _$TextSpanWidgetDataToJson(this);

  @override
  String toString() {
    // TODO: implement toString
    return toJson().toString();
  }
}
