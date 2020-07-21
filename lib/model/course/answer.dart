import 'package:json_annotation/json_annotation.dart';
part 'answer.g.dart';

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
}
