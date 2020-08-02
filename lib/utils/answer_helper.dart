import 'package:course_book/model/course/course.dart';

class AnswerHelper {
  static List<Answer> answers;

  static check(Answer answer) {
    bool result = answers.contains(answer);
    result ? answers.remove(answer) : answers.add(answer);
    return result;
  }
}
