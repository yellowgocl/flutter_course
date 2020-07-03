
import 'package:json_annotation/json_annotation.dart';
part 'textWidgetData.g.dart';

@JsonSerializable()
class TextWidgetData {
  String data;
  int maxLines;

  factory TextWidgetData.fromJson(Map<String, dynamic> json) => _$TextWidgetDataFromJson(json);
  Map<String, dynamic> toJson() => _$TextWidgetDataToJson(this);
  
  @override
  String toString() {
    // TODO: implement toString
    return toJson().toString();
  }
}
