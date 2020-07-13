// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'flexWidgetData.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FlexWidgetData _$FlexWidgetDataFromJson(Map<String, dynamic> json) {
  return FlexWidgetData()
    ..key = json['key'] as String
    ..children = (json['children'] as List)
        ?.map((e) => e as Map<String, dynamic>)
        ?.toList()
    ..crossAxisAlignment =
        FlexWidgetData._parseCrossAxisAlignment(json['crossAxisAlignment'])
    ..mainAxisAlignment =
        FlexWidgetData._parseMainAxisAlignment(json['mainAxisAlignment'])
    ..textBaseline = FlexWidgetData._parseTextBaseline(json['textBaseline'])
    ..textDirection = FlexWidgetData._parseTextDirection(json['textDirection'])
    ..verticalDirection =
        FlexWidgetData._parseVerticalDirection(json['verticalDirection'])
    ..direction = FlexWidgetData._parseDirection(json['direction'])
    ..mainAxisSize = FlexWidgetData._parseMainAxisSize(json['mainAxisSize']);
}

Map<String, dynamic> _$FlexWidgetDataToJson(FlexWidgetData instance) =>
    <String, dynamic>{
      'key': instance.key,
      'children': instance.children,
      'crossAxisAlignment': FlexWidgetData._composeCrossAxisAlignment(
          instance.crossAxisAlignment),
      'mainAxisAlignment':
          FlexWidgetData._composeMainAxisAlignment(instance.mainAxisAlignment),
      'textBaseline':
          FlexWidgetData._composeTextBaseline(instance.textBaseline),
      'textDirection':
          FlexWidgetData._composeTextDirection(instance.textDirection),
      'verticalDirection':
          FlexWidgetData._composeVerticalDirection(instance.verticalDirection),
      'direction': FlexWidgetData._composeDirection(instance.direction),
      'mainAxisSize':
          FlexWidgetData._composeMainAxisSize(instance.mainAxisSize),
    };
