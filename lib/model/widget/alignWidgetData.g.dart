// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'alignWidgetData.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AlignWidgetData _$AlignWidgetDataFromJson(Map<String, dynamic> json) {
  return AlignWidgetData()
    ..child = json['child'] as Map<String, dynamic>
    ..widthFactor = (json['widthFactor'] as num)?.toDouble()
    ..heightFactor = (json['heightFactor'] as num)?.toDouble()
    ..alignment = AlignWidgetData._parseAlignment(json['alignment']);
}

Map<String, dynamic> _$AlignWidgetDataToJson(AlignWidgetData instance) =>
    <String, dynamic>{
      'child': instance.child,
      'widthFactor': instance.widthFactor,
      'heightFactor': instance.heightFactor,
      'alignment': AlignWidgetData._composeAlignment(instance.alignment),
    };
