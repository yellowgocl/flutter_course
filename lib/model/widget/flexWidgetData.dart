import 'package:flutter/material.dart';
import 'package:course_book/utils/widget_util.dart';
import 'package:json_annotation/json_annotation.dart';

part 'flexWidgetData.g.dart';

@JsonSerializable()
class FlexWidgetData {
  String key;
  List<Map<String, dynamic>> children;

  @JsonKey(
    fromJson: _parseCrossAxisAlignment,
    toJson: _composeCrossAxisAlignment,
  )
  CrossAxisAlignment crossAxisAlignment;

  @JsonKey(
    fromJson: _parseMainAxisAlignment,
    toJson: _composeMainAxisAlignment,
  )
  MainAxisAlignment mainAxisAlignment;

  @JsonKey(
    fromJson: _parseTextBaseline,
    toJson: _composeTextBaseline,
  )
  TextBaseline textBaseline;

  @JsonKey(
    fromJson: _parseTextDirection,
    toJson: _composeTextDirection,
  )
  TextDirection textDirection;

  @JsonKey(
    fromJson: _parseVerticalDirection,
    toJson: _composeVerticalDirection,
  )
  VerticalDirection verticalDirection;

  @JsonKey(
    fromJson: _parseDirection,
    toJson: _composeDirection,
  )
  Axis direction;

  @JsonKey(
    fromJson: _parseMainAxisSize,
    toJson: _composeMainAxisSize,
  )
  MainAxisSize mainAxisSize;

  FlexWidgetData();
  factory FlexWidgetData.fromJson(Map<String, dynamic> json) =>
      _$FlexWidgetDataFromJson(json);
  Map<String, dynamic> toJson() => _$FlexWidgetDataToJson(this);

  static CrossAxisAlignment _parseCrossAxisAlignment(dynamic value) =>
      WidgetUtil.parseCrossAxisAlignment(value);
  static int _composeCrossAxisAlignment(CrossAxisAlignment value) =>
      value.index;

  static MainAxisAlignment _parseMainAxisAlignment(dynamic value) =>
      WidgetUtil.parseMainAxisAlignment(value);
  static int _composeMainAxisAlignment(MainAxisAlignment value) => value.index;

  static TextBaseline _parseTextBaseline(dynamic value) =>
      WidgetUtil.parseTextBaseline(value);
  static int _composeTextBaseline(TextBaseline value) => value.index;

  static TextDirection _parseTextDirection(dynamic value) =>
      WidgetUtil.parseTextDirection(value);
  static int _composeTextDirection(TextDirection value) => value.index;

  static VerticalDirection _parseVerticalDirection(dynamic value) =>
      WidgetUtil.parseVerticalDirection(value);
  static int _composeVerticalDirection(VerticalDirection value) => value.index;

  static Axis _parseDirection(dynamic value) => WidgetUtil.parseAxis(value);
  static int _composeDirection(Axis value) => value.index;

  static MainAxisSize _parseMainAxisSize(dynamic value) =>
      WidgetUtil.parseMainAxisSize(value);
  static int _composeMainAxisSize(MainAxisSize value) => value.index;
}
