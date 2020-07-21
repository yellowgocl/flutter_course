import 'package:flutter/material.dart';
import 'package:course_book/utils/widget_util.dart';
import 'package:json_annotation/json_annotation.dart';

part 'containerWidgetData.g.dart';

@JsonSerializable()
class ContainerWidgetData {
  ContainerWidgetData();

  @JsonKey(fromJson: _parseAlignment, toJson: _composeAlignment)
  AlignmentGeometry alignment;

  @JsonKey(fromJson: _parseMargin, toJson: _composeMargin)
  EdgeInsetsGeometry margin;

  @JsonKey(fromJson: _parsePadding, toJson: _composePadding)
  EdgeInsetsGeometry padding;

  @JsonKey(fromJson: _parseBoxConstraints, toJson: _composeBoxConstraints)
  BoxConstraints constraints;

  @JsonKey(fromJson: _parseColor, toJson: _composeColor)
  Color color;

  Map<String, dynamic> child;

  @JsonKey(fromJson: WidgetUtil.parseWidth, toJson: WidgetUtil.parseDouble)
  double width;

  @JsonKey(fromJson: WidgetUtil.parseHeight, toJson: WidgetUtil.parseDouble)
  double height;

  static Alignment _parseAlignment(dynamic value) =>
      WidgetUtil.parseAlignment(value);
  static List<double> _composeAlignment(Alignment value) => [value.x, value.y];

  static Color _parseColor(dynamic value) => WidgetUtil.parseColor(value);
  static String _composeColor(Color value) => WidgetUtil.composeColor(value);

  static EdgeInsetsGeometry _parseMargin(dynamic value) =>
      WidgetUtil.parseEdgeInsetsGeometry(value);
  static Map<String, dynamic> _composeMargin(EdgeInsetsGeometry value) =>
      WidgetUtil.composeEdgeInsetsGeometry(value);

  static EdgeInsetsGeometry _parsePadding(dynamic value) =>
      WidgetUtil.parseEdgeInsetsGeometry(value);
  static Map<String, dynamic> _composePadding(EdgeInsetsGeometry value) =>
      WidgetUtil.composeEdgeInsetsGeometry(value);

  static BoxConstraints _parseBoxConstraints(dynamic value) =>
      WidgetUtil.parseBoxConstraints(value);
  static Map<String, double> _composeBoxConstraints(BoxConstraints value) =>
      WidgetUtil.composeBoxContraints(value);

  factory ContainerWidgetData.fromJson(Map<String, dynamic> json) =>
      _$ContainerWidgetDataFromJson(json);
  Map<String, dynamic> toJson() => _$ContainerWidgetDataToJson(this);
}
