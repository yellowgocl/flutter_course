import 'package:json_annotation/json_annotation.dart';
part 'env.g.dart';

@JsonSerializable()
class Env {
  String host;
  String speech;
  String appId;
  String deviceId;
  String courseId;
  String env;
  Env(this.host, this.speech, this.appId, this.deviceId, this.courseId);
  get isProd {
    return env == 'prod';
  }
  factory Env.fromJson(Map<String, dynamic> json) => _$EnvFromJson(json);
  Map<String, dynamic> toJson() => _$EnvToJson(this);
  
  @override
  String toString() {
    // TODO: implement toString
    return toJson().toString();
  }
}
