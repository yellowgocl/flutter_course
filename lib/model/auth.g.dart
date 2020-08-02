// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Auth _$AuthFromJson(Map<String, dynamic> json) {
  return Auth(
    json['authorization'] as String,
    json['expireIn'] as int,
  );
}

Map<String, dynamic> _$AuthToJson(Auth instance) => <String, dynamic>{
      'authorization': instance.authorization,
      'expireIn': instance.expireIn,
    };
