import 'package:course_book/http/request.dart';
import 'package:json_annotation/json_annotation.dart';
part 'auth.g.dart';

@JsonSerializable()
class Auth {
  String authorization;
  int expireIn;
  Auth(this.authorization, this.expireIn);
  
  factory Auth.fromJson(Map<String, dynamic> json) => _$AuthFromJson(json);
  Map<String, dynamic> toJson() => _$AuthToJson(this);
  
  @override
  String toString() {
    // TODO: implement toString
    return toJson().toString();
  }
}
