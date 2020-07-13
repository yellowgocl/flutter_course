import 'package:flutter/material.dart';
import 'package:course_book/utils/widgetUtil.dart';
import 'package:json_annotation/json_annotation.dart';

part 'alignWidgetData.g.dart';

@JsonSerializable()
class AlignWidgetData {
  Map<String, dynamic> child;
  double widthFactor;
  double heightFactor;

  @JsonKey(
      fromJson: _parseAlignment, toJson: _composeAlignment, nullable: false)
  AlignmentGeometry alignment;

  AlignWidgetData();
  factory AlignWidgetData.fromJson(Map<String, dynamic> json) =>
      _$AlignWidgetDataFromJson(json);
  Map<String, dynamic> toJson() => _$AlignWidgetDataToJson(this);

  static Alignment _parseAlignment(dynamic value) =>
      WidgetUtil.parseAlignment(value);
  static List<double> _composeAlignment(Alignment value) => [value.x, value.y];
}
