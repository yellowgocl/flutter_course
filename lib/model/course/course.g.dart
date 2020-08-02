// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Course _$CourseFromJson(Map<String, dynamic> json) {
  return Course(
    json['id'],
    json['name'] as String,
    json['updateDate'] as int,
    json['media'] as String,
    json['global'] as Map<String, dynamic>,
  )..points = (json['points'] as List)
      ?.map((e) => e == null ? null : Point.fromJson(e as Map<String, dynamic>))
      ?.toList();
}

Map<String, dynamic> _$CourseToJson(Course instance) => <String, dynamic>{
      'id': instance.id,
      'updateDate': instance.updateDate,
      'media': instance.media,
      'name': instance.name,
      'global': instance.global,
      'points': instance.points,
    };

Answer _$AnswerFromJson(Map<String, dynamic> json) {
  return Answer(
    json['value'],
    json['name'] as String,
    json['standard'] as bool,
  );
}

Map<String, dynamic> _$AnswerToJson(Answer instance) => <String, dynamic>{
      'value': instance.value,
      'name': instance.name,
      'standard': instance.standard,
    };

Point _$PointFromJson(Map<String, dynamic> json) {
  $checkKeys(json, requiredKeys: const ['type']);
  return Point(
    Point._parsePointType(json['type']),
    Point._parseDuration(json['duration'] as int),
    json['text'] as String,
    json['skip'] as int,
    json['description'] as String,
  )
    ..id = json['id']
    ..scene = json['scene'] as Map<String, dynamic>;
}

Map<String, dynamic> _$PointToJson(Point instance) => <String, dynamic>{
      'id': instance.id,
      'skip': instance.skip,
      'text': instance.text,
      'description': instance.description,
      'scene': instance.scene,
      'duration': Point._composeDuration(instance.duration),
      'type': Point._composePointType(instance.type),
    };
