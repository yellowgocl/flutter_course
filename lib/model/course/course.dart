import 'package:course_book/core/enums.dart';
import 'package:course_book/utils/util.dart';
import 'package:json_annotation/json_annotation.dart';
part 'course.g.dart';

@JsonSerializable()
class Course {
  dynamic id;
  int updateDate;
  String media;
  String name;
  Map<String, dynamic> global;

  // @JsonKey(fromJson: _parsePoints, toJson: _composePoints)
  List<Point> points;
  // static List<Point> _parsePoints(List<dynamic> value) =>
  //     value.map((e) => Point.fromJson(e));
  // static List<Map<String, dynamic>> _composePoints(List<Point> value) =>
  //     value.map((e) => e.toJson());

  Course(this.id, this.name, this.updateDate, this.media, this.global);

  factory Course.fromJson(Map<String, dynamic> json) => _$CourseFromJson(json);
  Map<String, dynamic> toJson() => _$CourseToJson(this);

  @override
  String toString() {
    // TODO: implement toString
    return toJson().toString();
  }
}

@JsonSerializable()
class Answer {
  dynamic value;
  String name;
  bool standard;
  Answer(this.value, this.name, this.standard);

  factory Answer.fromJson(Map<String, dynamic> json) => _$AnswerFromJson(json);
  Map<String, dynamic> toJson() => _$AnswerToJson(this);

  @override
  String toString() {
    // TODO: implement toString
    return toJson().toString();
  }

  @override
  bool operator ==(other) {
    if (other is! Answer) {
      return false;
    }
    final Answer o = other;
    return o.name == name && o.value == value && o.standard == standard;
  }
}

@JsonSerializable()
class Point {
  dynamic id;
  int skip;
  String text;
  String description;

  Map<String, dynamic> scene;

  //@JsonKey(fromJson: _parseAnswers, toJson: _composeAnswers)
  // List<Answer> answers;
  // static List<Answer> _parseAnswers(List<Map<String, dynamic>> value) =>
  //     value.map((e) => Answer.fromJson(e));
  // static List<Map<String, dynamic>> _composeAnswers(List<Answer> value) =>
  //     value.map((e) => e.toJson());

  @JsonKey(fromJson: _parseDuration, toJson: _composeDuration)
  Duration duration;
  static Duration _parseDuration(int value) => Util.parseDuration(value);
  static int _composeDuration(Duration value) => value?.inMilliseconds;

  @JsonKey(fromJson: _parsePointType, toJson: _composePointType, required: true)
  PointType type;
  static PointType _parsePointType(dynamic value) => Util.parsePointType(value);
  static int _composePointType(PointType value) => Util.composePointType(value);

  Point(this.type, this.duration, this.text, this.skip, this.description);

  factory Point.fromJson(Map<String, dynamic> json) => _$PointFromJson(json);
  Map<String, dynamic> toJson() => _$PointToJson(this);

  @override
  String toString() {
    // TODO: implement toString
    return toJson().toString();
  }

  bool get isQuestion {
    return (type == PointType.answer ||
        type == PointType.report ||
        type == PointType.speech);
  }
}
