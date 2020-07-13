// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'textWidgetData.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TextWidgetData _$TextWidgetDataFromJson(Map<String, dynamic> json) {
  return TextWidgetData(
    json['data'] as String,
  )
    ..maxLines = json['maxLines'] as int
    ..semanticsLabel = json['semanticsLabel'] as String
    ..softWrap = json['softWrap'] as bool
    ..textScaleFactor = (json['textScaleFactor'] as num)?.toDouble()
    ..textStyle = TextWidgetData._parseTextStyle(
        json['textStyle'] as Map<String, dynamic>)
    ..overflow = TextWidgetData._parseTextOverflow(json['overflow'] as String)
    ..textDirection = TextWidgetData._parseTextDirection(json['textDirection'])
    ..textAlign = TextWidgetData._parseTextAlign(json['textAlign']);
}

Map<String, dynamic> _$TextWidgetDataToJson(TextWidgetData instance) =>
    <String, dynamic>{
      'data': instance.data,
      'maxLines': instance.maxLines,
      'semanticsLabel': instance.semanticsLabel,
      'softWrap': instance.softWrap,
      'textScaleFactor': instance.textScaleFactor,
      'textStyle': TextWidgetData._composeTextStyle(instance.textStyle),
      'overflow': TextWidgetData._composeTextOverflow(instance.overflow),
      'textDirection':
          TextWidgetData._composeTextDirection(instance.textDirection),
      'textAlign': TextWidgetData._composeTextAlign(instance.textAlign),
    };

TextSpanWidgetData _$TextSpanWidgetDataFromJson(Map<String, dynamic> json) {
  return TextSpanWidgetData(
    json['data'] as String,
  )
    ..maxLines = json['maxLines'] as int
    ..semanticsLabel = json['semanticsLabel'] as String
    ..softWrap = json['softWrap'] as bool
    ..textScaleFactor = (json['textScaleFactor'] as num)?.toDouble()
    ..textStyle = TextWidgetData._parseTextStyle(
        json['textStyle'] as Map<String, dynamic>)
    ..overflow = TextWidgetData._parseTextOverflow(json['overflow'] as String)
    ..textDirection = TextWidgetData._parseTextDirection(json['textDirection'])
    ..textAlign = TextWidgetData._parseTextAlign(json['textAlign'])
    ..onClick = json['onClick'] as String
    ..children = TextSpanWidgetData._parseTextSpanChildren(
        json['children'] as List<Map<String, dynamic>>);
}

Map<String, dynamic> _$TextSpanWidgetDataToJson(TextSpanWidgetData instance) =>
    <String, dynamic>{
      'data': instance.data,
      'maxLines': instance.maxLines,
      'semanticsLabel': instance.semanticsLabel,
      'softWrap': instance.softWrap,
      'textScaleFactor': instance.textScaleFactor,
      'textStyle': TextWidgetData._composeTextStyle(instance.textStyle),
      'overflow': TextWidgetData._composeTextOverflow(instance.overflow),
      'textDirection':
          TextWidgetData._composeTextDirection(instance.textDirection),
      'textAlign': TextWidgetData._composeTextAlign(instance.textAlign),
      'onClick': instance.onClick,
      'children':
          TextSpanWidgetData._composeTextSpanChildren(instance.children),
    };
