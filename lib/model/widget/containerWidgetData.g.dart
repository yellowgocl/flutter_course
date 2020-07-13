// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'containerWidgetData.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ContainerWidgetData _$ContainerWidgetDataFromJson(Map<String, dynamic> json) {
  return ContainerWidgetData()
    ..alignment = ContainerWidgetData._parseAlignment(json['alignment'])
    ..margin = ContainerWidgetData._parseMargin(json['margin'])
    ..padding = ContainerWidgetData._parsePadding(json['padding'])
    ..constraints =
        ContainerWidgetData._parseBoxConstraints(json['constraints'])
    ..color = ContainerWidgetData._parseColor(json['color'])
    ..child = json['child'] as Map<String, dynamic>
    ..width = WidgetUtil.parseWidth(json['width'])
    ..height = WidgetUtil.parseHeight(json['height']);
}

Map<String, dynamic> _$ContainerWidgetDataToJson(
        ContainerWidgetData instance) =>
    <String, dynamic>{
      'alignment': ContainerWidgetData._composeAlignment(instance.alignment),
      'margin': ContainerWidgetData._composeMargin(instance.margin),
      'padding': ContainerWidgetData._composePadding(instance.padding),
      'constraints':
          ContainerWidgetData._composeBoxConstraints(instance.constraints),
      'color': ContainerWidgetData._composeColor(instance.color),
      'child': instance.child,
      'width': WidgetUtil.parseDouble(instance.width),
      'height': WidgetUtil.parseDouble(instance.height),
    };
