import 'package:course_book/core/enums.dart';
import 'package:course_book/model/course/answer.dart';
import 'package:course_book/utils/util.dart';
import 'package:json_annotation/json_annotation.dart';
part 'point.g.dart';

@JsonSerializable()
class Point {
  int duration;
  int skip;
  String text;
  String description;

  Map<String, dynamic> scene;

  @JsonKey(fromJson: _parseAnswers, toJson: _composeAnswers, nullable: false)
  List<Answer> answers;
  static List<Answer> _parseAnswers(List<Map<String, dynamic>> value) =>
      value.map((e) => Answer.fromJson(e));
  static List<Map<String, dynamic>> _composeAnswers(List<Answer> value) =>
      value.map((e) => e.toJson());

  @JsonKey(
      fromJson: _parsePointType, toJson: _composePointType, nullable: false)
  PointType type;
  static PointType _parsePointType(dynamic value) => Util.parsePointType(value);
  static int _composePointType(PointType value) => Util.composePointType(value);

  Point(this.type, this.duration, this.text, this.skip, this.description,
      this.answers);

  factory Point.fromJson(Map<String, dynamic> json) => _$PointFromJson(json);
  Map<String, dynamic> toJson() => _$PointToJson(this);

  @override
  String toString() {
    // TODO: implement toString
    return toJson().toString();
  }
}
