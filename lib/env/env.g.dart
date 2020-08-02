// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'env.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Env _$EnvFromJson(Map<String, dynamic> json) {
  return Env(
    json['host'] as String,
    json['speech'] as String,
    json['appId'] as String,
    json['deviceId'] as String,
    json['courseId'] as String,
  )..env = json['env'] as String;
}

Map<String, dynamic> _$EnvToJson(Env instance) => <String, dynamic>{
      'host': instance.host,
      'speech': instance.speech,
      'appId': instance.appId,
      'deviceId': instance.deviceId,
      'courseId': instance.courseId,
      'env': instance.env,
    };
